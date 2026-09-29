import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_detail_event.freezed.dart';

@freezed
abstract class VehicleDetailEvent with _$VehicleDetailEvent {
  const factory VehicleDetailEvent.started({
    required String vehicleId,
  }) = _Started;

  const factory VehicleDetailEvent.backTapped() = _BackTapped;

  const factory VehicleDetailEvent.editToggled() = _EditToggled;

  const factory VehicleDetailEvent.saved({
    required String name,
    required String description,
    required String mileage,
    required String userManualLink,
    required String maintenanceManualLink,
    String? maintenancePlanImage,
    String? documentsImage,
  }) = _Saved;

  const factory VehicleDetailEvent.serviceLogTapped() = _ServiceLogTapped;

  const factory VehicleDetailEvent.mpgHistoryTapped() = _MpgHistoryTapped;

  const factory VehicleDetailEvent.attachmentsTapped() = _AttachmentsTapped;

  const factory VehicleDetailEvent.documentsButtonTapped() =
      _DocumentsButtonTapped;

  const factory VehicleDetailEvent.deleteConfirmed() = _DeleteConfirmed;
}
