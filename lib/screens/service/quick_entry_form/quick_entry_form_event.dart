import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_form_event.freezed.dart';

@freezed
abstract class QuickEntryFormEvent with _$QuickEntryFormEvent {
  const factory QuickEntryFormEvent.started({
    required String vehicleId,
  }) = _Started;

  const factory QuickEntryFormEvent.backTapped() = _BackTapped;

  const factory QuickEntryFormEvent.saveTapped({
    required String title,
    required String description,
    required DateTime date,
    required String mileage,
  }) = _SaveTapped;
}
