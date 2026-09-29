import 'package:carport/domain/use_cases/sync_vehicle_attachment_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../entities/vehicle_attachment.dart';
import '../repositories/vehicle_attachment_repository.dart';
import '../services/vehicle_attachment_storage.dart';

class AttachVehicleFileUseCase {
  AttachVehicleFileUseCase({
    required VehicleAttachmentRepository attachmentRepository,
    required VehicleAttachmentStorage attachmentStorage,
    required SyncVehicleAttachmentToPortalUseCase
        syncVehicleAttachmentToPortalUseCase,
    required VerifyPortalSyncUseCase verifyPortalSyncUseCase,
    Uuid? uuid,
  })  : _attachmentRepository = attachmentRepository,
        _attachmentStorage = attachmentStorage,
        _syncVehicleAttachmentToPortalUseCase =
            syncVehicleAttachmentToPortalUseCase,
        _verifyPortalSyncUseCase = verifyPortalSyncUseCase,
        _uuid = uuid ?? const Uuid();

  final VehicleAttachmentRepository _attachmentRepository;
  final VehicleAttachmentStorage _attachmentStorage;
  final SyncVehicleAttachmentToPortalUseCase
      _syncVehicleAttachmentToPortalUseCase;
  final VerifyPortalSyncUseCase _verifyPortalSyncUseCase;
  final Uuid _uuid;

  Future<VehicleAttachment> call({
    required String vehicleId,
    required String sourcePath,
    required String displayName,
    String? mimeType,
  }) async {
    final attachmentId = _uuid.v4();
    final storedPath = await _attachmentStorage.copyIntoStore(
      vehicleId: vehicleId,
      attachmentId: attachmentId,
      sourcePath: sourcePath,
      displayName: displayName,
    );

    final now = DateTime.now();
    final attachment = VehicleAttachment(
      id: attachmentId,
      vehicleId: vehicleId,
      displayName: displayName,
      filePath: storedPath,
      mimeType: mimeType,
      createdAt: now,
      updatedAt: now,
    );

    await _attachmentRepository.create(attachment);

    try {
      await _syncVehicleAttachmentToPortalUseCase([attachment]);
      await _verifyPortalSyncUseCase();
    } catch (e) {
      logFailure(
        'Failed to sync attachment to portal after attach: $e',
        error: e,
      );
    }

    return attachment;
  }
}
