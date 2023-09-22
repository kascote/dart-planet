import 'dart:io';

import 'package:sanitize_html/sanitize_html.dart' show sanitizeHtml;

import './model/feeds.dart';
import './shared/utils.dart';
import 'config.dart';

Future<String> htmlGenerator(PlanetDB db, List<GetLastFeedItemsResult> items) async {
  final cfg = Config.instance;
  final html = File('${cfg.get('scriptHome')}/planet.html').readAsStringSync();

  return html
      .replaceAll(RegExp('{{planetName}}'), cfg.get('planetName'))
      .replaceAll('{{planetUrl}}', cfg.get('planetUrl'))
      .replaceAll('{{description}}', cfg.get('description'))
      .replaceAll('{{keywords}}', cfg.get('keywords'))
      .replaceAll('{{dateRendered}}', DateTime.now().toIso8601String())
      .replaceAll('{{ content }}', await contentGenerator(db, items));
}

Future<String> contentGenerator(PlanetDB db, List<GetLastFeedItemsResult> items) async {
  final sb = StringBuffer();

  var feedId = -1;
  var ii = 0;
  while (ii < items.length) {
    final item = items[ii];

    if (feedId != item.feed) {
      feedId = item.feed;

      if (ii > 0) {
        sb.writeln('</div></div>');
      }

      final feedLink =
          item.feeds.htmlLink.startsWith('http') ? item.feeds.htmlLink : '${item.feeds.baseUrl}${item.feeds.htmlLink}';

      final feedName = item.feeds.displayName.isEmpty ? item.feeds.name : item.feeds.displayName;
      sb.write('''
      <div class="feed">
        <h2><a name="${item.feeds.handle}" href="$feedLink" target="_blank">$feedName</a></h2>
        <div class="feed-items">
      ''');
    }

    final description = item.description.trim().isNotEmpty
        ? sanitizeHtml(item.description, allowElementId: (_) => false).take(300)
        : '';

    final itemLink = item.link.startsWith('http') ? item.link : '${item.feeds.baseUrl}${item.link}';
    sb.writeln('''
    <div class="feed-item">
      <time datetime="${item.createdAt}" title="${item.createdAt}">${timeAgo(item.createdAt)}</time>
      <div class="item">
        <a href="$itemLink" target="_blank">${item.title}</a>
        ${description.isEmpty ? '' : '<div class="feed-item-description">$description</div>'}
      </div>
      <div class="share" title="copy url"></div>
    </div>
    ''');
    ii++;
  } // while
  sb.writeln('</div></div>');

  return sb.toString();
}
