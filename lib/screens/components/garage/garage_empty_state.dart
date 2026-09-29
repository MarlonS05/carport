import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Centered empty-list or placeholder message (§5.11).
class GarageEmptyState extends StatelessWidget {
  const GarageEmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.iconSize = 48,
  });

  final IconData icon;
  final String message;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: theme.mutedForeground.withValues(alpha: 0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              message.toUpperCase(),
              style: GarageTextStyles.comingSoon(theme),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
