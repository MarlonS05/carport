import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/components/garage/garage_vehicle_chip.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_bloc.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_event.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class MpgFormView extends StatefulWidget {
  const MpgFormView({super.key});

  @override
  State<MpgFormView> createState() => _MpgFormViewState();
}

class _MpgFormViewState extends State<MpgFormView> {
  final _litersController = TextEditingController();
  final _distanceController = TextEditingController();

  @override
  void dispose() {
    _litersController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MpgFormBloc, MpgFormState>(
      listenWhen: (previous, current) =>
          current.errorMessage != null &&
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        showGarageErrorDialog(
          context,
          message: state.errorMessage!,
        );
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Log Fill-Up',
                backEnabled: !state.isSubmitting,
                onBack: () => context.read<MpgFormBloc>().add(
                      const MpgFormEvent.backTapped(),
                    ),
              ),
              Expanded(
                child: _Body(
                  state: state,
                  litersController: _litersController,
                  distanceController: _distanceController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.state,
    required this.litersController,
    required this.distanceController,
  });

  final MpgFormState state;
  final TextEditingController litersController;
  final TextEditingController distanceController;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicle == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final vehicle = state.vehicle;
    if (vehicle == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GarageSpacing.screenH),
          child: Text(
            state.errorMessage ?? 'Something went wrong',
            style: GarageTextStyles.body(
              GarageTheme.of(context),
              color: GarageTheme.of(context).destructive,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final theme = GarageTheme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GarageVehicleChip(vehicleName: vehicle.name),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Text(
              'This tracker only works if the tank is always filled up to the top.',
              style: GarageTextStyles.body(
                theme,
                color: theme.mutedForeground,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GarageInputField(
              label: 'FILL AMOUNT (L)',
              controller: litersController,
              icon: LucideIcons.fuel,
              placeholder: '45.2',
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) => context.read<MpgFormBloc>().add(
                    MpgFormEvent.litersChanged(value),
                  ),
            ),
          ),
          if (state.litersError != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
              child: Text(
                state.litersError!,
                style: GarageTextStyles.body(
                  theme,
                  color: theme.destructive,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GarageInputField(
              label: GarageMileageFormatter.mileageFieldLabel(
                'DISTANCE SINCE LAST FILL',
                unit: state.distanceUnit,
              ),
              controller: distanceController,
              icon: LucideIcons.gauge,
              placeholder: '320',
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) => context.read<MpgFormBloc>().add(
                    MpgFormEvent.distanceChanged(value),
                  ),
            ),
          ),
          if (state.distanceError != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
              child: Text(
                state.distanceError!,
                style: GarageTextStyles.body(
                  theme,
                  color: theme.destructive,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GaragePrimaryButton(
              label: 'Save Fill-Up',
              isLoading: state.isSubmitting,
              onPressed: state.isSubmitting
                  ? null
                  : () => context.read<MpgFormBloc>().add(
                        const MpgFormEvent.submitted(),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
