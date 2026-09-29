import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:flutter/material.dart';

enum GaragePermissionButtonMode {
  actionable,
  granted,
  loading,
  unsupported,
}

/// Notification permission CTA for the settings permissions screen.
class GaragePermissionButton extends StatelessWidget {
  const GaragePermissionButton({
    super.key,
    required this.mode,
    required this.onPressed,
  });

  final GaragePermissionButtonMode mode;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (mode == GaragePermissionButtonMode.unsupported) {
      return const SizedBox.shrink();
    }

    final label = switch (mode) {
      GaragePermissionButtonMode.loading => 'Requesting…',
      GaragePermissionButtonMode.granted => 'Permission Granted',
      GaragePermissionButtonMode.actionable => 'Request Permission',
      GaragePermissionButtonMode.unsupported => '',
    };
    final enabled = mode == GaragePermissionButtonMode.actionable;

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: GaragePrimaryButton(
        label: label,
        isLoading: mode == GaragePermissionButtonMode.loading,
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}
