import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Preset color palettes for the app. UI must not reference these literals —
/// use [GarageTheme.of] at runtime.
abstract final class AppThemes {
  static const defaultPreset = ColorThemePreset.legacy;

  static GarageTheme themeFor(ColorThemePreset preset) => switch (preset) {
        ColorThemePreset.legacy => legacy,
        ColorThemePreset.oceanDepth => oceanDepth,
        ColorThemePreset.swampFog => swampFog,
        ColorThemePreset.subZero => subZero,
        ColorThemePreset.mountainSunrise => mountainSunrise,
      };

  static const legacy = GarageTheme(
    brightness: Brightness.dark,
    background: Color(0xFF111111),
    foreground: Color(0xFFF0EDE8),
    card: Color(0xFF1C1C1E),
    cardForeground: Color(0xFFF0EDE8),
    primary: Color(0xFFE87C2A),
    primaryForeground: Color(0xFF111111),
    primaryHover: Color(0xFFF59E0B),
    secondary: Color(0xFF2A2A2C),
    secondaryForeground: Color(0xFFF0EDE8),
    muted: Color(0xFF2A2A2C),
    mutedForeground: Color(0xFF888884),
    border: Color(0x14FFFFFF),
    inputBackground: Color(0xFF242426),
    destructive: Color(0xFFD4183D),
    success: Color(0xFF34D399),
    ring: Color(0xFFE87C2A),
  );

  static const oceanDepth = GarageTheme(
    brightness: Brightness.dark,
    background: Color(0xFF0B1520),
    foreground: Color(0xFFE6EEF5),
    card: Color(0xFF132030),
    cardForeground: Color(0xFFE6EEF5),
    primary: Color(0xFF4A9FD4),
    primaryForeground: Color(0xFF0B1520),
    primaryHover: Color(0xFF6BB5E0),
    secondary: Color(0xFF1A2D42),
    secondaryForeground: Color(0xFFE6EEF5),
    muted: Color(0xFF1A2D42),
    mutedForeground: Color(0xFF7A92A8),
    border: Color(0x14FFFFFF),
    inputBackground: Color(0xFF172535),
    destructive: Color(0xFFD4183D),
    success: Color(0xFF34D399),
    ring: Color(0xFF4A9FD4),
  );

  static const swampFog = GarageTheme(
    brightness: Brightness.dark,
    background: Color(0xFF0E1612),
    foreground: Color(0xFFE6EDE8),
    card: Color(0xFF172220),
    cardForeground: Color(0xFFE6EDE8),
    primary: Color(0xFF6A9F7E),
    primaryForeground: Color(0xFF0E1612),
    primaryHover: Color(0xFF84B896),
    secondary: Color(0xFF223028),
    secondaryForeground: Color(0xFFE6EDE8),
    muted: Color(0xFF223028),
    mutedForeground: Color(0xFF7A8E82),
    border: Color(0x14FFFFFF),
    inputBackground: Color(0xFF1A2822),
    destructive: Color(0xFFD4183D),
    success: Color(0xFF34D399),
    ring: Color(0xFF6A9F7E),
  );

  static const subZero = GarageTheme(
    brightness: Brightness.light,
    background: Color(0xFFF2F7FB),
    foreground: Color(0xFF1A2530),
    card: Color(0xFFFFFFFF),
    cardForeground: Color(0xFF1A2530),
    primary: Color(0xFF4A9EC8),
    primaryForeground: Color(0xFFFFFFFF),
    primaryHover: Color(0xFF3A8BB5),
    secondary: Color(0xFFE4EEF5),
    secondaryForeground: Color(0xFF1A2530),
    muted: Color(0xFFE4EEF5),
    mutedForeground: Color(0xFF5A6D7E),
    border: Color(0x14000000),
    inputBackground: Color(0xFFE8F0F6),
    destructive: Color(0xFFD4183D),
    success: Color(0xFF059669),
    ring: Color(0xFF4A9EC8),
  );

  static const mountainSunrise = GarageTheme(
    brightness: Brightness.dark,
    background: Color(0xFF28282C),
    foreground: Color(0xFFEDEBE6),
    card: Color(0xFF343438),
    cardForeground: Color(0xFFEDEBE6),
    primary: Color(0xFFF0C078),
    primaryForeground: Color(0xFF28282C),
    primaryHover: Color(0xFFF5D090),
    secondary: Color(0xFF3A3A3E),
    secondaryForeground: Color(0xFFEDEBE6),
    muted: Color(0xFF3A3A3E),
    mutedForeground: Color(0xFF9A9892),
    border: Color(0x14FFFFFF),
    inputBackground: Color(0xFF38383C),
    destructive: Color(0xFFD4183D),
    success: Color(0xFF34D399),
    ring: Color(0xFFF0C078),
  );
}
