import 'package:logger/logger.dart';

// One log line per operation at completion — no "calling/starting" info logs.
// Failures include a short stack trace from the catch site (not the throw site).

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 1,
    lineLength: 120,
    excludePaths: ['package:carport/logger'],
  ),
);

void logSuccess(String message) => logger.i(message);

void logFailure(
  String message, {
  Object? error,
}) {
  logger.e(
    message,
    error: error,
    stackTrace: StackTrace.current,
  );
}

void logSkipped(String message) => logger.w(message);
