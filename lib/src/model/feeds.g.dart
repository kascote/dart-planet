// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds.dart';

// ignore_for_file: type=lint
class $FeedsTable extends Feeds with TableInfo<$FeedsTable, Feed> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _htmlLinkMeta =
      const VerificationMeta('htmlLink');
  @override
  late final GeneratedColumn<String> htmlLink = GeneratedColumn<String>(
      'html_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _xmlLinkMeta =
      const VerificationMeta('xmlLink');
  @override
  late final GeneratedColumn<String> xmlLink = GeneratedColumn<String>(
      'xml_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _handleMeta = const VerificationMeta('handle');
  @override
  late final GeneratedColumn<String> handle = GeneratedColumn<String>(
      'handle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _staleMeta = const VerificationMeta('stale');
  @override
  late final GeneratedColumn<int> stale = GeneratedColumn<int>(
      'stale', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _errorsMeta = const VerificationMeta('errors');
  @override
  late final GeneratedColumn<int> errors = GeneratedColumn<int>(
      'errors', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<int> active = GeneratedColumn<int>(
      'active', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cacheMeta = const VerificationMeta('cache');
  @override
  late final GeneratedColumn<String> cache = GeneratedColumn<String>(
      'cache', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _baseUrlMeta =
      const VerificationMeta('baseUrl');
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
      'base_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        displayName,
        htmlLink,
        xmlLink,
        handle,
        order,
        stale,
        errors,
        active,
        createdAt,
        updatedAt,
        kind,
        cache,
        baseUrl
      ];
  @override
  String get aliasedName => _alias ?? 'feeds';
  @override
  String get actualTableName => 'feeds';
  @override
  VerificationContext validateIntegrity(Insertable<Feed> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('html_link')) {
      context.handle(_htmlLinkMeta,
          htmlLink.isAcceptableOrUnknown(data['html_link']!, _htmlLinkMeta));
    } else if (isInserting) {
      context.missing(_htmlLinkMeta);
    }
    if (data.containsKey('xml_link')) {
      context.handle(_xmlLinkMeta,
          xmlLink.isAcceptableOrUnknown(data['xml_link']!, _xmlLinkMeta));
    } else if (isInserting) {
      context.missing(_xmlLinkMeta);
    }
    if (data.containsKey('handle')) {
      context.handle(_handleMeta,
          handle.isAcceptableOrUnknown(data['handle']!, _handleMeta));
    } else if (isInserting) {
      context.missing(_handleMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    }
    if (data.containsKey('stale')) {
      context.handle(
          _staleMeta, stale.isAcceptableOrUnknown(data['stale']!, _staleMeta));
    }
    if (data.containsKey('errors')) {
      context.handle(_errorsMeta,
          errors.isAcceptableOrUnknown(data['errors']!, _errorsMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('cache')) {
      context.handle(
          _cacheMeta, cache.isAcceptableOrUnknown(data['cache']!, _cacheMeta));
    } else if (isInserting) {
      context.missing(_cacheMeta);
    }
    if (data.containsKey('base_url')) {
      context.handle(_baseUrlMeta,
          baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta));
    } else if (isInserting) {
      context.missing(_baseUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feed map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feed(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      htmlLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}html_link'])!,
      xmlLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}xml_link'])!,
      handle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}handle'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      stale: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stale'])!,
      errors: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}errors'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      cache: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cache'])!,
      baseUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_url'])!,
    );
  }

  @override
  $FeedsTable createAlias(String alias) {
    return $FeedsTable(attachedDatabase, alias);
  }
}

