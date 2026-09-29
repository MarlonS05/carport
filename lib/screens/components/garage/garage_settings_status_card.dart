import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Read-only status card for settings screens.
class GarageSettingsStatusCard extends StatelessWidget {
  const GarageSettingsStatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.statusLabel,
    required this.statusColor,
  });

  final IconData icon;
  final String title;
  final String statusLabel;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      label: '$title, $statusLabel',
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
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: theme.secondary,
                borderRadius: BorderRadius.circular(GarageRadius.iconBox),
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 16, color: theme.primary),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GarageTextStyles.listTitle(theme, size: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        statusLabel,
                        style: GarageTextStyles.listMeta(theme).copyWith(
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
