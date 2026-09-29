import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GarageMileageFormatter', () {
    test('formatDisplay groups thousands and appends unit suffix', () {
      expect(
        GarageMileageFormatter.formatDisplay(12345),
        '12,345 mi',
      );
      expect(
        GarageMileageFormatter.formatDisplay(
          12345,
          unit: DistanceUnit.kilometres,
        ),
        '12,345 km',
      );
    });

    test('formatDisplay rounds fractional mileage', () {
      expect(GarageMileageFormatter.formatDisplay(1234.6), '1,235 mi');
    });

    test('formatNumber omits the unit', () {
      expect(GarageMileageFormatter.formatNumber(1234.6), '1,235');
    });

    test('formatForField delegates to MileageInput', () {
      expect(GarageMileageFormatter.formatForField(0), '');
      expect(GarageMileageFormatter.formatForField(12345), '12345');
    });

    test('mileageFieldLabel appends uppercase unit', () {
      expect(
        GarageMileageFormatter.mileageFieldLabel(
          'Mileage',
          unit: DistanceUnit.miles,
        ),
        'Mileage (MI)',
      );
      expect(
        GarageMileageFormatter.mileageFieldLabel(
          'Mileage',
          unit: DistanceUnit.kilometres,
        ),
        'Mileage (KM)',
      );
    });
  });
}
