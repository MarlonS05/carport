/// Failure from a portal monitor HTTP call.
class PortalMonitorApiException implements Exception {
  const PortalMonitorApiException(
    this.message, {
    this.statusCode,
    this.errors,
  });

  final String message;
  final int? statusCode;
  final Map<String, List<String>>? errors;

  @override
  String toString() {
    final status = statusCode != null ? ' (HTTP $statusCode)' : '';
    if (errors == null || errors!.isEmpty) {
      return '$message$status';
    }
    return '$message$status — errors: $errors';
  }
}
