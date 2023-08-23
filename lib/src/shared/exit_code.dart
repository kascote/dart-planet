/// Define exits codes for CLI
enum ExitCode {
  success._(0, 'Success'),
  notModified._(1, 'Not Modified'),
  alreadyExists._(10, 'Feed already exists'),
  usageError._(64, 'Usage error'),
  invalidOptions._(100, 'Invalid options'),
  error._(128, 'Error');

  const ExitCode._(this.code, this.name);

  /// Code number to use
  final int code;

  /// Short description
  final String name;

  /// Returns [ExitCode] for given [code]
  static ExitCode fromCode(int code) {
    return ExitCode.values.firstWhere((e) => e.code == code);
  }
}
