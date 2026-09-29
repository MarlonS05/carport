import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/domain/formatters/garage_datetime_formatter.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_input_field.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_reminder_repeat_dropdown.dart';
import 'package:carport/screens/components/garage/garage_reminder_type_toggle.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_textarea_field.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_bloc.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_event.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageReminderFormView extends StatefulWidget {
  const GarageReminderFormView({super.key});

  @override
  State<GarageReminderFormView> createState() => _GarageReminderFormViewState();
}

class _GarageReminderFormViewState extends State<GarageReminderFormView> {
  final _nameController = TextEditingController();
  final _bodyController = TextEditingController();
  final _dueController = TextEditingController();
  DateTime? _selectedDueAt;
  bool _seeded = false;

  @override
  void dispose() {
    _nameController.dispose();
    _bodyController.dispose();
    _dueController.dispose();
    super.dispose();
  }

  DateTime _defaultDueAt() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, now.hour)
        .add(const Duration(hours: 1));
  }

  void _seedControllers(GarageReminderFormState state) {
    if (_seeded) return;

    if (state.mode == GarageReminderFormMode.edit && state.reminder != null) {
      final reminder = state.reminder!;
      _nameController.text = reminder.name;
      _bodyController.text = reminder.body;
      _selectedDueAt = reminder.dueAt;
      _dueController.text = GarageDateTimeFormatter.format(reminder.dueAt);
      _seeded = true;
      return;
    }

    if (state.mode == GarageReminderFormMode.add && !state.isLoading) {
      _selectedDueAt = _defaultDueAt();
      _dueController.text = GarageDateTimeFormatter.format(_selectedDueAt!);
      _seeded = true;
    }
  }

  Future<void> _pickDueDateTime(BuildContext context) async {
    final current = _selectedDueAt ?? _defaultDueAt();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      builder: (context, child) => _themedPicker(context, child),
    );
    if (pickedDate == null || !mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
      builder: (context, child) => _themedPicker(context, child),
    );
    if (pickedTime == null || !mounted) return;

    setState(() {
      _selectedDueAt = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      _dueController.text = GarageDateTimeFormatter.format(_selectedDueAt!);
    });
  }

  String _recurrenceHint(ReminderRepeatFrequency frequency) {
    return switch (frequency) {
      ReminderRepeatFrequency.daily =>
        'Fires every day at the due time.',
      ReminderRepeatFrequency.weekly =>
        'Fires every week on the due weekday.',
      ReminderRepeatFrequency.monthly =>
        'Fires monthly on the due day. Months without that day (e.g. the 31st) are skipped.',
      ReminderRepeatFrequency.yearly =>
        'Fires yearly on the due month and day. Feb 29 fires in leap years only.',
    };
  }

  Widget _themedPicker(BuildContext context, Widget? child) {
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageReminderFormBloc, GarageReminderFormState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage ||
          previous.warningMessage != current.warningMessage,
      listener: (context, state) {
        if (state.errorMessage != null) {
          showGarageErrorDialog(context, message: state.errorMessage!);
        }
        if (state.warningMessage != null) {
          showGarageErrorDialog(context, message: state.warningMessage!);
        }
      },
      builder: (context, state) {
        if (!state.isLoading) {
          _seedControllers(state);
        }

        final theme = GarageTheme.of(context);
        final isEdit = state.mode == GarageReminderFormMode.edit;
        final title = isEdit ? 'Edit Reminder' : 'New Reminder';
        final dueLabel = state.repeating ? 'Next due' : 'Due';
        final formDisabled =
            state.isLoading || state.errorMessage != null && isEdit && state.reminder == null;

        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: title,
                onBack: () => context.read<GarageReminderFormBloc>().add(
                      const GarageReminderFormEvent.backTapped(),
                    ),
              ),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          left: GarageSpacing.screenH,
                          right: GarageSpacing.screenH,
                          bottom: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GarageReminderTypeToggle(
                              repeating: state.repeating,
                              onChanged: (repeating) =>
                                  context.read<GarageReminderFormBloc>().add(
                                        GarageReminderFormEvent.repeatingChanged(
                                          repeating: repeating,
                                        ),
                                      ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GarageInputField(
                                label: 'Name',
                                placeholder: 'Oil change, Registration…',
                                icon: LucideIcons.bell,
                                controller: _nameController,
                                errorText: state.fieldErrors['name'],
                                readOnly: formDisabled,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GarageTextareaField(
                                label: 'Note',
                                placeholder: 'Short reminder body…',
                                controller: _bodyController,
                                readOnly: formDisabled,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GarageInputField(
                                label: dueLabel,
                                icon: LucideIcons.calendar,
                                controller: _dueController,
                                readOnly: true,
                                onTap: formDisabled
                                    ? null
                                    : () => _pickDueDateTime(context),
                              ),
                            ),
                            if (state.repeating) ...[
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: GarageReminderRepeatDropdown(
                                  value: state.repeatFrequency,
                                  enabled: !formDisabled,
                                  onChanged: (frequency) => context
                                      .read<GarageReminderFormBloc>()
                                      .add(
                                        GarageReminderFormEvent
                                            .repeatFrequencyChanged(
                                          frequency: frequency,
                                        ),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  _recurrenceHint(state.repeatFrequency),
                                  style: GarageTextStyles.body(
                                    theme,
                                    color: theme.mutedForeground,
                                  ),
                                ),
                              ),
                            ],
                            if (state.errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  state.errorMessage!,
                                  style: GarageTextStyles.body(
                                    theme,
                                    color: theme.destructive,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GaragePrimaryButton(
                                label: isEdit ? 'Save Changes' : 'Add Reminder',
                                isLoading: state.isSubmitting,
                                onPressed: formDisabled || state.isSubmitting
                                    ? null
                                    : () {
                                        final dueAt =
                                            _selectedDueAt ?? _defaultDueAt();
                                        context
                                            .read<GarageReminderFormBloc>()
                                            .add(
                                              GarageReminderFormEvent.saveTapped(
                                                name: _nameController.text,
                                                body: _bodyController.text,
                                                dueAt: dueAt,
                                              ),
                                            );
                                      },
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
