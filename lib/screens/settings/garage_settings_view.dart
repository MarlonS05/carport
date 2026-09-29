import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_list_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/garage_settings_bloc.dart';
import 'package:carport/screens/settings/garage_settings_event.dart';
import 'package:carport/screens/settings/garage_settings_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageSettingsView extends StatelessWidget {
  const GarageSettingsView({super.key});

  static const _urlValidator = PortalUrlValidator();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsBloc, GarageSettingsState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.errorMessage;
        if (message != null) {
          showGarageErrorDialog(context, message: message);
        }
      },
      builder: (context, state) {
        final connectivitySubtitle = state.portalBaseUrl == null
            ? 'Not connected'
            : _urlValidator.displayHost(state.portalBaseUrl!);

        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Settings',
                onBack: () => context.read<GarageSettingsBloc>().add(
                      const GarageSettingsEvent.backTapped(),
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
                        GarageListCard(
                          title: 'Permissions',
                          subtitle: 'Notifications',
                          icon: LucideIcons.bell,
                          onTap: () =>
                              context.read<GarageSettingsBloc>().add(
                                    const GarageSettingsEvent
                                        .permissionsTapped(),
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: GarageSpacing.list),
                          child: GarageListCard(
                            title: 'Connectivity',
                            subtitle: connectivitySubtitle,
                            icon: LucideIcons.link,
                            onTap: () =>
                                context.read<GarageSettingsBloc>().add(
                                      const GarageSettingsEvent
                                          .connectivityTapped(),
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: GarageSpacing.list),
                          child: GarageListCard(
                            title: 'Units',
                            subtitle: state.distanceUnit.label,
                            icon: LucideIcons.gauge,
                            onTap: () => context.read<GarageSettingsBloc>().add(
                              const GarageSettingsEvent.unitsTapped(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: GarageSpacing.list),
                          child: GarageListCard(
                            title: 'Appearance',
                            subtitle: state.colorThemePreset.label,
                            icon: LucideIcons.palette,
                            onTap: () =>
                                context.read<GarageSettingsBloc>().add(
                                  const GarageSettingsEvent
                                      .appearanceTapped(),
                                ),
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
}
