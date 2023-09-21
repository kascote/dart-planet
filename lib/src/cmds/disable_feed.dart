import 'package:dart_planet/dart_planet.dart';

import './base_cmd.dart';

class DisableCmd extends BaseCommand {
  DisableCmd() {
    argParser.addOption('handle', abbr: 'j', help: 'feed handle to disable');
  }

  @override
  final name = 'disable';
  @override
  final description = 'disable feed';

  @override
  Future<int> run() async {
    await super.run();

    final args = argResults!;
    final handle = args['handle'] as String?;

    if (args.wasParsed('handle')) {
      return runWithPlanet((planet) => planet.disableFeed(handle!));
    }

    printUsage();
    return ExitCode.usageError.code;
  }
}
