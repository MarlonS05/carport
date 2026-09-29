import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/validators/mileage_input.dart';
import 'package:intl/intl.dart';

/// Display formatting for mileage shown in Garage views and form pre-fill.
abstract final class GarageMileageFormatter {
  GarageMileageFormatter._();

  static final NumberFormat _displayFormat = NumberFormat('#,###');

  /// Comma-separated mileage with unit suffix for read-only display.
  static String formatDisplay(
    double mileage, {
    DistanceUnit unit = DistanceUnit.miles,
  }) =>
      '${_displayFormat.format(mileage.round())} ${unit.suffix}';

  /// Comma-separated mileage without unit (e.g. list subtitles).
  static String formatNumber(double mileage) =>
      _displayFormat.format(mileage.round());

  /// Text suitable for pre-filling a mileage input field.
  static String formatForField(double mileage) =>
      MileageInput.formatForField(mileage);

  /// Uppercase unit suffix for form field labels, e.g. `(MI)` or `(KM)`.
  static String mileageFieldLabel(
    String baseLabel, {
    required DistanceUnit unit,
  }) =>
      '$baseLabel (${unit.labelSuffix})';
}
