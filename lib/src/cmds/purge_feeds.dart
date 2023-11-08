import 'dart:io';

import './base_cmd.dart';
import '../shared/exit_code.dart';

class PurgeFeedsCmd extends BaseCommand {
  PurgeFeedsCmd() {
    argParser
      ..addOption('handle', abbr: 'j', help: 'feed to purge all entries')
      ..addFlag('all', abbr: 'a', help: 'purge all feeds', negatable: false);
  }

  @override
  final name = 'purge';
  @override
  final description = 'purge old feed entries';

  @override
  Future<int> run() async {
    await super.run();

    final args = argResults!;
    final handle = args['handle'] as String?;
    final purgeAll = args['all'] as bool? ?? false;

    if (handle != null && purgeAll) {
      stderr.writeln('Error: --handle and --all are mutually exclusive');
      printUsage();
      return ExitCode.usageError.code;
    }

    if (handle == null && !purgeAll) {
      stderr.writeln('Error: either --handle or --all must be specified');
      printUsage();
      return ExitCode.usageError.code;
    }

    if (purgeAll) {
      return runWithPlanet((planet) => planet.purgeAllFeeds());
    }

    if (handle != null) {
      return runWithPlanet((planet) => planet.purgeFeed(handle));
    }

    return ExitCode.success.code;
  }
}
