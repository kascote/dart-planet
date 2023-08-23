import 'dart:io' show Platform;

import 'package:path/path.dart';

/// Config
class Config {
  static final Config _instance = Config._();
  static Config get instance => _instance;
  final Map<String, String> _config = {};

  Config._() {
    _setDefaultEnvironment();
  }

  /// Set a configuration value
  void set(String key, String value) => _config[key] = value;

  /// Get a configuration value
  String get(String key) {
    final tmp = _config[key];
    if (tmp == null) {
      throw Exception('Config key not found: $key');
    }
    return tmp;
  }

  int getInt(String key) => int.parse(get(key));

  /// Set the environment variables
  void _setDefaultEnvironment() {
    final pathToScript = Platform.script.toFilePath();
    final baseDir = dirname(pathToScript);
    set('scriptHome', baseDir);
    set('configFile', 'dart_planet.json');
    set('dbFile', 'dart_planet.db');
    set('logFile', 'dart_planet.log');
    set('logLevel', 'info');

    set('planetName', 'Dart Planet');
    set('planetUrl', 'https://dartplanet.org');
    set('description', 'One-Stop Dart/Flutter News');
    set('keywords', 'News, Aggregator, Dart, Flutter');

    // after this number of errors, the feed will be marked as inactive
    set('maxAllowedErrors', '5');
    // when feed are purged, the last N items per feed are kept
    set('maxAllowedItems', '30');
    // items rendered per feed
    set('maxRenderedItemsPerFeed', '10');
  }
}
