import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpg_form_event.freezed.dart';

@freezed
abstract class MpgFormEvent with _$MpgFormEvent {
  const factory MpgFormEvent.started({
    required String vehicleId,
  }) = _Started;

  const factory MpgFormEvent.backTapped() = _BackTapped;

  const factory MpgFormEvent.litersChanged(String value) = _LitersChanged;

  const factory MpgFormEvent.distanceChanged(String value) = _DistanceChanged;

  const factory MpgFormEvent.submitted() = _Submitted;
}
