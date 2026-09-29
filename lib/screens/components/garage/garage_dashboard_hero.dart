import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Dashboard hero block: eyebrow label + two-line display title (§6.1, Appendix B.5).
class GarageDashboardHero extends StatelessWidget {
  const GarageDashboardHero({
    super.key,
    required this.eyebrow,
    required this.titleLine1,
    required this.titleLine2,
  });

  final String eyebrow;
  final String titleLine1;
  final String titleLine2;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: GarageSpacing.screenH,
        right: GarageSpacing.screenH,
        top: GarageSpacing.homeTop,
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: GarageTextStyles.homeEyebrow(theme),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              titleLine1.toUpperCase(),
              style: GarageTextStyles.homeHeroLine1(theme),
            ),
          ),
          Text(
            titleLine2.toUpperCase(),
            style: GarageTextStyles.homeHeroLine2(theme),
          ),
        ],
      ),
    );
  }
}
