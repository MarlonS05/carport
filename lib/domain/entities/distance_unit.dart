enum DistanceUnit {
  miles,
  kilometres;

  String get label => switch (this) {
        DistanceUnit.miles => 'Miles',
        DistanceUnit.kilometres => 'Kilometres',
      };

  String get pickerSubtitle => switch (this) {
        DistanceUnit.miles => 'Imperial — used in the US, UK',
        DistanceUnit.kilometres => 'Metric — used internationally',
      };

  String get suffix => switch (this) {
        DistanceUnit.miles => 'mi',
        DistanceUnit.kilometres => 'km',
      };

  String get labelSuffix => suffix.toUpperCase();

  static DistanceUnit fromStorage(String? value) {
    return switch (value) {
      'kilometres' => DistanceUnit.kilometres,
      _ => DistanceUnit.miles,
    };
  }

  String toStorage() => name;
}
