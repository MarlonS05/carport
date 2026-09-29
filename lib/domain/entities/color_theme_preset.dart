enum ColorThemePreset {
  legacy,
  oceanDepth,
  swampFog,
  subZero,
  mountainSunrise;

  String get label => switch (this) {
        ColorThemePreset.legacy => 'Legacy',
        ColorThemePreset.oceanDepth => 'Ocean Depth',
        ColorThemePreset.swampFog => 'Swamp Fog',
        ColorThemePreset.subZero => 'Sub Zero',
        ColorThemePreset.mountainSunrise => 'Mountain Sunrise',
      };

  bool get isLight => switch (this) {
        ColorThemePreset.legacy ||
        ColorThemePreset.oceanDepth ||
        ColorThemePreset.swampFog ||
        ColorThemePreset.mountainSunrise =>
          false,
        ColorThemePreset.subZero => true,
      };

  static ColorThemePreset fromStorage(String? value) {
    return switch (value) {
      'legacy' => ColorThemePreset.legacy,
      'oceanDepth' => ColorThemePreset.oceanDepth,
      'swampFog' => ColorThemePreset.swampFog,
      'subZero' => ColorThemePreset.subZero,
      'mountainSunrise' => ColorThemePreset.mountainSunrise,
      // Migrate removed presets.
      'darkColorful' => ColorThemePreset.legacy,
      'darkLightBlue' => ColorThemePreset.oceanDepth,
      'darkPlain' => ColorThemePreset.mountainSunrise,
      'lightPlain' => ColorThemePreset.subZero,
      'lightColorful' => ColorThemePreset.mountainSunrise,
      _ => ColorThemePreset.legacy,
    };
  }

  String toStorage() => name;
}
