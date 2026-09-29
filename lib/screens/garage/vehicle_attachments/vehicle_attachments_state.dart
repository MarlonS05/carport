import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_attachments_state.freezed.dart';

@freezed
abstract class VehicleAttachmentsState with _$VehicleAttachmentsState {
  const factory VehicleAttachmentsState({
    @Default(true) bool isLoading,
    @Default(false) bool isAttaching,
    @Default(false) bool isDeleting,
    Vehicle? vehicle,
    @Default([]) List<VehicleAttachment> attachments,
    String? errorMessage,
  }) = _VehicleAttachmentsState;
}
