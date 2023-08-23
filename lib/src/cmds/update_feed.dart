import 'dart:io';

import './base_cmd.dart';
import '../shared/exit_code.dart';

class UpdateFeedCmd extends BaseCommand {
  UpdateFeedCmd() {
    argParser
      ..addOption('handle', abbr: 'a', help: 'feed handle to update')
      ..addFlag('x', abbr: 'x', help: 'update all feeds', negatable: false);
  }

  @override
  final name = 'update';
  @override
  final description = 'update a feed';

  @override
  Future<int> run() async {
    await super.run();

    final args = argResults!;
    final handle = args['handle'] as String?;
    final updateAll = args['x'] as bool? ?? false;

    if (handle != null && updateAll) {
      stderr.writeln('Error: --handle and --x are mutually exclusive');
      printUsage();
      return ExitCode.usageError.code;
    }

    if (handle == null && !updateAll) {
      stderr.writeln('Error: either --handle or --x must be specified');
      printUsage();
      return ExitCode.usageError.code;
    }

    if (updateAll) {
      return runWithPlanet((planet) => planet.updateFeeds());
    }

    if (handle != null) {
      return runWithPlanet((planet) => planet.updateFeed(handle));
    }

    return ExitCode.success.code;
  }
}
