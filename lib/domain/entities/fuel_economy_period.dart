/// Aggregated fuel economy for a calendar month or year.
class FuelEconomyPeriod {
  final int year;
  final int? month;
  final double? value;

  const FuelEconomyPeriod({
    required this.year,
    this.month,
    required this.value,
  });

  bool get isMonth => month != null;
}
