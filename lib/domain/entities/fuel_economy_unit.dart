/// Display unit for fuel economy on the MPG history screen.
enum FuelEconomyUnit {
  mpg,
  litersPer100Km,
  kmPerLiter;

  String get label => switch (this) {
        FuelEconomyUnit.mpg => 'MPG',
        FuelEconomyUnit.litersPer100Km => 'L/100KM',
        FuelEconomyUnit.kmPerLiter => 'KM/L',
      };
}
