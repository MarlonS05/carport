import 'package:carport/domain/repositories/reminder_repository.dart';
import 'package:carport/domain/use_cases/delete_reminder_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_event.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageRemindersBloc
    extends Bloc<GarageRemindersEvent, GarageRemindersState> {
  GarageRemindersBloc({
    required ReminderRepository reminderRepository,
    required DeleteReminderUseCase deleteReminderUseCase,
    required AppRouter router,
  })  : _reminderRepository = reminderRepository,
        _deleteReminderUseCase = deleteReminderUseCase,
        _router = router,
        super(const GarageRemindersState()) {
    on<GarageRemindersEvent>(_onEvent);
  }

  final ReminderRepository _reminderRepository;
  final DeleteReminderUseCase _deleteReminderUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageRemindersEvent event,
    Emitter<GarageRemindersState> emit,
  ) async {
    await event.map(
      started: (_) => _loadReminders(emit),
      refreshed: (_) => _loadReminders(emit, showLoading: false),
      backTapped: (_) async => _router.pop(),
      addTapped: (_) async {
        await _router.push(AppRoutes.addReminder);
        await _loadReminders(emit, showLoading: false);
      },
      editTapped: (event) async {
        await _router.push(AppRoutes.reminderEdit(event.reminderId));
        await _loadReminders(emit, showLoading: false);
      },
      deleteTapped: (event) async => _deleteReminder(emit, event.reminderId),
    );
  }

  Future<void> _loadReminders(
    Emitter<GarageRemindersState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(state.copyWith(isLoading: true, errorMessage: null));
    }

    try {
      final reminders = await _reminderRepository.listAll();
      emit(
        state.copyWith(
          reminders: reminders,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load reminders', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load reminders',
        ),
      );
    }
  }

  Future<void> _deleteReminder(
    Emitter<GarageRemindersState> emit,
    String reminderId,
  ) async {
    try {
      await _deleteReminderUseCase(reminderId);
      await _loadReminders(emit, showLoading: false);
    } catch (e, st) {
      logger.e('Failed to delete reminder', error: e, stackTrace: st);
      emit(state.copyWith(errorMessage: 'Could not delete reminder'));
    }
  }
}
