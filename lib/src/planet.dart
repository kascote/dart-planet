import 'dart:io';

import 'package:dart_planet/src/html_generator.dart';
import 'package:drift/drift.dart';
import 'package:html/parser.dart' show parse;
import 'package:logging/logging.dart';
import 'package:universal_feed/universal_feed.dart';

import './model/feeds.dart';
import './shared/exit_code.dart';
import './shared/fetch_cache.dart';
import './shared/fetcher.dart';
import './shared/utils.dart';
import 'config.dart';

final log = Logger('planet');

/// Feed Planet
///
/// Administer a list of feeds and can generate a static site from them,
/// a Planet.
///
/// If there are errors retrieving the feed, it will be flagged and if there
/// are more than maxAllowedErrors errors, the feed will be marked as
/// inactive.
///
/// The feeds deactivated will not be processed until the user manually
/// activate them. The inactive feeds will not be used for the static site
/// generation except if they are marked as "stale".
///
class Planet {
  Config cfg = Config.instance;
  Planet(this.db);

  final PlanetDB db;

  /// Add a feed to the system
  ///
  /// returns 0 on success
  /// any value greater than 0 is an error
  Future<int> addFeed(Uri url, String handle, String? baseUrl) async {
    log.finest('addFeed: $url, $handle');
    if (await db.feedExists(url.toString())) {
      log.warning('Feed already exists');
      return Future.value(ExitCode.alreadyExists.code);
    }

    final (rc, feed, cache) = await fetchFeed(url, '');
    if (rc > 0) return Future.value(rc);

    final today = DateTime.now().toUtc().toIso8601String();
    final feedId = await db.into(db.feeds).insert(
          FeedsCompanion.insert(
            name: feed!.title ?? '',
            htmlLink: feed.htmlLink?.href ?? '',
            xmlLink: url.toString(),
            handle: handle,
            kind: feed.meta.kind.name,
            createdAt: today,
            updatedAt: today,
            cache: cache.toString(),
            baseUrl: baseUrl ?? '',
          ),
        );
    await upsertItems(feedId, feed, today);

    return Future.value(ExitCode.success.code);
  }

  /// Update a feed by his handle
  ///
  /// returns 0 on success
  /// any value greater than 0 is an error
  Future<int> updateFeed(String handle) async {
    log.finest('updateFeed: $handle');
    final today = DateTime.now().toUtc().toIso8601String();
    final feed = await db.getFeedByHandle(handle);

    if (feed == null) {
      log.warning('Feed handle not found: [$handle]');
      return Future.value(ExitCode.error.code);
    }

    return _updateFeed(feed, today);
  }

  /// Update all the active feeds
  ///
  /// returns 0 on success
  /// any value greater than 0 is an error
  Future<int> updateFeeds() async {
    final today = DateTime.now().toUtc().toIso8601String();
    final feeds = await db.getActiveFeeds();
    log.finest('feeds to update: ${feeds.length}');

    for (final feed in feeds) {
      await _updateFeed(feed, today);
    }

    return Future.value(ExitCode.success.code);
  }

  // actual function that will update the feed
  Future<int> _updateFeed(Feed feed, String today) async {
    final (rc, feedUpdated, cache) = await fetchFeed(Uri.parse(feed.xmlLink), feed.cache);
    if (rc > 0) return Future.value(rc);

    if (cache != null) {
      await db.updateFeedTable(
        FeedsCompanion(
          id: Value(feed.id),
          cache: Value(cache.toString()),
          updatedAt: Value(today),
        ),
      );
    } else {
      await db.updateFeedTable(
        FeedsCompanion(
          id: Value(feed.id),
          updatedAt: Value(today),
        ),
      );
    }

    log.finer('> ${feed.name}: ${feedUpdated!.items.length}');
    await clearErrorsAndActivate(feed);
    await upsertItems(feed.id, feedUpdated, today);

    return Future.value(ExitCode.success.code);
  }

  /// Add or Update a feed item by his guid
  Future<void> upsertItems(int feedId, UniversalFeed feedUpdated, String today) async {
    for (final item in feedUpdated.items) {
      if (item.guid == null || item.guid!.trim().isEmpty) {
        // if there is no guid, we will use the title as guid
        if (item.title == null || item.title!.trim().isEmpty) {
          log.warning('skipping item without guid and title. feedId: $feedId');
          continue;
        }
        item.guid = item.title;
      }

      final itemExists = await db.itemExists(item.guid!);
      if (itemExists) {
        log.finest('updating ${item.guid}');
        await updateItem(feedId, feedUpdated, item, today);
      } else {
        log.finest('adding ${item.guid}');
        await addItem(feedId, feedUpdated, item, today);
      }
    }
  }

  (String, String) _getThumbDescription(UniversalFeed feed, Item item) {
    var thumbnail = '';
    var description = item.description ?? '';

    if (feed.meta.extensions.hasMedia) {
      final group = item.media?.group.firstOrNull;
      if (group != null) {
        thumbnail = group.thumbnails.firstOrNull?.url ?? '';
        description = group.description ?? description;
      } else {
        thumbnail = item.media?.thumbnails.firstOrNull?.url ?? '';
        description = item.media?.description ?? description;
      }
    }

    final doc = parse(description);
    description = parse(doc.body?.text).documentElement?.text ?? '';

    return (thumbnail.trim(), description.trim());
  }

