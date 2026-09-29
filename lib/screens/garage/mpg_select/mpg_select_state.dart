import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpg_select_state.freezed.dart';

@freezed
abstract class MpgSelectState with _$MpgSelectState {
  const factory MpgSelectState({
    @Default([]) List<Vehicle> vehicles,
    @Default(true) bool isLoading,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    String? errorMessage,
  }) = _MpgSelectState;
}
