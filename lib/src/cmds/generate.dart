import './base_cmd.dart';

class GenerateCmd extends BaseCommand {
  @override
  final name = 'generate';
  @override
  final description = 'generate planet';

  @override
  Future<int> run() async {
    await super.run();

    return runWithPlanet((planet) => planet.generatePlanet());
  }
}
