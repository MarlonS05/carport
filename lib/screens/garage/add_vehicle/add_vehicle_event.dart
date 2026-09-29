import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_vehicle_event.freezed.dart';

@freezed
abstract class AddVehicleEvent with _$AddVehicleEvent {
  const factory AddVehicleEvent.started() = _Started;

  const factory AddVehicleEvent.backTapped() = _BackTapped;

  const factory AddVehicleEvent.submitted() = _Submitted;

  const factory AddVehicleEvent.nameChanged(String value) = _NameChanged;

  const factory AddVehicleEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory AddVehicleEvent.mileageChanged(String value) = _MileageChanged;

  const factory AddVehicleEvent.link1Changed(String value) = _Link1Changed;

  const factory AddVehicleEvent.link2Changed(String value) = _Link2Changed;
}
