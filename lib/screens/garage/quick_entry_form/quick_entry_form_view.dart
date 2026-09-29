import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_textarea_field.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/components/garage/garage_vehicle_chip.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_bloc.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_event.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class QuickEntryFormView extends StatefulWidget {
  const QuickEntryFormView({super.key});

  @override
  State<QuickEntryFormView> createState() => _QuickEntryFormViewState();
}

class _QuickEntryFormViewState extends State<QuickEntryFormView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _mileageController = TextEditingController();

  static final _dateFormat = DateFormat('MMM d, y');

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormat.format(DateTime.now());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _mileageController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context, DateTime currentDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        final theme = GarageTheme.of(context);
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: theme.primary,
              onPrimary: theme.primaryForeground,
              surface: theme.card,
              onSurface: theme.foreground,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked == null || !context.mounted) return;
    context.read<QuickEntryFormBloc>().add(
          QuickEntryFormEvent.dateChanged(picked),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuickEntryFormBloc, QuickEntryFormState>(
      listenWhen: (previous, current) {
        if (current.errorMessage != null &&
            previous.errorMessage != current.errorMessage) {
          return true;
        }
        return previous.date != current.date;
      },
      listener: (context, state) {
        if (state.errorMessage != null) {
          showGarageErrorDialog(
            context,
            message: state.errorMessage!,
          );
        }
        _dateController.text = _dateFormat.format(state.date);
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'New Entry',
                backEnabled: !state.isSubmitting,
                onBack: () => context.read<QuickEntryFormBloc>().add(
                      const QuickEntryFormEvent.backTapped(),
                    ),
              ),
              Expanded(
                child: _Body(
                  state: state,
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                  dateController: _dateController,
                  mileageController: _mileageController,
                  onDateTap: () => _pickDate(context, state.date),
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
    required this.titleController,
    required this.descriptionController,
    required this.dateController,
    required this.mileageController,
    required this.onDateTap,
  });

  final QuickEntryFormState state;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  final TextEditingController mileageController;
  final VoidCallback onDateTap;

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
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.section),
              child: Text(
                state.errorMessage!,
                style: GarageTextStyles.body(
                  GarageTheme.of(context),
                  color: GarageTheme.of(context).destructive,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GarageInputField(
              label: 'TITLE',
              controller: titleController,
              icon: LucideIcons.fileText,
              placeholder: 'Oil change, Tire rotation…',
              onChanged: (value) => context.read<QuickEntryFormBloc>().add(
                    QuickEntryFormEvent.titleChanged(value),
                  ),
            ),
          ),
          if (state.titleError != null)
            Padding(
              padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
              child: Text(
                state.titleError!,
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
              controller: descriptionController,
              placeholder: 'Parts used, shop name, notes…',
              onChanged: (value) => context.read<QuickEntryFormBloc>().add(
                    QuickEntryFormEvent.descriptionChanged(value),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GarageInputField(
                    label: 'DATE',
                    controller: dateController,
                    icon: LucideIcons.calendar,
                    readOnly: true,
                    onTap: onDateTap,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: GarageInputField(
                      label: GarageMileageFormatter.mileageFieldLabel(
                        'MILEAGE',
                        unit: state.distanceUnit,
                      ),
                      controller: mileageController,
                      icon: LucideIcons.gauge,
                      placeholder: '61,000',
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          context.read<QuickEntryFormBloc>().add(
                                QuickEntryFormEvent.mileageChanged(value),
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: GaragePrimaryButton(
              label: 'Save Entry',
              isLoading: state.isSubmitting,
              onPressed: state.isSubmitting
                  ? null
                  : () => context.read<QuickEntryFormBloc>().add(
                        const QuickEntryFormEvent.submitted(),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
