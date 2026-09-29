import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_section_label.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_toggle_list_card.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_bloc.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_event.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageSettingsWebAccessView extends StatelessWidget {
  const GarageSettingsWebAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsWebAccessBloc,
        GarageSettingsWebAccessState>(
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

        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Web Access',
                onBack: () => context.read<GarageSettingsWebAccessBloc>().add(
                      const GarageSettingsWebAccessEvent.backTapped(),
                    ),
              ),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : !state.isConnected
                        ? const GarageEmptyState(
                            icon: LucideIcons.users,
                            message: 'Connect to your monitor first',
                          )
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: GarageSpacing.screenH,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                children: [
                                  const GarageSectionLabel(text: 'Web users'),
                                  for (var i = 0; i < state.users.length; i++)
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: i == 0 ? 0 : GarageSpacing.list,
                                      ),
                                      child: GarageToggleListCard(
                                        title: state.users[i].name,
                                        enabled: state.users[i].hasAccess,
                                        isSaving: state.savingUserIds
                                            .contains(state.users[i].id),
                                        onChanged: (enabled) => context
                                            .read<GarageSettingsWebAccessBloc>()
                                            .add(
                                              GarageSettingsWebAccessEvent
                                                  .userAccessToggled(
                                                userId: state.users[i].id,
                                                enabled: enabled,
                                              ),
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: GarageSpacing.list,
                                    ),
                                    child: Text(
                                      'Choose which monitor users can view your garage data.',
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
}
