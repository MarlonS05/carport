import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Service log navigation row for vehicle detail (§5).
class GarageServiceLogSection extends StatelessWidget {
  const GarageServiceLogSection({
    super.key,
    required this.entryCount,
    required this.onTap,
  });

  final int entryCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final entryLabel = entryCount == 1 ? '1 entry' : '$entryCount entries';

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.border)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: GarageSpacing.section),
        child: Semantics(
          button: true,
          label: 'Service log, $entryLabel',
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(GarageRadius.input),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: theme.secondary,
                        borderRadius:
                            BorderRadius.circular(GarageRadius.iconBox),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        LucideIcons.fileText,
                        size: 20,
                        color: theme.primary,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SERVICE LOG',
                              style: GarageTextStyles.fieldLabel(theme),
                            ),
                            Text(
                              entryLabel,
                              style: GarageTextStyles.listMeta(theme),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      LucideIcons.chevronRight,
                      size: 16,
                      color: theme.mutedForeground,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
