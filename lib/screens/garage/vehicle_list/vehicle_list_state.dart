import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_list_state.freezed.dart';

@freezed
abstract class VehicleListState with _$VehicleListState {
  const factory VehicleListState({
    @Default([]) List<Vehicle> vehicles,
    @Default(true) bool isLoading,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    String? errorMessage,
  }) = _VehicleListState;
}
