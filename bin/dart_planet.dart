import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_planet/dart_planet.dart';
import 'package:logging/logging.dart';

Future<void> main(List<String> arguments) async {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    stderr.writeln('${record.level.name}: ${record.time}: ${record.message}');
  });

  final cmd = CommandRunner<int>('dplanet', 'Dart Planet CLI')
    ..addCommand(AddFeedCmd())
    ..addCommand(UpdateFeedCmd())
    ..addCommand(GenerateCmd())
    ..addCommand(CacheCmd());

  await _flushThenExit(
    await cmd.run(arguments).catchError((Object error, StackTrace stackTrace) {
          stderr.writeln(error.runtimeType);

          switch (error.runtimeType) {
            case UsageException || ArgumentError:
              stderr.writeln('Error: $error');
            default:
              stderr
                ..write(error)
                ..write(stackTrace);
          }
          exit(ExitCode.usageError.code);
        }) ??
        0,
  );
}

/// Flushes the stdout and stderr streams, then exits the program with the given
/// status code.
///
/// This returns a Future that will never complete, since the program will have
/// exited already. This is useful to prevent Future chains from proceeding
/// after you've decided to exit.
Future<void> _flushThenExit(int status) {
  return Future.wait<void>([stdout.close(), stderr.close()]).then<void>((_) => exit(status));
}
