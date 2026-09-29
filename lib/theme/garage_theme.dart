import 'package:carport/theme/app_themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Primary tint/border opacities for selected and pressed states.
abstract final class GarageAlpha {
  static const primaryTint = 0.12;
  static const primaryBorder = 0.5;
  static const primaryHoverBorder = 0.4;
}

/// Layout spacing tokens (§3.3).
abstract final class GarageSpacing {
  static const screenH = 20.0;
  static const section = 16.0;
  static const list = 12.0;
  static const grid = 12.0;
  static const topBarTop = 24.0;
  static const topBarBottom = 16.0;
  static const homeTop = 40.0;
  static const labelGap = 6.0;
}

/// Border radius tokens (§3.3).
abstract final class GarageRadius {
  static const card = 12.0;
  static const input = 8.0;
  static const iconBox = 8.0;
}

/// Size tokens (§3.3).
abstract final class GarageSize {
  static const fab = 56.0;
  static const backButton = 36.0;
  static const maxWidth = 384.0;
  static const minTap = 48.0;
}

/// Animation durations from §8.
abstract final class GarageMotion {
  static const standard = Duration(milliseconds: 200);
  static const fab = Duration(milliseconds: 150);
}

/// Typography helpers (§3.2). Letter spacing uses em × fontSize.
abstract final class GarageTextStyles {
  static double _em(double fontSize, double em) => fontSize * em;

  static TextStyle homeEyebrow(GarageTheme theme) => GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: _em(12, 0.1),
        color: theme.primary,
      ).copyWith(height: 1.2);

  static TextStyle homeHeroLine1(GarageTheme theme) => GoogleFonts.barlowCondensed(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        letterSpacing: _em(36, 0.025),
        color: theme.foreground,
      ).copyWith(height: 1.1);

  static TextStyle homeHeroLine2(GarageTheme theme) => GoogleFonts.barlowCondensed(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        letterSpacing: _em(36, 0.025),
        color: theme.mutedForeground,
      ).copyWith(height: 1.1);

  static TextStyle screenTitle(GarageTheme theme) => GoogleFonts.barlowCondensed(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: _em(24, 0.025),
        color: theme.foreground,
      ).copyWith(height: 1.2);

  static TextStyle tileTitle(GarageTheme theme, {Color? color}) =>
      GoogleFonts.barlowCondensed(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: _em(18, 0.025),
        color: color ?? theme.foreground,
      ).copyWith(height: 1.2);

  static TextStyle tileSubtitle(
    GarageTheme theme, {
    required bool onAccent,
    Color? onAccentForeground,
  }) =>
      GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: onAccent
            ? (onAccentForeground ?? theme.primaryForeground)
                .withValues(alpha: 0.7)
            : theme.mutedForeground,
      ).copyWith(height: 1.4);

  static TextStyle fieldLabel(GarageTheme theme) => GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: _em(12, 0.1),
        color: theme.mutedForeground,
      ).copyWith(height: 1.4);

  static TextStyle body(GarageTheme theme, {Color? color}) => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? theme.mutedForeground,
      ).copyWith(height: 1.5);

  static TextStyle listTitle(GarageTheme theme, {double size = 16}) =>
      GoogleFonts.barlowCondensed(
        fontSize: size,
        fontWeight: FontWeight.w700,
        letterSpacing: _em(size, 0.025),
        color: theme.foreground,
      ).copyWith(height: 1.2);

  static TextStyle listMeta(GarageTheme theme) => GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: theme.mutedForeground,
      ).copyWith(height: 1.4);

  static TextStyle footerStat(GarageTheme theme) => GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: _em(12, 0.1),
        color: theme.mutedForeground,
      ).copyWith(height: 1.4);

  static TextStyle primaryCta(GarageTheme theme) => GoogleFonts.barlowCondensed(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: _em(16, 0.1),
        color: theme.primaryForeground,
      ).copyWith(height: 1.2);

  static TextStyle editPill(GarageTheme theme) => GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: _em(12, 0.1),
        color: theme.foreground,
      ).copyWith(height: 1.2);

  static TextStyle comingSoon(GarageTheme theme) => GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: _em(12, 0.1),
        color: theme.mutedForeground,
      ).copyWith(height: 1.4);

  static TextStyle display(
    GarageTheme theme, {
    required double fontSize,
    FontWeight fontWeight = FontWeight.w700,
    Color? color,
    double letterSpacingEm = 0.025,
  }) =>
      GoogleFonts.barlowCondensed(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: _em(fontSize, letterSpacingEm),
        color: color ?? theme.foreground,
      );

  static TextStyle label(
    GarageTheme theme, {
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double letterSpacingEm = 0,
  }) =>
      GoogleFonts.dmMono(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacingEm > 0 ? _em(fontSize, letterSpacingEm) : 0,
        color: color ?? theme.mutedForeground,
      );

  static TextStyle bodyStyle(
    GarageTheme theme, {
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) =>
      GoogleFonts.dmSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? theme.mutedForeground,
      );
}

