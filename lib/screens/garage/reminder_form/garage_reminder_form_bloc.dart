import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/domain/repositories/reminder_repository.dart';
import 'package:carport/domain/use_cases/create_or_update_reminder_use_case.dart';
import 'package:carport/domain/use_cases/use_case_validation_exception.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_event.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageReminderFormBloc
    extends Bloc<GarageReminderFormEvent, GarageReminderFormState> {
  GarageReminderFormBloc({
    required ReminderRepository reminderRepository,
    required CreateOrUpdateReminderUseCase createOrUpdateReminderUseCase,
    required AppRouter router,
  })  : _reminderRepository = reminderRepository,
        _createOrUpdateReminderUseCase = createOrUpdateReminderUseCase,
        _router = router,
        super(const GarageReminderFormState()) {
    on<GarageReminderFormEvent>(_onEvent);
  }

  final ReminderRepository _reminderRepository;
  final CreateOrUpdateReminderUseCase _createOrUpdateReminderUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageReminderFormEvent event,
    Emitter<GarageReminderFormState> emit,
  ) async {
    await event.map(
      started: (event) => _onStarted(emit, event.reminderId),
      repeatingChanged: (event) async {
        emit(state.copyWith(repeating: event.repeating));
      },
      repeatFrequencyChanged: (event) async {
        emit(state.copyWith(repeatFrequency: event.frequency));
      },
      backTapped: (_) async => _router.pop(),
      saveTapped: (event) async => _save(
        emit,
        name: event.name,
        body: event.body,
        dueAt: event.dueAt,
      ),
    );
  }

  Future<void> _onStarted(
    Emitter<GarageReminderFormState> emit,
    String? reminderId,
  ) async {
    if (reminderId == null || reminderId.isEmpty) {
      emit(
        state.copyWith(
          mode: GarageReminderFormMode.add,
          reminderId: '',
          reminder: null,
          repeating: false,
          repeatFrequency: ReminderRepeatFrequency.daily,
          isLoading: false,
          errorMessage: null,
          warningMessage: null,
          fieldErrors: {},
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        mode: GarageReminderFormMode.edit,
        reminderId: reminderId,
        isLoading: true,
        errorMessage: null,
        warningMessage: null,
        fieldErrors: {},
      ),
    );

    try {
      final reminder = await _reminderRepository.getById(reminderId);
      if (reminder == null) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Reminder not found',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          reminder: reminder,
          repeating: reminder.isRepeating,
          repeatFrequency:
              reminder.repeatFrequency ?? ReminderRepeatFrequency.daily,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load reminder', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load reminder',
        ),
      );
    }
  }

  Future<void> _save(
    Emitter<GarageReminderFormState> emit, {
    required String name,
    required String body,
    required DateTime dueAt,
  }) async {
    if (state.isSubmitting) return;

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        warningMessage: null,
        fieldErrors: {},
      ),
    );

    try {
      final outcome = await _createOrUpdateReminderUseCase(
        Reminder(
          id: state.reminderId,
          name: name,
          body: body,
          dueAt: dueAt,
          repeatFrequency: state.repeating ? state.repeatFrequency : null,
        ),
      );

      if (outcome.notificationPermissionDenied) {
        emit(
          state.copyWith(
            warningMessage:
                'Reminder saved, but notifications are disabled. Enable them in system settings.',
          ),
        );
      }

      _router.pop();
    } on UseCaseValidationException catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          fieldErrors: e.fieldErrors,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to save reminder', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Could not save reminder',
        ),
      );
    }
  }
}
