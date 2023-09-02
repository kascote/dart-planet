import './base_cmd.dart';

class GenerateCmd extends BaseCommand {
  @override
  final name = 'generate';
  @override
  final description = 'generate the planet';

  @override
  Future<int> run() async {
    await super.run();

    return runWithPlanet((planet) => planet.generatePlanet());
  }
}
