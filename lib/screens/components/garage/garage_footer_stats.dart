import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Centered footer stat line for dashboard screens (§6.1).
class GarageFooterStats extends StatelessWidget {
  const GarageFooterStats({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: GarageSpacing.screenH,
        vertical: 24,
      ),
      child: Text(
        text.toUpperCase(),
        style: GarageTextStyles.footerStat(theme),
        textAlign: TextAlign.center,
      ),
    );
  }
}
