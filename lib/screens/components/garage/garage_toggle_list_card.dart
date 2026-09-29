import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// List row with a trailing pill toggle for permission-style settings.
class GarageToggleListCard extends StatelessWidget {
  const GarageToggleListCard({
    super.key,
    required this.title,
    required this.enabled,
    required this.onChanged,
    this.icon = LucideIcons.user,
    this.isSaving = false,
  });

  final String title;
  final bool enabled;
  final ValueChanged<bool> onChanged;
  final IconData icon;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Opacity(
      opacity: isSaving ? 0.5 : 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.card,
          borderRadius: BorderRadius.circular(GarageRadius.card),
          border: Border.all(color: theme.border),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.secondary,
                borderRadius: BorderRadius.circular(GarageRadius.iconBox),
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 20, color: theme.primary),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  title,
                  style: GarageTextStyles.listTitle(theme, size: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: _GaragePillToggle(
                value: enabled,
                onChanged: isSaving ? null : onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GaragePillToggle extends StatelessWidget {
  const _GaragePillToggle({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  static const _trackWidth = 44.0;
  static const _trackHeight = 24.0;
  static const _thumbSize = 18.0;
  static const _thumbPadding = 3.0;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      toggled: value,
      label: value ? 'Access enabled' : 'Access disabled',
      child: GestureDetector(
        onTap: onChanged == null ? null : () => onChanged!(!value),
        child: AnimatedContainer(
          duration: GarageMotion.standard,
          width: _trackWidth,
          height: _trackHeight,
          decoration: BoxDecoration(
            color: value ? theme.primary : theme.secondary,
            borderRadius: BorderRadius.circular(_trackHeight / 2),
            border: Border.all(
              color: value
                  ? theme.primary.withValues(alpha: GarageAlpha.primaryBorder)
                  : theme.border,
            ),
          ),
          child: AnimatedAlign(
            duration: GarageMotion.standard,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(_thumbPadding),
              child: Container(
                width: _thumbSize,
                height: _thumbSize,
                decoration: BoxDecoration(
                  color: value ? theme.primaryForeground : theme.foreground,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
