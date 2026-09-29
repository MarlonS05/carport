import 'package:carport/domain/entities/fuel_economy_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpg_history_event.freezed.dart';

@freezed
abstract class MpgHistoryEvent with _$MpgHistoryEvent {
  const factory MpgHistoryEvent.started({required String vehicleId}) = _Started;

  const factory MpgHistoryEvent.backTapped() = _BackTapped;

  const factory MpgHistoryEvent.unitChanged({
    required FuelEconomyUnit unit,
  }) = _UnitChanged;
}
