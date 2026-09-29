import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Uppercase mono section heading above grouped list content (reminders, settings).
class GarageSectionLabel extends StatelessWidget {
  const GarageSectionLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: GarageSpacing.list),
      child: Text(
        text.toUpperCase(),
        style: GarageTextStyles.fieldLabel(theme),
      ),
    );
  }
}