  /// Ads a feed item to the system
  Future<int> addItem(int feedId, UniversalFeed feed, Item item, String today) async {
    final (thumbnail, description) = _getThumbDescription(feed, item);

    return db.into(db.feedItem).insert(
          FeedItemCompanion.insert(
            feed: feedId,
            guid: item.guid ?? '',
            title: item.title ?? '',
            link: item.links.firstOrNull?.href ?? '',
            thumbnail: thumbnail,
            description: description,
            content: '', // item.content.join(' '),
            createdAt: item.published?.parseValue()?.toUtc().toIso8601String() ?? today,
            updatedAt: item.updated?.parseValue()?.toUtc().toIso8601String() ?? today,
          ),
        );
  }

  /// Updates an item
  Future<int> updateItem(int feedId, UniversalFeed feed, Item item, String today) async {
    final (thumbnail, description) = _getThumbDescription(feed, item);

    return (db.update(db.feedItem)..where((t) => t.guid.equals(item.guid ?? ''))).write(
      FeedItemCompanion(
        title: Value(item.title ?? ''),
        link: Value(item.links.firstOrNull?.href ?? ''),
        description: Value(description),
        thumbnail: Value(thumbnail),
        // content: Value(item.content.map((c) => c.value).join(' ')),
        updatedAt: Value(item.updated?.parseValue()?.toUtc().toIso8601String() ?? ''),
      ),
    );
  }

  /// Tries to retrieve a feed using the url and the cache values if they exists
  Future<(int, UniversalFeed?, FetchCache?)> fetchFeed(Uri url, String cacheStr) async {
    final fetcher = Fetcher(log: log);
    log.finest('fetching $url');
    final response = await fetcher.fetch(url, FetchCache.fromString(cacheStr));

    if (response.result != FetchResultType.success) {
      if (response.result == FetchResultType.notModified) {
        log.finest('not modified');
        return Future.value((ExitCode.notModified.code, null, null));
      }
      log.severe('Error fetching feed: ${response.message}');
      await markError(url.toString());
      return Future.value((ExitCode.error.code, null, response.cache));
    }

    try {
      final feed = UniversalFeed.parseFromString(response.body);
      return Future.value((ExitCode.success.code, feed, response.cache));
    } catch (e) {
      await markError(url.toString());
      // if there is an error parsing, no return cache, so the next fetch
      // will retrieve data again
      return Future.value((ExitCode.error.code, null, null));
    }
  }

  Future<int> generatePlanet() async {
    final items = await db.getLastFeedItems().get();
    stdout.write(await htmlGenerator(db, items));

    return ExitCode.success.code;
  }

  Future<int> clearAllCache() async {
    final feeds = await db.getActiveFeeds();
    for (final feed in feeds) {
      await db.updateFeedTable(
        FeedsCompanion(
          id: Value(feed.id),
          cache: const Value(''),
        ),
      );
    }

    return ExitCode.success.code;
  }

  Future<int> clearCache(String handle) async {
    final feed = await db.getFeedByHandle(handle);
    if (feed == null) {
      log.severe('Feed handle not found: [$handle]');
      return Future.value(ExitCode.error.code);
    }

    await db.updateFeedTable(
      FeedsCompanion(
        id: Value(feed.id),
        cache: const Value(''),
      ),
    );

    return ExitCode.success.code;
  }

  /// Mark a feed with an error and deactivate it if has more than maxAllowedErrors errors
  Future<void> markError(String url) async {
    final feed = await db.getFeedByUrl(url);

    if (feed == null) {
      log.severe('unable to update error count: [$url]');
      return;
    }

    return db.updateFeedTable(
      FeedsCompanion(
        id: Value(feed.id),
        errors: Value(feed.errors + 1),
        active: Value(feed.errors <= cfg.getInt('maxAllowedErrors') ? 1 : 0),
      ),
    );
  }

  /// Clears the error count for a feed
  Future<void> clearErrorsAndActivate(Feed feed) async {
    return db.updateFeedTable(
      FeedsCompanion(
        id: Value(feed.id),
        errors: const Value(0),
        active: const Value(1),
      ),
    );
  }

  /// Clear the error count for a feed and activate it
  Future<int> clearFeedErrors(String handle) async {
    final feed = await db.getFeedByHandle(handle);
    if (feed == null) {
      log.severe('Feed handle not found: [$handle]');
      return Future.value(ExitCode.error.code);
    }

    return clearErrorsAndActivate(feed).then((_) => ExitCode.success.code).catchError((_) => ExitCode.error.code);
  }

  /// Clear the error count for all the feeds and activate them
  Future<int> clearAllFeedErrors() async {
    final feeds = await db.getInActiveFeeds();
    for (final feed in feeds) {
      await clearErrorsAndActivate(feed);
    }

    return ExitCode.success.code;
  }

  void _printFeed(List<Feed> feeds) {
    for (final feed in feeds) {
      stdout.writeln(
        '${feed.name.take(38).padRight(40)} - ${feed.handle.padRight(25)} - ${feed.active} - ${feed.errors} - ${feed.xmlLink}',
      );
    }
  }

  /// List all the feeds
  /// if handle is not null, list only the feed with that handle
  Future<int> listFeed({String? handle}) async {
    _printFeed(await db.getFeeds(handle: handle));
    return ExitCode.success.code;
  }

  /// List Feeds with Error
  /// List all the feeds with errors
  Future<int> listFeedsWithError() async {
    _printFeed(await db.getFeedsWithError());
    return ExitCode.success.code;
  }

  Future<int> listFeedsDisabled() async {
    _printFeed(await db.getInActiveFeeds(actives: false));
    return ExitCode.success.code;
  }
}
