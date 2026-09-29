import 'package:carport/domain/entities/fuel_economy_period.dart';
import 'package:carport/domain/entities/fuel_economy_unit.dart';
import 'package:carport/domain/entities/mpg_entry.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpg_history_state.freezed.dart';

@freezed
abstract class MpgHistoryState with _$MpgHistoryState {
  const factory MpgHistoryState({
    Vehicle? vehicle,
    @Default([]) List<MpgEntry> entries,
    @Default([]) List<FuelEconomyPeriod> monthlyPeriods,
    @Default([]) List<FuelEconomyPeriod> yearlyPeriods,
    @Default(FuelEconomyUnit.mpg) FuelEconomyUnit unit,
    @Default(true) bool isLoading,
    String? errorMessage,
  }) = _MpgHistoryState;
}
