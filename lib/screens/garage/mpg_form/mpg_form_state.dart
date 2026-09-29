import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpg_form_state.freezed.dart';

@freezed
abstract class MpgFormState with _$MpgFormState {
  const factory MpgFormState({
    @Default('') String vehicleId,
    Vehicle? vehicle,
    @Default('') String liters,
    @Default('') String distance,
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    String? litersError,
    String? distanceError,
    String? errorMessage,
  }) = _MpgFormState;
}
