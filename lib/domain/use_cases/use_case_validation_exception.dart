/// Thrown when a use case rejects input that passed parse-level validation.
class UseCaseValidationException implements Exception {
  const UseCaseValidationException(this.fieldErrors);

  final Map<String, String> fieldErrors;
}