/// Theme extension exposing garage design tokens (§3).
@immutable
class GarageTheme extends ThemeExtension<GarageTheme> {
  const GarageTheme({
    required this.brightness,
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.primary,
    required this.primaryForeground,
    required this.primaryHover,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.border,
    required this.inputBackground,
    required this.destructive,
    required this.success,
    required this.ring,
  });

  final Brightness brightness;
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color primary;
  final Color primaryForeground;
  final Color primaryHover;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color border;
  final Color inputBackground;
  final Color destructive;
  final Color success;
  final Color ring;

  static GarageTheme of(BuildContext context) {
    return Theme.of(context).extension<GarageTheme>() ??
        AppThemes.themeFor(AppThemes.defaultPreset);
  }

  @override
  GarageTheme copyWith({
    Brightness? brightness,
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? primary,
    Color? primaryForeground,
    Color? primaryHover,
    Color? secondary,
    Color? secondaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? border,
    Color? inputBackground,
    Color? destructive,
    Color? success,
    Color? ring,
  }) {
    return GarageTheme(
      brightness: brightness ?? this.brightness,
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      primaryHover: primaryHover ?? this.primaryHover,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      border: border ?? this.border,
      inputBackground: inputBackground ?? this.inputBackground,
      destructive: destructive ?? this.destructive,
      success: success ?? this.success,
      ring: ring ?? this.ring,
    );
  }

  @override
  GarageTheme lerp(ThemeExtension<GarageTheme>? other, double t) {
    if (other is! GarageTheme) return this;
    Color lerpColor(Color a, Color b) => Color.lerp(a, b, t)!;
    return GarageTheme(
      brightness: t < 0.5 ? brightness : other.brightness,
      background: lerpColor(background, other.background),
      foreground: lerpColor(foreground, other.foreground),
      card: lerpColor(card, other.card),
      cardForeground: lerpColor(cardForeground, other.cardForeground),
      primary: lerpColor(primary, other.primary),
      primaryForeground: lerpColor(primaryForeground, other.primaryForeground),
      primaryHover: lerpColor(primaryHover, other.primaryHover),
      secondary: lerpColor(secondary, other.secondary),
      secondaryForeground: lerpColor(secondaryForeground, other.secondaryForeground),
      muted: lerpColor(muted, other.muted),
      mutedForeground: lerpColor(mutedForeground, other.mutedForeground),
      border: lerpColor(border, other.border),
      inputBackground: lerpColor(inputBackground, other.inputBackground),
      destructive: lerpColor(destructive, other.destructive),
      success: lerpColor(success, other.success),
      ring: lerpColor(ring, other.ring),
    );
  }
}

/// Builds the app-wide Material theme with garage tokens.
ThemeData buildCarportTheme(GarageTheme garage) {
  final colorScheme = garage.brightness == Brightness.dark
      ? ColorScheme.dark(
          surface: garage.card,
          onSurface: garage.foreground,
          primary: garage.primary,
          onPrimary: garage.primaryForeground,
          secondary: garage.secondary,
          onSecondary: garage.secondaryForeground,
          error: garage.destructive,
        )
      : ColorScheme.light(
          surface: garage.card,
          onSurface: garage.foreground,
          primary: garage.primary,
          onPrimary: garage.primaryForeground,
          secondary: garage.secondary,
          onSecondary: garage.secondaryForeground,
          error: garage.destructive,
        );

  return ThemeData(
    brightness: garage.brightness,
    scaffoldBackgroundColor: garage.background,
    colorScheme: colorScheme,
    extensions: [garage],
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: garage.foreground,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: garage.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GarageRadius.input),
        borderSide: BorderSide(color: garage.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GarageRadius.input),
        borderSide: BorderSide(color: garage.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GarageRadius.input),
        borderSide: BorderSide(color: garage.ring),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 6,
      backgroundColor: garage.primary,
      foregroundColor: garage.primaryForeground,
    ),
  );
}
