import 'package:carport/domain/entities/reminder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_reminders_state.freezed.dart';

@freezed
abstract class GarageRemindersState with _$GarageRemindersState {
  const factory GarageRemindersState({
    @Default(true) bool isLoading,
    @Default([]) List<Reminder> reminders,
    String? errorMessage,
  }) = _GarageRemindersState;
}
