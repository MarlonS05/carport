import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_permission_button.dart';
import 'package:carport/screens/components/garage/garage_section_label.dart';
import 'package:carport/screens/components/garage/garage_settings_status_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_bloc.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_event.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageSettingsPermissionsView extends StatelessWidget {
  const GarageSettingsPermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsPermissionsBloc,
        GarageSettingsPermissionsState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.errorMessage;
        if (message != null) {
          showGarageErrorDialog(context, message: message);
        }
      },
      builder: (context, state) {
        final theme = GarageTheme.of(context);
        final status = state.permissionStatus;

        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Permissions',
                onBack: () =>
                    context.read<GarageSettingsPermissionsBloc>().add(
                          const GarageSettingsPermissionsEvent.backTapped(),
                        ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GarageSpacing.screenH,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const GarageSectionLabel(text: 'Notification access'),
                        GarageSettingsStatusCard(
                          icon: LucideIcons.bell,
                          title: 'Notifications',
                          statusLabel: _statusLabel(status),
                          statusColor: _statusColor(theme, status),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: GarageSpacing.list),
                          child: GaragePermissionButton(
                            mode: _buttonMode(state),
                            onPressed: () => context
                                .read<GarageSettingsPermissionsBloc>()
                                .add(
                                  const GarageSettingsPermissionsEvent
                                      .permissionTapped(),
                                ),
                          ),
                        ),
                        if (_helperText(status) case final helper?)
                          Padding(
                            padding:
                                const EdgeInsets.only(top: GarageSpacing.list),
                            child: Text(
                              helper,
                              style: GarageTextStyles.body(theme),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static String _statusLabel(NotificationPermissionStatus status) {
    return switch (status) {
      NotificationPermissionStatus.granted => 'Allowed',
      NotificationPermissionStatus.denied => 'Blocked',
      NotificationPermissionStatus.notDetermined => 'Not set',
      NotificationPermissionStatus.unsupported => 'Unsupported',
    };
  }

  static Color _statusColor(
    GarageTheme theme,
    NotificationPermissionStatus status,
  ) {
    return switch (status) {
      NotificationPermissionStatus.granted => theme.success,
      NotificationPermissionStatus.denied => theme.destructive,
      NotificationPermissionStatus.notDetermined ||
      NotificationPermissionStatus.unsupported =>
        theme.mutedForeground,
    };
  }

  static GaragePermissionButtonMode _buttonMode(
    GarageSettingsPermissionsState state,
  ) {
    if (state.isRequesting) {
      return GaragePermissionButtonMode.loading;
    }
    return switch (state.permissionStatus) {
      NotificationPermissionStatus.granted =>
        GaragePermissionButtonMode.granted,
      NotificationPermissionStatus.unsupported =>
        GaragePermissionButtonMode.unsupported,
      NotificationPermissionStatus.denied ||
      NotificationPermissionStatus.notDetermined =>
        GaragePermissionButtonMode.actionable,
    };
  }

  static String? _helperText(NotificationPermissionStatus status) {
    return switch (status) {
      NotificationPermissionStatus.denied =>
        'Notifications are blocked. Tap the button to try again or open device settings.',
      NotificationPermissionStatus.granted =>
        'Carport can send you reminders for upcoming maintenance.',
      _ => null,
    };
  }
}
