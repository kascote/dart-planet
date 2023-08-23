import 'dart:io';

import './base_cmd.dart';
import '../shared/exit_code.dart';

class CacheCmd extends BaseCommand {
  CacheCmd() {
    argParser
      ..addOption('handle', abbr: 'a', help: 'handle to clear cache')
      ..addFlag('zap', abbr: 'z', help: 'clear cache for all feeds', negatable: false);
  }

  @override
  final name = 'cache';
  @override
  final description = 'handles feeds cache';

  @override
  Future<int> run() async {
    await super.run();

    final args = argResults!;
    final handle = args['handle'] as String?;
    final zapAll = args['zap'] as bool? ?? false;

    if (handle != null && zapAll) {
      stderr.writeln('Error: --handle and --zap are mutually exclusive');
      printUsage();
      return ExitCode.usageError.code;
    }

    if (handle == null && !zapAll) {
      stderr.writeln('Error: either --handle or --zap must be specified');
      printUsage();
      return ExitCode.usageError.code;
    }

    if (zapAll) {
      return runWithPlanet((planet) => planet.clearAllCache());
    }

    if (handle != null) {
      return runWithPlanet((planet) => planet.clearCache(handle));
    }

    return ExitCode.success.code;
  }
}
