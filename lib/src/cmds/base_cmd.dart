import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_planet/src/planet.dart';
import 'package:logging/logging.dart';

import '../model/feeds.dart';
import '../shared/exit_code.dart';

final log = Logger('planet');
typedef PlanetCallback = Future<int> Function(Planet planet);
const logLevels = {
  'error': Level.SEVERE,
  'warning': Level.WARNING,
  'info': Level.INFO,
  'debug': Level.FINEST,
};

class BaseCommand extends Command<int> {
  BaseCommand() {
    argParser.addOption(
      'verbose',
      abbr: 'v',
      help: 'Verbose output',
      defaultsTo: 'info',
      allowed: ['error', 'warning', 'info', 'debug'],
    );
  }

  @override
  String get description => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  Future<int> run() async {
    Logger.root.level = logLevels[argResults!['verbose'] as String] ?? Level.INFO;

    log.info('started ${DateTime.now()}');
    return Future.value(0);
  }

  Future<int> runWithPlanet(PlanetCallback cb) async {
    final db = PlanetDB();
    try {
      final rc = await cb(Planet(db));
      return Future.value(rc);
    } catch (e) {
      stderr.writeln(e);
      return Future.value(ExitCode.error.code);
    } finally {
      await db.close();
    }
  }
}
