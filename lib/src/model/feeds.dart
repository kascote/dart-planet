// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import '../config.dart';

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'feeds.g.dart';

class Feeds extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get htmlLink => text().named('html_link')();
  TextColumn get xmlLink => text().named('xml_link')();
  TextColumn get handle => text().named('handle')();
  IntColumn get order => integer().named('order').withDefault(const Constant(0))();
  IntColumn get stale => integer().named('stale').withDefault(const Constant(1))();
  IntColumn get errors => integer().named('errors').withDefault(const Constant(0))();
  IntColumn get active => integer().named('active').withDefault(const Constant(1))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  TextColumn get kind => text().named('kind')(); // atom, rss, json, etc
  TextColumn get cache => text().named('cache')();
  TextColumn get baseUrl => text().named('base_url')();
}

class FeedItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get feed => integer().references(Feeds, #id)();
  TextColumn get guid => text().named('guid')();
  TextColumn get title => text().named('title')();
  TextColumn get link => text().named('link')();
  TextColumn get description => text().named('description')();
  TextColumn get thumbnail => text().named('thumbnail')();
  TextColumn get content => text().named('content')();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
}

@DriftDatabase(
  tables: [Feeds, FeedItem],
  queries: {
    'getLastFeedItems': '''
SELECT sub.*, feeds.** FROM (
  SELECT row_number() OVER (
    PARTITION BY feed ORDER BY feed, updated_at DESC
  ) as rnk, * FROM feed_item
) sub, feeds
  WHERE feeds.id == sub.feed
  AND feeds.active = 1
  AND sub.rnk <= 10
  ORDER BY feeds."order";
''',
  },
)
class PlanetDB extends _$PlanetDB {
  PlanetDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<bool> feedExists(String url) async {
    final resultSet = await (selectOnly(feeds)
          ..addColumns([feeds.id])
          ..where(feeds.xmlLink.equals(url)))
        .get();
    return resultSet.firstOrNull != null;
  }

  Future<Feed?> getFeedById(int feedId) async {
    final tmp = await (select(feeds)..where((tbl) => tbl.id.equals(feedId))).get();
    return tmp.firstOrNull;
  }

  Future<Feed?> getFeedByHandle(String handle) async {
    final tmp = await (select(feeds)..where((tbl) => tbl.handle.equals(handle))).get();
    return tmp.firstOrNull;
  }

  Future<Feed?> getFeedByUrl(String url) async {
    final tmp = await (select(feeds)..where((tbl) => tbl.xmlLink.equals(url))).get();
    return tmp.firstOrNull;
  }

  Future<bool> itemExists(String guid) async {
    final resultSet = await (selectOnly(feedItem)
          ..addColumns([feedItem.guid])
          ..where(feedItem.guid.equals(guid)))
        .get();
    return resultSet.firstOrNull != null;
  }

  Future<List<Feed>> getActiveFeeds() async {
    return (select(feeds)..where((tbl) => tbl.active.equals(1))).get();
  }

  Future<void> updateFeedTable(FeedsCompanion feed) {
    return (update(feeds)..where((t) => t.id.equals(feed.id.value))).write(feed);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    final cfg = Config.instance;
    final dbFile = cfg.get('dbFile');
    final homePath = cfg.get('scriptHome');

    final file = File(p.join(homePath, dbFile));
    return NativeDatabase.createInBackground(file);
  });
}
