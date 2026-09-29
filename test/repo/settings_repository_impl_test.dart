import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/repo/settings_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('defaults to miles when nothing is stored', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final repository = SettingsRepositoryImpl(prefs);

    expect(await repository.getDistanceUnit(), DistanceUnit.miles);
  });

  test('reads a previously stored kilometres preference', () async {
    SharedPreferences.setMockInitialValues({'distance_unit': 'kilometres'});
    final prefs = await SharedPreferences.getInstance();
    final repository = SettingsRepositoryImpl(prefs);

    expect(await repository.getDistanceUnit(), DistanceUnit.kilometres);
  });

  test('set then get round-trips the unit', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final repository = SettingsRepositoryImpl(prefs);

    await repository.setDistanceUnit(DistanceUnit.kilometres);
    expect(await repository.getDistanceUnit(), DistanceUnit.kilometres);

    await repository.setDistanceUnit(DistanceUnit.miles);
    expect(await repository.getDistanceUnit(), DistanceUnit.miles);
  });

  test('defaults to legacy when no color theme is stored', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final repository = SettingsRepositoryImpl(prefs);

    expect(
      await repository.getColorThemePreset(),
      ColorThemePreset.legacy,
    );
  });

  test('set then get round-trips the color theme preset', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final repository = SettingsRepositoryImpl(prefs);

    await repository.setColorThemePreset(ColorThemePreset.mountainSunrise);
    expect(
      await repository.getColorThemePreset(),
      ColorThemePreset.mountainSunrise,
    );

    await repository.setColorThemePreset(ColorThemePreset.oceanDepth);
    expect(
      await repository.getColorThemePreset(),
      ColorThemePreset.oceanDepth,
    );
  });

  test('migrates removed color theme storage keys', () async {
    SharedPreferences.setMockInitialValues({'color_theme_preset': 'darkColorful'});
    final prefs = await SharedPreferences.getInstance();
    final repository = SettingsRepositoryImpl(prefs);

    expect(
      await repository.getColorThemePreset(),
      ColorThemePreset.legacy,
    );
  });
}
