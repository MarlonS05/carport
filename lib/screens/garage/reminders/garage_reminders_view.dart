import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/formatters/garage_datetime_formatter.dart';
import 'package:carport/domain/formatters/garage_repeat_frequency_formatter.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_icon_action_button.dart';
import 'package:carport/screens/components/garage/garage_reminder_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_bloc.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_event.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageRemindersView extends StatelessWidget {
  const GarageRemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageRemindersBloc, GarageRemindersState>(
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
        final oneTime =
            state.reminders.where((reminder) => !reminder.isRepeating).toList();
        final repeating =
            state.reminders.where((reminder) => reminder.isRepeating).toList();

        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Reminders',
                onBack: () => context.read<GarageRemindersBloc>().add(
                      const GarageRemindersEvent.backTapped(),
                    ),
                action: GarageIconActionButton(
                  semanticsLabel: 'Add reminder',
                  onPressed: () => context.read<GarageRemindersBloc>().add(
                        const GarageRemindersEvent.addTapped(),
                      ),
                ),
              ),
              Expanded(
                child: _buildBody(context, state, theme, oneTime, repeating),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    GarageRemindersState state,
    GarageTheme theme,
    List<Reminder> oneTime,
    List<Reminder> repeating,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.reminders.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GarageSpacing.screenH),
          child: Text(
            state.errorMessage!,
            style: GarageTextStyles.body(theme, color: theme.destructive),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (state.reminders.isEmpty) {
      return const Center(
        child: GarageEmptyState(
          icon: LucideIcons.bell,
          message: 'No reminders yet',
          iconSize: 40,
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.only(
        left: GarageSpacing.screenH,
        right: GarageSpacing.screenH,
        bottom: 32,
      ),
      children: [
        if (oneTime.isNotEmpty) ...[
          _SectionLabel(text: 'One-time'),
          for (var i = 0; i < oneTime.length; i++) ...[
            if (i > 0)
              const Padding(padding: EdgeInsets.only(top: GarageSpacing.list)),
            _ReminderCardWrapper(reminder: oneTime[i]),
          ],
        ],
        if (oneTime.isNotEmpty && repeating.isNotEmpty)
          const Padding(padding: EdgeInsets.only(top: 24)),
        if (repeating.isNotEmpty) ...[
          _SectionLabel(text: 'Repeating'),
          for (var i = 0; i < repeating.length; i++) ...[
            if (i > 0)
              const Padding(padding: EdgeInsets.only(top: GarageSpacing.list)),
            _ReminderCardWrapper(reminder: repeating[i]),
          ],
        ],
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: GarageSpacing.list),
      child: Text(
        text.toUpperCase(),
        style: GarageTextStyles.fieldLabel(theme),
      ),
    );
  }
}

class _ReminderCardWrapper extends StatelessWidget {
  const _ReminderCardWrapper({required this.reminder});

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    final frequency = reminder.repeatFrequency;
    return GarageReminderCard(
      name: reminder.name,
      body: reminder.body,
      dueLabel: GarageDateTimeFormatter.format(reminder.dueAt),
      repeating: reminder.isRepeating,
      recurrenceLabel: frequency == null
          ? null
          : GarageRepeatFrequencyFormatter.format(
              frequency: frequency,
              dueAt: reminder.dueAt,
            ),
      onEdit: () => context.read<GarageRemindersBloc>().add(
            GarageRemindersEvent.editTapped(reminderId: reminder.id),
          ),
      onDelete: () => context.read<GarageRemindersBloc>().add(
            GarageRemindersEvent.deleteTapped(reminderId: reminder.id),
          ),
    );
  }
}
