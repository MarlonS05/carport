import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_radio_option_card.dart';
import 'package:carport/screens/components/garage/garage_section_label.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_bloc.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_event.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsAppearanceView extends StatelessWidget {
  const GarageSettingsAppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsAppearanceBloc,
        GarageSettingsAppearanceState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.errorMessage;
        if (message != null) {
          showGarageErrorDialog(context, message: message);
        }
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Appearance',
                onBack: () => context.read<GarageSettingsAppearanceBloc>().add(
                      const GarageSettingsAppearanceEvent.backTapped(),
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
                        const GarageSectionLabel(text: 'Color theme'),
                        for (final (index, preset) in ColorThemePreset.values
                            .indexed) ...[
                          if (index > 0)
                            const Padding(
                              padding: EdgeInsets.only(top: GarageSpacing.list),
                            ),
                          GarageRadioOptionCard(
                            title: preset.label,
                            selected: state.selectedPreset == preset,
                            onTap: () => context
                                .read<GarageSettingsAppearanceBloc>()
                                .add(
                                  GarageSettingsAppearanceEvent.presetSelected(
                                    preset,
                                  ),
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  GarageSpacing.screenH,
                  GarageSpacing.section,
                  GarageSpacing.screenH,
                  GarageSpacing.screenH,
                ),
                child: GaragePrimaryButton(
                  label: 'Save',
                  isLoading: state.isSaving,
                  onPressed: state.hasChanges && !state.isSaving
                      ? () => context.read<GarageSettingsAppearanceBloc>().add(
                            const GarageSettingsAppearanceEvent.saveTapped(),
                          )
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
