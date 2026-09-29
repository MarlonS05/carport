import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/domain/formatters/garage_repeat_frequency_formatter.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Dropdown for selecting reminder repeat frequency (Daily / Weekly / Monthly / Yearly).
class GarageReminderRepeatDropdown extends StatelessWidget {
  const GarageReminderRepeatDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final ReminderRepeatFrequency value;
  final ValueChanged<ReminderRepeatFrequency> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Repeat', style: GarageTextStyles.fieldLabel(theme)),
        Padding(
          padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.inputBackground,
              borderRadius: BorderRadius.circular(GarageRadius.input),
              border: Border.all(color: theme.border),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ReminderRepeatFrequency>(
                value: value,
                isExpanded: true,
                icon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    LucideIcons.chevronDown,
                    size: 14,
                    color: theme.mutedForeground,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                borderRadius: BorderRadius.circular(GarageRadius.input),
                dropdownColor: theme.card,
                style: GarageTextStyles.body(theme, color: theme.foreground),
                items: ReminderRepeatFrequency.values
                    .map(
                      (frequency) => DropdownMenuItem(
                        value: frequency,
                        child: Row(
                          children: [
                            Icon(
                              LucideIcons.repeat2,
                              size: 14,
                              color: theme.mutedForeground,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                GarageRepeatFrequencyFormatter.label(frequency),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: enabled
                    ? (frequency) {
                        if (frequency != null) {
                          onChanged(frequency);
                        }
                      }
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
