import 'package:carport/domain/entities/distance_unit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DistanceUnit', () {
    test('fromStorage maps known and unknown values', () {
      expect(DistanceUnit.fromStorage('kilometres'), DistanceUnit.kilometres);
      expect(DistanceUnit.fromStorage('miles'), DistanceUnit.miles);
      expect(DistanceUnit.fromStorage(null), DistanceUnit.miles);
      expect(DistanceUnit.fromStorage('bogus'), DistanceUnit.miles);
    });

    test('toStorage round-trips through fromStorage', () {
      for (final unit in DistanceUnit.values) {
        expect(DistanceUnit.fromStorage(unit.toStorage()), unit);
      }
    });

    test('suffix and labelSuffix', () {
      expect(DistanceUnit.miles.suffix, 'mi');
      expect(DistanceUnit.kilometres.suffix, 'km');
      expect(DistanceUnit.miles.labelSuffix, 'MI');
      expect(DistanceUnit.kilometres.labelSuffix, 'KM');
    });

    test('label and pickerSubtitle are populated', () {
      expect(DistanceUnit.miles.label, 'Miles');
      expect(DistanceUnit.kilometres.label, 'Kilometres');
      expect(DistanceUnit.miles.pickerSubtitle, isNotEmpty);
      expect(DistanceUnit.kilometres.pickerSubtitle, isNotEmpty);
    });
  });
}
