import 'package:carport/screens/components/garage/garage_pressable.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Visual treatment for a [GarageDashboardTile].
enum GarageDashboardTileAccent {
  /// Neutral card surface (default tiles).
  none,

  /// Filled with theme [GarageTheme.primary] (e.g. Quick Entry).
  primary,

  /// Filled with theme [GarageTheme.success] (e.g. MPG).
  success,
}

/// Home dashboard grid tile with accent and default variants (§5.13, §6.1).
class GarageDashboardTile extends StatelessWidget {
  const GarageDashboardTile({
    super.key,
    required this.accent,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final GarageDashboardTileAccent accent;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final filled = accent != GarageDashboardTileAccent.none;

    return GaragePressable(
      onTap: onTap,
      semanticsLabel: title,
      builder: (context, pressed) {
        final colors = _colorsFor(theme, accent, pressed: pressed);
        final titleColor = filled ? colors.foreground : theme.foreground;
        final iconColor = filled ? colors.foreground : theme.primary;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(GarageRadius.card),
            border: Border.all(color: colors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 28, color: iconColor),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GarageTextStyles.tileTitle(theme, color: titleColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      subtitle,
                      style: GarageTextStyles.tileSubtitle(
                        theme,
                        onAccent: filled,
                        onAccentForeground: filled ? colors.foreground : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static ({Color background, Color border, Color foreground}) _colorsFor(
    GarageTheme theme,
    GarageDashboardTileAccent accent, {
    required bool pressed,
  }) {
    switch (accent) {
      case GarageDashboardTileAccent.none:
        return (
          background: pressed ? theme.secondary : theme.card,
          border: pressed
              ? theme.primary.withValues(alpha: 0.4)
              : theme.border,
          foreground: theme.foreground,
        );
      case GarageDashboardTileAccent.primary:
        return (
          background: pressed ? theme.primaryHover : theme.primary,
          border: theme.primary,
          foreground: theme.primaryForeground,
        );
      case GarageDashboardTileAccent.success:
        // Contrast against the fill: light text on dark greens (e.g. Sub Zero
        // #059669), dark text on light greens (e.g. legacy #34D399).
        final foreground =
            ThemeData.estimateBrightnessForColor(theme.success) ==
                    Brightness.dark
                ? Colors.white
                : theme.background;
        return (
          background: pressed
              ? Color.lerp(theme.success, Colors.black, 0.12)!
              : theme.success,
          border: theme.success,
          foreground: foreground,
        );
    }
  }
}
