import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_textarea_field.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_bloc.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_event.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class AddVehicleView extends StatefulWidget {
  const AddVehicleView({super.key});

  @override
  State<AddVehicleView> createState() => _AddVehicleViewState();
}

class _AddVehicleViewState extends State<AddVehicleView> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _mileageController = TextEditingController();
  final _link1Controller = TextEditingController();
  final _link2Controller = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _mileageController.dispose();
    _link1Controller.dispose();
    _link2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Add Vehicle',
                onBack: () => context.read<AddVehicleBloc>().add(
                      const AddVehicleEvent.backTapped(),
                    ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    GarageSpacing.screenH,
                    0,
                    GarageSpacing.screenH,
                    24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (state.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: GarageSpacing.section,
                          ),
                          child: Text(
                            state.errorMessage!,
                            style: GarageTextStyles.body(
                              GarageTheme.of(context),
                              color: GarageTheme.of(context).destructive,
                            ),
                          ),
                        ),
                      GarageInputField(
                        label: 'VEHICLE NAME',
                        controller: _nameController,
                        icon: LucideIcons.car,
                        placeholder: '2022 Honda Civic',
                        onChanged: (value) => context.read<AddVehicleBloc>().add(
                              AddVehicleEvent.nameChanged(value),
                            ),
                      ),
                      if (state.nameError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
                          child: Text(
                            state.nameError!,
                            style: GarageTextStyles.body(
                              GarageTheme.of(context),
                              color: GarageTheme.of(context).destructive,
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: GarageSpacing.section),
                        child: GarageTextareaField(
                          label: 'DESCRIPTION',
                          controller: _descriptionController,
                          placeholder: 'Optional notes',
                          onChanged: (value) =>
                              context.read<AddVehicleBloc>().add(
                                    AddVehicleEvent.descriptionChanged(value),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: GarageSpacing.section),
                        child: GarageInputField(
                          label: GarageMileageFormatter.mileageFieldLabel(
                            'CURRENT MILEAGE',
                            unit: state.distanceUnit,
                          ),
                          controller: _mileageController,
                          icon: LucideIcons.gauge,
                          placeholder: '0',
                          keyboardType: TextInputType.number,
                          onChanged: (value) =>
                              context.read<AddVehicleBloc>().add(
                                    AddVehicleEvent.mileageChanged(value),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: GarageSpacing.section),
                        child: GarageInputField(
                          label: 'LINK 1',
                          controller: _link1Controller,
                          icon: LucideIcons.link2,
                          placeholder: 'https://',
                          keyboardType: TextInputType.url,
                          onChanged: (value) => context.read<AddVehicleBloc>().add(
                                AddVehicleEvent.link1Changed(value),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: GarageSpacing.section),
                        child: GarageInputField(
                          label: 'LINK 2',
                          controller: _link2Controller,
                          icon: LucideIcons.link2,
                          placeholder: 'https://',
                          keyboardType: TextInputType.url,
                          onChanged: (value) => context.read<AddVehicleBloc>().add(
                                AddVehicleEvent.link2Changed(value),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: GarageSpacing.section),
                        child: GaragePrimaryButton(
                          label: 'Add to Garage',
                          isLoading: state.isSubmitting,
                          onPressed: state.isSubmitting
                              ? null
                              : () => context.read<AddVehicleBloc>().add(
                                    const AddVehicleEvent.submitted(),
                                  ),
                        ),
                      ),
                    ],
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
