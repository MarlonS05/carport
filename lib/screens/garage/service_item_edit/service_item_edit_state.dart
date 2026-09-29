import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_item_edit_state.freezed.dart';

@freezed
abstract class ServiceItemEditState with _$ServiceItemEditState {
  const factory ServiceItemEditState({
    ServiceItem? serviceItem,
    Vehicle? vehicle,
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isDeleting,
    String? errorMessage,
    String? titleError,
    @Default('') String draftTitle,
    @Default('') String draftDescription,
    DateTime? draftDate,
    @Default('') String draftMileage,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
  }) = _ServiceItemEditState;
}
