import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_select_event.freezed.dart';

@freezed
abstract class QuickEntrySelectEvent with _$QuickEntrySelectEvent {
  const factory QuickEntrySelectEvent.started() = _Started;

  const factory QuickEntrySelectEvent.backTapped() = _BackTapped;

  const factory QuickEntrySelectEvent.vehicleTapped({
    required String vehicleId,
  }) = _VehicleTapped;
}
