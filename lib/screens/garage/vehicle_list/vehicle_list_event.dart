import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_list_event.freezed.dart';

@freezed
abstract class VehicleListEvent with _$VehicleListEvent {
  const factory VehicleListEvent.started() = _Started;

  const factory VehicleListEvent.backTapped() = _BackTapped;

  const factory VehicleListEvent.addVehicleTapped() = _AddVehicleTapped;

  const factory VehicleListEvent.vehicleTapped({
    required String vehicleId,
  }) = _VehicleTapped;
}
