import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/fuel_economy_period.dart';
import 'package:carport/domain/entities/fuel_economy_unit.dart';
import 'package:carport/domain/entities/mpg_entry.dart';

/// Pure fuel-economy math: normalize distance, aggregate periods, format.
abstract final class FuelEconomyCalculator {
  FuelEconomyCalculator._();

  static const litersPerUsGallon = 3.785411784;
  static const kmPerMile = 1.609344;

  /// Weighted period efficiency from [entries] in [unit].
  ///
  /// Uses total distance / total fuel (not the mean of per-fill values).
  /// Returns null when there are no usable entries.
  static double? efficiency(
    Iterable<MpgEntry> entries, {
    required FuelEconomyUnit unit,
  }) {
    var totalLiters = 0.0;
    var totalKm = 0.0;
    var totalMiles = 0.0;

    for (final entry in entries) {
      if (entry.liters <= 0 || entry.distance <= 0) continue;
      totalLiters += entry.liters;
      totalKm += distanceInKm(entry.distance, entry.distanceUnit);
      totalMiles += distanceInMiles(entry.distance, entry.distanceUnit);
    }

    if (totalLiters <= 0) return null;

    return switch (unit) {
      FuelEconomyUnit.mpg =>
        totalMiles <= 0 ? null : totalMiles / (totalLiters / litersPerUsGallon),
      FuelEconomyUnit.litersPer100Km =>
        totalKm <= 0 ? null : totalLiters / totalKm * 100,
      FuelEconomyUnit.kmPerLiter =>
        totalKm <= 0 ? null : totalKm / totalLiters,
    };
  }

  /// Month buckets newest-first for months that have at least one entry.
  static List<FuelEconomyPeriod> byMonth(
    List<MpgEntry> entries, {
    required FuelEconomyUnit unit,
  }) {
    final grouped = <(int, int), List<MpgEntry>>{};
    for (final entry in entries) {
      final key = (entry.recordedAt.year, entry.recordedAt.month);
      grouped.putIfAbsent(key, () => []).add(entry);
    }

    final keys = grouped.keys.toList()
      ..sort((a, b) {
        final yearCmp = b.$1.compareTo(a.$1);
        if (yearCmp != 0) return yearCmp;
        return b.$2.compareTo(a.$2);
      });

    return [
      for (final key in keys)
        FuelEconomyPeriod(
          year: key.$1,
          month: key.$2,
          value: efficiency(grouped[key]!, unit: unit),
        ),
    ];
  }

  /// Year buckets newest-first for years that have at least one entry.
  static List<FuelEconomyPeriod> byYear(
    List<MpgEntry> entries, {
    required FuelEconomyUnit unit,
  }) {
    final grouped = <int, List<MpgEntry>>{};
    for (final entry in entries) {
      grouped.putIfAbsent(entry.recordedAt.year, () => []).add(entry);
    }

    final years = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return [
      for (final year in years)
        FuelEconomyPeriod(
          year: year,
          value: efficiency(grouped[year]!, unit: unit),
        ),
    ];
  }

  static double distanceInKm(double distance, DistanceUnit unit) =>
      switch (unit) {
        DistanceUnit.kilometres => distance,
        DistanceUnit.miles => distance * kmPerMile,
      };

  static double distanceInMiles(double distance, DistanceUnit unit) =>
      switch (unit) {
        DistanceUnit.miles => distance,
        DistanceUnit.kilometres => distance / kmPerMile,
      };

  /// One digit after the decimal, e.g. `32.4`.
  static String formatValue(double value) => value.toStringAsFixed(1);
}
