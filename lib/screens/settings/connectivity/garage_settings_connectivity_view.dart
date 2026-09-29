import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_list_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_bloc.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_event.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageSettingsConnectivityView extends StatelessWidget {
  const GarageSettingsConnectivityView({super.key});

  static const _urlValidator = PortalUrlValidator();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsConnectivityBloc,
        GarageSettingsConnectivityState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.errorMessage;
        if (message != null) {
          showGarageErrorDialog(context, message: message);
        }
      },
      builder: (context, state) {
        final host = state.portalBaseUrl == null
            ? null
            : _urlValidator.displayHost(state.portalBaseUrl!);

        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Connectivity',
                onBack: () =>
                    context.read<GarageSettingsConnectivityBloc>().add(
                          const GarageSettingsConnectivityEvent.backTapped(),
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
                          title: 'QR Scanner',
                          subtitle: host == null
                              ? 'Scan portal URL'
                              : 'Connected to $host',
                          icon: LucideIcons.scanLine,
                          onTap: () => context
                              .read<GarageSettingsConnectivityBloc>()
                              .add(
                                const GarageSettingsConnectivityEvent
                                    .qrScannerTapped(),
                              ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: GarageSpacing.list),
                          child: GarageListCard(
                            title: 'Web Access',
                            subtitle: 'Manage viewer access',
                            icon: LucideIcons.users,
                            onTap: () => context
                                .read<GarageSettingsConnectivityBloc>()
                                .add(
                                  const GarageSettingsConnectivityEvent
                                      .webAccessTapped(),
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
