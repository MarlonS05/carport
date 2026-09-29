import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/fuel_economy_unit.dart';
import 'package:carport/domain/entities/mpg_entry.dart';
import 'package:carport/domain/formatters/fuel_economy_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FuelEconomyCalculator', () {
    MpgEntry entry({
      required double liters,
      required double distance,
      DistanceUnit unit = DistanceUnit.miles,
      DateTime? recordedAt,
    }) {
      return MpgEntry(
        id: '1',
        vehicleId: 'v1',
        liters: liters,
        distance: distance,
        distanceUnit: unit,
        recordedAt: recordedAt ?? DateTime(2026, 6, 15),
      );
    }

    test('computes US MPG from miles and liters', () {
      // 300 miles / (40 L / 3.785411784) ≈ 28.4 MPG
      final value = FuelEconomyCalculator.efficiency(
        [entry(liters: 40, distance: 300)],
        unit: FuelEconomyUnit.mpg,
      );
      expect(value, isNotNull);
      expect(FuelEconomyCalculator.formatValue(value!), '28.4');
    });

    test('computes L/100km from kilometres', () {
      // 40 L / 500 km * 100 = 8.0
      final value = FuelEconomyCalculator.efficiency(
        [
          entry(
            liters: 40,
            distance: 500,
            unit: DistanceUnit.kilometres,
          ),
        ],
        unit: FuelEconomyUnit.litersPer100Km,
      );
      expect(value, 8.0);
    });

    test('computes km/L from kilometres', () {
      final value = FuelEconomyCalculator.efficiency(
        [
          entry(
            liters: 40,
            distance: 500,
            unit: DistanceUnit.kilometres,
          ),
        ],
        unit: FuelEconomyUnit.kmPerLiter,
      );
      expect(value, 12.5);
    });

    test('aggregates by month newest first', () {
      final periods = FuelEconomyCalculator.byMonth(
        [
          entry(liters: 40, distance: 400, recordedAt: DateTime(2026, 5, 1)),
          entry(liters: 40, distance: 500, recordedAt: DateTime(2026, 6, 1)),
          entry(liters: 40, distance: 450, recordedAt: DateTime(2025, 12, 1)),
        ],
        unit: FuelEconomyUnit.mpg,
      );
      expect(periods.map((p) => (p.year, p.month)).toList(), [
        (2026, 6),
        (2026, 5),
        (2025, 12),
      ]);
    });

    test('aggregates by year newest first', () {
      final periods = FuelEconomyCalculator.byYear(
        [
          entry(liters: 40, distance: 400, recordedAt: DateTime(2025, 5, 1)),
          entry(liters: 40, distance: 500, recordedAt: DateTime(2026, 6, 1)),
        ],
        unit: FuelEconomyUnit.mpg,
      );
      expect(periods.map((p) => p.year).toList(), [2026, 2025]);
    });
  });
}
