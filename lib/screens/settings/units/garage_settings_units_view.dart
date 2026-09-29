import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_radio_option_card.dart';
import 'package:carport/screens/components/garage/garage_section_label.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/units/garage_settings_units_bloc.dart';
import 'package:carport/screens/settings/units/garage_settings_units_event.dart';
import 'package:carport/screens/settings/units/garage_settings_units_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsUnitsView extends StatelessWidget {
  const GarageSettingsUnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsUnitsBloc, GarageSettingsUnitsState>(
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
                title: 'Units',
                onBack: () => context.read<GarageSettingsUnitsBloc>().add(
                      const GarageSettingsUnitsEvent.backTapped(),
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
                        const GarageSectionLabel(text: 'Distance'),
                        GarageRadioOptionCard(
                          title: DistanceUnit.miles.label,
                          subtitle: DistanceUnit.miles.pickerSubtitle,
                          selected: state.selectedUnit == DistanceUnit.miles,
                          onTap: () => context
                              .read<GarageSettingsUnitsBloc>()
                              .add(
                                const GarageSettingsUnitsEvent.unitSelected(
                                  DistanceUnit.miles,
                                ),
                              ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: GarageSpacing.list),
                          child: GarageRadioOptionCard(
                            title: DistanceUnit.kilometres.label,
                            subtitle: DistanceUnit.kilometres.pickerSubtitle,
                            selected:
                                state.selectedUnit == DistanceUnit.kilometres,
                            onTap: () => context
                                .read<GarageSettingsUnitsBloc>()
                                .add(
                                  const GarageSettingsUnitsEvent.unitSelected(
                                    DistanceUnit.kilometres,
                                  ),
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
