import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';
import 'package:carport/logger/logger.dart';

import '../repositories/vehicle_attachment_repository.dart';
import '../services/vehicle_attachment_storage.dart';

class DeleteVehicleAttachmentUseCase {
  DeleteVehicleAttachmentUseCase({
    required VehicleAttachmentRepository attachmentRepository,
    required VehicleAttachmentStorage attachmentStorage,
    required SyncVehicleAttachmentIdsToPortalUseCase
        syncVehicleAttachmentIdsToPortalUseCase,
  })  : _attachmentRepository = attachmentRepository,
        _attachmentStorage = attachmentStorage,
        _syncVehicleAttachmentIdsToPortalUseCase =
            syncVehicleAttachmentIdsToPortalUseCase;

  final VehicleAttachmentRepository _attachmentRepository;
  final VehicleAttachmentStorage _attachmentStorage;
  final SyncVehicleAttachmentIdsToPortalUseCase
      _syncVehicleAttachmentIdsToPortalUseCase;

  Future<void> call(
    String attachmentId, {
    bool syncAttachmentIdsToPortal = true,
  }) async {
    final attachment = await _attachmentRepository.getById(attachmentId);
    if (attachment == null) return;

    await _attachmentStorage.deleteFile(attachment.filePath);
    await _attachmentRepository.delete(attachmentId);

    if (!syncAttachmentIdsToPortal) {
      return;
    }

    try {
      await _syncVehicleAttachmentIdsToPortalUseCase();
    } catch (e) {
      logFailure(
        'Failed to sync attachment IDs to portal after delete: $e',
        error: e,
      );
    }
  }
}