class Feed extends DataClass implements Insertable<Feed> {
  final int id;
  final String name;
  final String displayName;
  final String htmlLink;
  final String xmlLink;
  final String handle;
  final int order;
  final int stale;
  final int errors;
  final int active;
  final String createdAt;
  final String updatedAt;
  final String kind;
  final String cache;
  final String baseUrl;
  const Feed(
      {required this.id,
      required this.name,
      required this.displayName,
      required this.htmlLink,
      required this.xmlLink,
      required this.handle,
      required this.order,
      required this.stale,
      required this.errors,
      required this.active,
      required this.createdAt,
      required this.updatedAt,
      required this.kind,
      required this.cache,
      required this.baseUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['display_name'] = Variable<String>(displayName);
    map['html_link'] = Variable<String>(htmlLink);
    map['xml_link'] = Variable<String>(xmlLink);
    map['handle'] = Variable<String>(handle);
    map['order'] = Variable<int>(order);
    map['stale'] = Variable<int>(stale);
    map['errors'] = Variable<int>(errors);
    map['active'] = Variable<int>(active);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['kind'] = Variable<String>(kind);
    map['cache'] = Variable<String>(cache);
    map['base_url'] = Variable<String>(baseUrl);
    return map;
  }

  FeedsCompanion toCompanion(bool nullToAbsent) {
    return FeedsCompanion(
      id: Value(id),
      name: Value(name),
      displayName: Value(displayName),
      htmlLink: Value(htmlLink),
      xmlLink: Value(xmlLink),
      handle: Value(handle),
      order: Value(order),
      stale: Value(stale),
      errors: Value(errors),
      active: Value(active),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      kind: Value(kind),
      cache: Value(cache),
      baseUrl: Value(baseUrl),
    );
  }

  factory Feed.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feed(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      displayName: serializer.fromJson<String>(json['displayName']),
      htmlLink: serializer.fromJson<String>(json['htmlLink']),
      xmlLink: serializer.fromJson<String>(json['xmlLink']),
      handle: serializer.fromJson<String>(json['handle']),
      order: serializer.fromJson<int>(json['order']),
      stale: serializer.fromJson<int>(json['stale']),
      errors: serializer.fromJson<int>(json['errors']),
      active: serializer.fromJson<int>(json['active']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      kind: serializer.fromJson<String>(json['kind']),
      cache: serializer.fromJson<String>(json['cache']),
      baseUrl: serializer.fromJson<String>(json['baseUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'displayName': serializer.toJson<String>(displayName),
      'htmlLink': serializer.toJson<String>(htmlLink),
      'xmlLink': serializer.toJson<String>(xmlLink),
      'handle': serializer.toJson<String>(handle),
      'order': serializer.toJson<int>(order),
      'stale': serializer.toJson<int>(stale),
      'errors': serializer.toJson<int>(errors),
      'active': serializer.toJson<int>(active),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'kind': serializer.toJson<String>(kind),
      'cache': serializer.toJson<String>(cache),
      'baseUrl': serializer.toJson<String>(baseUrl),
    };
  }

  Feed copyWith(
          {int? id,
          String? name,
          String? displayName,
          String? htmlLink,
          String? xmlLink,
          String? handle,
          int? order,
          int? stale,
          int? errors,
          int? active,
          String? createdAt,
          String? updatedAt,
          String? kind,
          String? cache,
          String? baseUrl}) =>
      Feed(
        id: id ?? this.id,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        htmlLink: htmlLink ?? this.htmlLink,
        xmlLink: xmlLink ?? this.xmlLink,
        handle: handle ?? this.handle,
        order: order ?? this.order,
        stale: stale ?? this.stale,
        errors: errors ?? this.errors,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        kind: kind ?? this.kind,
        cache: cache ?? this.cache,
        baseUrl: baseUrl ?? this.baseUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Feed(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('htmlLink: $htmlLink, ')
          ..write('xmlLink: $xmlLink, ')
          ..write('handle: $handle, ')
          ..write('order: $order, ')
          ..write('stale: $stale, ')
          ..write('errors: $errors, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('kind: $kind, ')
          ..write('cache: $cache, ')
          ..write('baseUrl: $baseUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      displayName,
      htmlLink,
      xmlLink,
      handle,
      order,
      stale,
      errors,
      active,
      createdAt,
      updatedAt,
      kind,
      cache,
      baseUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feed &&
          other.id == this.id &&
          other.name == this.name &&
          other.displayName == this.displayName &&
          other.htmlLink == this.htmlLink &&
          other.xmlLink == this.xmlLink &&
          other.handle == this.handle &&
          other.order == this.order &&
          other.stale == this.stale &&
          other.errors == this.errors &&
          other.active == this.active &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.kind == this.kind &&
          other.cache == this.cache &&
          other.baseUrl == this.baseUrl);
}

class FeedsCompanion extends UpdateCompanion<Feed> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> displayName;
  final Value<String> htmlLink;
  final Value<String> xmlLink;
  final Value<String> handle;
  final Value<int> order;
  final Value<int> stale;
  final Value<int> errors;
  final Value<int> active;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String> kind;
  final Value<String> cache;
  final Value<String> baseUrl;
  const FeedsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.displayName = const Value.absent(),
    this.htmlLink = const Value.absent(),
    this.xmlLink = const Value.absent(),
    this.handle = const Value.absent(),
    this.order = const Value.absent(),
    this.stale = const Value.absent(),
    this.errors = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.kind = const Value.absent(),
    this.cache = const Value.absent(),
    this.baseUrl = const Value.absent(),
  });
  FeedsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.displayName = const Value.absent(),
    required String htmlLink,
    required String xmlLink,
    required String handle,
    this.order = const Value.absent(),
    this.stale = const Value.absent(),
    this.errors = const Value.absent(),
    this.active = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    required String kind,
    required String cache,
    required String baseUrl,
  })  : name = Value(name),
        htmlLink = Value(htmlLink),
        xmlLink = Value(xmlLink),
        handle = Value(handle),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        kind = Value(kind),
        cache = Value(cache),
        baseUrl = Value(baseUrl);
  static Insertable<Feed> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? displayName,
    Expression<String>? htmlLink,
    Expression<String>? xmlLink,
    Expression<String>? handle,
    Expression<int>? order,
    Expression<int>? stale,
    Expression<int>? errors,
    Expression<int>? active,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? kind,
    Expression<String>? cache,
    Expression<String>? baseUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (displayName != null) 'display_name': displayName,
      if (htmlLink != null) 'html_link': htmlLink,
      if (xmlLink != null) 'xml_link': xmlLink,
      if (handle != null) 'handle': handle,
      if (order != null) 'order': order,
      if (stale != null) 'stale': stale,
      if (errors != null) 'errors': errors,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (kind != null) 'kind': kind,
      if (cache != null) 'cache': cache,
      if (baseUrl != null) 'base_url': baseUrl,
    });
  }

  FeedsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? displayName,
      Value<String>? htmlLink,
      Value<String>? xmlLink,
      Value<String>? handle,
      Value<int>? order,
      Value<int>? stale,
      Value<int>? errors,
      Value<int>? active,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String>? kind,
      Value<String>? cache,
      Value<String>? baseUrl}) {
    return FeedsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      htmlLink: htmlLink ?? this.htmlLink,
      xmlLink: xmlLink ?? this.xmlLink,
      handle: handle ?? this.handle,
      order: order ?? this.order,
      stale: stale ?? this.stale,
      errors: errors ?? this.errors,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      kind: kind ?? this.kind,
      cache: cache ?? this.cache,
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (htmlLink.present) {
      map['html_link'] = Variable<String>(htmlLink.value);
    }
    if (xmlLink.present) {
      map['xml_link'] = Variable<String>(xmlLink.value);
    }
    if (handle.present) {
      map['handle'] = Variable<String>(handle.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (stale.present) {
      map['stale'] = Variable<int>(stale.value);
    }
    if (errors.present) {
      map['errors'] = Variable<int>(errors.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (cache.present) {
      map['cache'] = Variable<String>(cache.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('htmlLink: $htmlLink, ')
          ..write('xmlLink: $xmlLink, ')
          ..write('handle: $handle, ')
          ..write('order: $order, ')
          ..write('stale: $stale, ')
          ..write('errors: $errors, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('kind: $kind, ')
          ..write('cache: $cache, ')
          ..write('baseUrl: $baseUrl')
          ..write(')'))
        .toString();
  }
}

class $FeedItemTable extends FeedItem
    with TableInfo<$FeedItemTable, FeedItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _feedMeta = const VerificationMeta('feed');
  @override
  late final GeneratedColumn<int> feed = GeneratedColumn<int>(
      'feed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES feeds (id)'));
  static const VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        feed,
        guid,
        title,
        link,
        description,
        thumbnail,
        content,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'feed_item';
  @override
  String get actualTableName => 'feed_item';
  @override
  VerificationContext validateIntegrity(Insertable<FeedItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('feed')) {
      context.handle(
          _feedMeta, feed.isAcceptableOrUnknown(data['feed']!, _feedMeta));
    } else if (isInserting) {
      context.missing(_feedMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      feed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}feed'])!,
      guid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FeedItemTable createAlias(String alias) {
    return $FeedItemTable(attachedDatabase, alias);
  }
}

class FeedItemData extends DataClass implements Insertable<FeedItemData> {
  final int id;
  final int feed;
  final String guid;
  final String title;
  final String link;
  final String description;
  final String thumbnail;
  final String content;
  final String createdAt;
  final String updatedAt;
  const FeedItemData(
      {required this.id,
      required this.feed,
      required this.guid,
      required this.title,
      required this.link,
      required this.description,
      required this.thumbnail,
      required this.content,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['feed'] = Variable<int>(feed);
    map['guid'] = Variable<String>(guid);
    map['title'] = Variable<String>(title);
    map['link'] = Variable<String>(link);
    map['description'] = Variable<String>(description);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  FeedItemCompanion toCompanion(bool nullToAbsent) {
    return FeedItemCompanion(
      id: Value(id),
      feed: Value(feed),
      guid: Value(guid),
      title: Value(title),
      link: Value(link),
      description: Value(description),
      thumbnail: Value(thumbnail),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory FeedItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedItemData(
      id: serializer.fromJson<int>(json['id']),
      feed: serializer.fromJson<int>(json['feed']),
      guid: serializer.fromJson<String>(json['guid']),
      title: serializer.fromJson<String>(json['title']),
      link: serializer.fromJson<String>(json['link']),
      description: serializer.fromJson<String>(json['description']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'feed': serializer.toJson<int>(feed),
      'guid': serializer.toJson<String>(guid),
      'title': serializer.toJson<String>(title),
      'link': serializer.toJson<String>(link),
      'description': serializer.toJson<String>(description),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  FeedItemData copyWith(
          {int? id,
          int? feed,
          String? guid,
          String? title,
          String? link,
          String? description,
          String? thumbnail,
          String? content,
          String? createdAt,
          String? updatedAt}) =>
      FeedItemData(
        id: id ?? this.id,
        feed: feed ?? this.feed,
        guid: guid ?? this.guid,
        title: title ?? this.title,
        link: link ?? this.link,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('FeedItemData(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('guid: $guid, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('description: $description, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, feed, guid, title, link, description,
      thumbnail, content, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedItemData &&
          other.id == this.id &&
          other.feed == this.feed &&
          other.guid == this.guid &&
          other.title == this.title &&
          other.link == this.link &&
          other.description == this.description &&
          other.thumbnail == this.thumbnail &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FeedItemCompanion extends UpdateCompanion<FeedItemData> {
  final Value<int> id;
  final Value<int> feed;
  final Value<String> guid;
  final Value<String> title;
  final Value<String> link;
  final Value<String> description;
  final Value<String> thumbnail;
  final Value<String> content;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const FeedItemCompanion({
    this.id = const Value.absent(),
    this.feed = const Value.absent(),
    this.guid = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.description = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FeedItemCompanion.insert({
    this.id = const Value.absent(),
    required int feed,
    required String guid,
    required String title,
    required String link,
    required String description,
    required String thumbnail,
    required String content,
    required String createdAt,
    required String updatedAt,
  })  : feed = Value(feed),
        guid = Value(guid),
        title = Value(title),
        link = Value(link),
        description = Value(description),
        thumbnail = Value(thumbnail),
        content = Value(content),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FeedItemData> custom({
    Expression<int>? id,
    Expression<int>? feed,
    Expression<String>? guid,
    Expression<String>? title,
    Expression<String>? link,
    Expression<String>? description,
    Expression<String>? thumbnail,
    Expression<String>? content,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feed != null) 'feed': feed,
      if (guid != null) 'guid': guid,
      if (title != null) 'title': title,
      if (link != null) 'link': link,
      if (description != null) 'description': description,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FeedItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? feed,
      Value<String>? guid,
      Value<String>? title,
      Value<String>? link,
      Value<String>? description,
      Value<String>? thumbnail,
      Value<String>? content,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return FeedItemCompanion(
      id: id ?? this.id,
      feed: feed ?? this.feed,
      guid: guid ?? this.guid,
      title: title ?? this.title,
      link: link ?? this.link,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (feed.present) {
      map['feed'] = Variable<int>(feed.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedItemCompanion(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('guid: $guid, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('description: $description, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$PlanetDB extends GeneratedDatabase {
  _$PlanetDB(QueryExecutor e) : super(e);
  late final $FeedsTable feeds = $FeedsTable(this);
  late final $FeedItemTable feedItem = $FeedItemTable(this);
  Selectable<GetLastFeedItemsResult> getLastFeedItems() {
    return customSelect(
        'SELECT sub.*,"feeds"."id" AS "nested_0.id", "feeds"."name" AS "nested_0.name", "feeds"."display_name" AS "nested_0.display_name", "feeds"."html_link" AS "nested_0.html_link", "feeds"."xml_link" AS "nested_0.xml_link", "feeds"."handle" AS "nested_0.handle", "feeds"."order" AS "nested_0.order", "feeds"."stale" AS "nested_0.stale", "feeds"."errors" AS "nested_0.errors", "feeds"."active" AS "nested_0.active", "feeds"."created_at" AS "nested_0.created_at", "feeds"."updated_at" AS "nested_0.updated_at", "feeds"."kind" AS "nested_0.kind", "feeds"."cache" AS "nested_0.cache", "feeds"."base_url" AS "nested_0.base_url" FROM (SELECT row_number()OVER (PARTITION BY feed ORDER BY feed, updated_at DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS) AS rnk, * FROM feed_item) AS sub,feeds WHERE feeds.id == sub.feed AND feeds.active = 1 AND sub.rnk <= 10 ORDER BY feeds."order"',
        variables: [],
        readsFrom: {
          feedItem,
          feeds,
        }).asyncMap((QueryRow row) async => GetLastFeedItemsResult(
          rnk: row.read<int>('rnk'),
          id: row.read<int>('id'),
          feed: row.read<int>('feed'),
          guid: row.read<String>('guid'),
          title: row.read<String>('title'),
          link: row.read<String>('link'),
          description: row.read<String>('description'),
          thumbnail: row.read<String>('thumbnail'),
          content: row.read<String>('content'),
          createdAt: row.read<String>('created_at'),
          updatedAt: row.read<String>('updated_at'),
          rnk1: row.read<int>('rnk'),
          feeds: await feeds.mapFromRow(row, tablePrefix: 'nested_0'),
        ));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [feeds, feedItem];
}

class GetLastFeedItemsResult {
  final int rnk;
  final int id;
  final int feed;
  final String guid;
  final String title;
  final String link;
  final String description;
  final String thumbnail;
  final String content;
  final String createdAt;
  final String updatedAt;
  final int rnk1;
  final Feed feeds;
  GetLastFeedItemsResult({
    required this.rnk,
    required this.id,
    required this.feed,
    required this.guid,
    required this.title,
    required this.link,
    required this.description,
    required this.thumbnail,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.rnk1,
    required this.feeds,
  });
}
