import 'package:carport/screens/components/garage/garage_back_button.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Screen header with optional back button and trailing action (§5.2).
class GarageTopBar extends StatelessWidget {
  const GarageTopBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.backEnabled = true,
    this.onBack,
    this.action,
  });

  final String title;
  final bool showBack;
  final bool backEnabled;
  final VoidCallback? onBack;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: GarageSpacing.screenH,
        right: GarageSpacing.screenH,
        top: GarageSpacing.topBarTop,
        bottom: GarageSpacing.topBarBottom,
      ),
      child: Row(
        children: [
          if (showBack)
            GarageBackButton(
              onBack: onBack,
              enabled: backEnabled,
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: showBack ? 12 : 0),
              child: Text(
                title,
                style: GarageTextStyles.screenTitle(theme),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          ?action,
        ],
      ),
    );
  }
}
