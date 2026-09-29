/// Result of parsing user-entered mileage text from a form field.
class MileageParseResult {
  const MileageParseResult._({this.value, this.errorMessage});

  /// Parsed mileage in miles/km (app unit). Present when parsing succeeded.
  const MileageParseResult.success(double value)
      : this._(value: value, errorMessage: null);

  /// User-facing validation message. Present when parsing failed.
  const MileageParseResult.failure(String message)
      : this._(value: null, errorMessage: message);

  final double? value;
  final String? errorMessage;
}

/// Parses and formats mileage values shown in text inputs.
///
/// **Input** (`parse`): free-form field text — leading/trailing whitespace is
/// trimmed, thousands separators (`,`) are stripped, then the remainder is parsed
/// as a [double]. An empty field is treated as `0`.
///
/// **Output** (`parse`): [MileageParseResult] with either a non-negative
/// [MileageParseResult.value] or a [MileageParseResult.errorMessage].
///
/// **Input** (`formatForField`): stored mileage as a [double].
///
/// **Output** (`formatForField`): text suitable for pre-filling an input —
/// `''` for zero or negative values, whole numbers without a decimal point,
/// otherwise [double.toString] (e.g. `12345`, `12345.5`).
abstract final class MileageInput {
  MileageInput._();

  /// See class-level docs for accepted input formats and result shape.
  static MileageParseResult parse(String raw) {
    final text = raw.trim().replaceAll(',', '');
    if (text.isEmpty) {
      return const MileageParseResult.success(0);
    }

    final parsed = double.tryParse(text);
    if (parsed == null) {
      return const MileageParseResult.failure('Enter a valid mileage');
    }
    if (parsed < 0) {
      return const MileageParseResult.failure('Mileage cannot be negative');
    }

    return MileageParseResult.success(parsed);
  }

  /// See class-level docs for input [mileage] and returned field text format.
  static String formatForField(double mileage) {
    if (mileage <= 0) return '';
    if (mileage == mileage.roundToDouble()) {
      return mileage.round().toString();
    }
    return mileage.toString();
  }
}
