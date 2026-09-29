import 'package:carport/screens/components/garage/garage_pressable.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Selectable radio-style option card for settings pickers.
class GarageRadioOptionCard extends StatelessWidget {
  const GarageRadioOptionCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      label: subtitle == null
          ? '$title${selected ? ', selected' : ''}'
          : '$title, $subtitle${selected ? ', selected' : ''}',
      child: GaragePressable(
        onTap: onTap,
        builder: (context, pressed) {
          final backgroundColor = selected
              ? theme.primary.withValues(alpha: GarageAlpha.primaryTint)
              : (pressed ? theme.secondary : theme.card);
          final borderColor = selected
              ? theme.primary.withValues(alpha: GarageAlpha.primaryBorder)
              : (pressed
                  ? theme.primary.withValues(alpha: GarageAlpha.primaryHoverBorder)
                  : theme.border);

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(GarageRadius.card),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GarageTextStyles.listTitle(
                          theme,
                          size: 16,
                        ).copyWith(
                          color: selected ? theme.primary : theme.foreground,
                        ),
                      ),
                      if (subtitle != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            subtitle!,
                            style: GarageTextStyles.listMeta(theme),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                _RadioIndicator(selected: selected, theme: theme),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({required this.selected, required this.theme});

  final bool selected;
  final GarageTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? theme.primary : theme.mutedForeground,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: theme.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}
