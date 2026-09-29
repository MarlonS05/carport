import 'package:carport/domain/entities/portal_attachment_ids_sync_result.dart';
import 'package:carport/domain/entities/portal_bulk_sync_result.dart';
import 'package:carport/domain/entities/portal_checkin_result.dart';
import 'package:carport/domain/entities/portal_permissions_sync_result.dart';

/// HTTP port for the Carport monitor mobile API.
abstract class PortalMonitorApi {
  /// Returns the device UUID from `GET /api/register`.
  Future<String> register({required String apiBaseUrl});

  /// Bulk upsert vehicles via `POST /api/vehicles/sync`.
  Future<PortalBulkSyncResult> syncVehicles({
    required String apiBaseUrl,
    required String mobileId,
    required List<Map<String, dynamic>> vehicles,
  });

  /// Bulk upsert service items via `POST /api/service-items/sync`.
  Future<PortalBulkSyncResult> syncServiceItems({
    required String apiBaseUrl,
    required String mobileId,
    required List<Map<String, dynamic>> serviceItems,
  });

  /// Replace viewer permissions via `POST /api/permissions/sync`.
  Future<PortalPermissionsSyncResult> syncPermissions({
    required String apiBaseUrl,
    required String mobileId,
    required List<int> userIds,
  });

  /// Verify sync and fetch web users via `GET /api/checkin/{updated_at}`.
  Future<PortalCheckinResult> checkin({
    required String apiBaseUrl,
    required DateTime updatedAt,
  });

  /// Reconcile attachment IDs via `POST /api/attachments/sync`.
  Future<PortalAttachmentIdsSyncResult> syncAttachmentIds({
    required String apiBaseUrl,
    required String mobileId,
    required List<String> attachmentIds,
  });

  /// Upload a vehicle attachment via `POST /api/vehicles/{vehicle_id}/attachments`.
  Future<void> uploadAttachment({
    required String apiBaseUrl,
    required String mobileId,
    required String vehicleId,
    required String attachmentId,
    required String filePath,
    required String filename,
  });
}
