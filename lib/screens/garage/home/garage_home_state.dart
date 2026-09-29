import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_home_state.freezed.dart';

@freezed
abstract class GarageHomeState with _$GarageHomeState {
  const factory GarageHomeState({
    @Default(0) int vehicleCount,
    @Default(0) int entryCount,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _GarageHomeState;
}
