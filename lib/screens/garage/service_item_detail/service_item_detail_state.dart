import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_item_detail_state.freezed.dart';

@freezed
abstract class ServiceItemDetailState with _$ServiceItemDetailState {
  const factory ServiceItemDetailState({
    ServiceItem? serviceItem,
    Vehicle? vehicle,
    @Default(false) bool isEditing,
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,
    String? errorMessage,
    String? titleError,
    @Default('') String draftTitle,
    @Default('') String draftDescription,
    DateTime? draftDate,
    @Default('') String draftMileage,
  }) = _ServiceItemDetailState;
}
