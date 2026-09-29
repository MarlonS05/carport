import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpg_select_event.freezed.dart';

@freezed
abstract class MpgSelectEvent with _$MpgSelectEvent {
  const factory MpgSelectEvent.started() = _Started;

  const factory MpgSelectEvent.backTapped() = _BackTapped;

  const factory MpgSelectEvent.vehicleTapped({
    required String vehicleId,
  }) = _VehicleTapped;
}
