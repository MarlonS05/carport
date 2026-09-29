import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_detail_state.freezed.dart';

@freezed
abstract class VehicleDetailState with _$VehicleDetailState {
  const factory VehicleDetailState({
    Vehicle? vehicle,
    @Default(false) bool isEditing,
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isDeleting,
    @Default(false) bool isAuthenticatingDocuments,
    /// Incremented after successful biometric unlock so the view can open the
    /// documents sheet once.
    @Default(0) int documentsAccessNonce,
    @Default({}) Map<String, String> fieldErrors,
    String? errorMessage,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    @Default(0) int entryCount,
    @Default(0) int mpgEntryCount,
  }) = _VehicleDetailState;
}
