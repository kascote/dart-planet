import 'dart:io';

import './base_cmd.dart';
import '../shared/exit_code.dart';

class AddFeedCmd extends BaseCommand {
  AddFeedCmd() {
    argParser
      ..addOption('url', abbr: 'u', help: 'url to add', mandatory: true)
      ..addOption('handle', abbr: 'j', help: 'handle to identify the feed', mandatory: true)
      ..addOption('baseUrl', abbr: 'b', help: 'base url that reference to the web site', mandatory: true);
  }

  @override
  final name = 'add';
  @override
  final description = 'add a new feed';

  @override
  Future<int> run() async {
    await super.run();

    final args = argResults!;
    final strUrl = args['url'] as String;
    final handle = args['handle'] as String;
    final baseUrl = args['baseUrl'] as String;

    final url = Uri.tryParse(strUrl);
    if (url == null) {
      stderr.writeln('invalid url');
      return Future.value(ExitCode.error.code);
    }

    return runWithPlanet((planet) => planet.addFeed(url, handle, baseUrl));
  }
}
