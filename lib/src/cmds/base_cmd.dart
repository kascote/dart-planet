import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_planet/src/planet.dart';
import 'package:logging/logging.dart';

import '../model/feeds.dart';
import '../shared/exit_code.dart';

typedef PlanetCallback = Future<int> Function(Planet planet);

class BaseCommand extends Command<int> {
  BaseCommand() {
    argParser.addFlag('verbose', abbr: 'v', negatable: false, help: 'Verbose output');
  }

  @override
  String get description => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  Future<int> run() async {
    if (argResults!['verbose'] as bool) {
      Logger.root.level = Level.ALL;
    }
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
