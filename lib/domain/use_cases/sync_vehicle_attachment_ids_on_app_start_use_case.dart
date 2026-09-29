import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';

class SyncVehicleAttachmentIdsOnAppStartUseCase {
  const SyncVehicleAttachmentIdsOnAppStartUseCase({
    required SyncVehicleAttachmentIdsToPortalUseCase
        syncVehicleAttachmentIdsToPortalUseCase,
  }) : _syncVehicleAttachmentIdsToPortalUseCase =
            syncVehicleAttachmentIdsToPortalUseCase;

  final SyncVehicleAttachmentIdsToPortalUseCase
      _syncVehicleAttachmentIdsToPortalUseCase;

  Future<void> call() async {
    await _syncVehicleAttachmentIdsToPortalUseCase();
  }
}
