import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Confirmation dialog for destructive actions.
Future<bool> showGarageConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'Delete',
  String cancelLabel = 'Cancel',
}) async {
  final theme = GarageTheme.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: theme.card,
      title: Text(
        title,
        style: GarageTextStyles.screenTitle(theme),
      ),
      content: Text(
        message,
        style: GarageTextStyles.body(theme, color: theme.foreground),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(
            cancelLabel,
            style: GarageTextStyles.body(theme, color: theme.mutedForeground),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(
            confirmLabel,
            style: GarageTextStyles.body(
              theme,
              color: theme.destructive,
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}
