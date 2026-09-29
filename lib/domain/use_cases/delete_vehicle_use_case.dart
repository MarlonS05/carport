import '../repositories/vehicle_attachment_repository.dart';
import '../repositories/vehicle_repository.dart';
import 'delete_vehicle_attachment_use_case.dart';
import 'sync_vehicle_attachment_ids_to_portal_use_case.dart';

class DeleteVehicleUseCase {
  DeleteVehicleUseCase({
    required VehicleRepository vehicleRepository,
    required VehicleAttachmentRepository attachmentRepository,
    required DeleteVehicleAttachmentUseCase deleteVehicleAttachmentUseCase,
    required SyncVehicleAttachmentIdsToPortalUseCase
        syncVehicleAttachmentIdsToPortalUseCase,
  })  : _vehicleRepository = vehicleRepository,
        _attachmentRepository = attachmentRepository,
        _deleteVehicleAttachmentUseCase = deleteVehicleAttachmentUseCase,
        _syncVehicleAttachmentIdsToPortalUseCase =
            syncVehicleAttachmentIdsToPortalUseCase;

  final VehicleRepository _vehicleRepository;
  final VehicleAttachmentRepository _attachmentRepository;
  final DeleteVehicleAttachmentUseCase _deleteVehicleAttachmentUseCase;
  final SyncVehicleAttachmentIdsToPortalUseCase
      _syncVehicleAttachmentIdsToPortalUseCase;

  Future<void> call(String vehicleId) async {
    final attachments =
        await _attachmentRepository.listByVehicleId(vehicleId);
    for (final attachment in attachments) {
      await _deleteVehicleAttachmentUseCase(
        attachment.id,
        syncAttachmentIdsToPortal: false,
      );
    }

    await _syncVehicleAttachmentIdsToPortalUseCase();
    await _vehicleRepository.delete(vehicleId);
  }
}
