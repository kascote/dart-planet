import './base_cmd.dart';

class FeedListCmd extends BaseCommand {
  FeedListCmd() {
    argParser
      ..addOption('handle', abbr: 'j', help: 'feed handle to update')
      ..addFlag('errors', abbr: 'e', help: 'list feeds with errors', negatable: false)
      ..addFlag('disabled', abbr: 'd', help: 'list disabled feeds', negatable: false);
  }

  @override
  final name = 'list';
  @override
  final description = 'list feeds';

  @override
  Future<int> run() async {
    await super.run();

    final args = argResults!;
    final handle = args['handle'] as String?;

    if (args.wasParsed('handle')) {
      return runWithPlanet((planet) => planet.listFeed(handle: handle));
    }

    if (args.wasParsed('errors')) {
      return runWithPlanet((planet) => planet.listFeedsWithError());
    }

    if (args.wasParsed('disabled')) {
      return runWithPlanet((planet) => planet.listFeedsDisabled());
    }

    return runWithPlanet((planet) => planet.listFeed());
  }
}
