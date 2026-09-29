import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_log_state.freezed.dart';

@freezed
abstract class ServiceLogState with _$ServiceLogState {
  const factory ServiceLogState({
    Vehicle? vehicle,
    @Default([]) List<ServiceItem> entries,
    @Default(true) bool isLoading,
    String? errorMessage,
  }) = _ServiceLogState;
}
