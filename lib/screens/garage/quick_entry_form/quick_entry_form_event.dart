import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_form_event.freezed.dart';

@freezed
abstract class QuickEntryFormEvent with _$QuickEntryFormEvent {
  const factory QuickEntryFormEvent.started({
    required String vehicleId,
  }) = _Started;

  const factory QuickEntryFormEvent.backTapped() = _BackTapped;

  const factory QuickEntryFormEvent.titleChanged(String value) = _TitleChanged;

  const factory QuickEntryFormEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory QuickEntryFormEvent.dateChanged(DateTime value) = _DateChanged;

  const factory QuickEntryFormEvent.mileageChanged(String value) =
      _MileageChanged;

  const factory QuickEntryFormEvent.submitted() = _Submitted;
}
