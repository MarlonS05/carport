import 'package:carport/domain/entities/distance_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_vehicle_state.freezed.dart';

@freezed
abstract class AddVehicleState with _$AddVehicleState {
  const factory AddVehicleState({
    @Default('') String name,
    @Default('') String description,
    @Default('') String mileage,
    @Default('') String link1,
    @Default('') String link2,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    String? nameError,
  }) = _AddVehicleState;
}
