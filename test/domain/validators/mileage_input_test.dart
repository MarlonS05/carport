import 'package:carport/domain/validators/mileage_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MileageInput.parse', () {
    test('empty or whitespace-only parses as zero', () {
      expect(MileageInput.parse('').value, 0);
      expect(MileageInput.parse('   ').value, 0);
      expect(MileageInput.parse('').errorMessage, isNull);
    });

    test('strips thousands separators and trims', () {
      final result = MileageInput.parse('  12,345  ');
      expect(result.value, 12345);
      expect(result.errorMessage, isNull);
    });

    test('parses decimals', () {
      expect(MileageInput.parse('12345.5').value, 12345.5);
    });

    test('non-numeric input fails', () {
      final result = MileageInput.parse('abc');
      expect(result.value, isNull);
      expect(result.errorMessage, 'Enter a valid mileage');
    });

    test('negative input fails', () {
      final result = MileageInput.parse('-5');
      expect(result.value, isNull);
      expect(result.errorMessage, 'Mileage cannot be negative');
    });
  });

  group('MileageInput.formatForField', () {
    test('zero or negative renders empty', () {
      expect(MileageInput.formatForField(0), '');
      expect(MileageInput.formatForField(-1), '');
    });

    test('whole numbers render without decimal', () {
      expect(MileageInput.formatForField(12345), '12345');
    });

    test('fractional numbers keep decimal', () {
      expect(MileageInput.formatForField(12345.5), '12345.5');
    });
  });
}
