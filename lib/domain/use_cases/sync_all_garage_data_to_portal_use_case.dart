import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/vehicle_attachment_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/sync_service_item_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_to_portal_use_case.dart';

class SyncAllGarageDataToPortalUseCase {
  const SyncAllGarageDataToPortalUseCase({
    required VehicleRepository vehicleRepository,
    required ServiceItemRepository serviceItemRepository,
    required VehicleAttachmentRepository attachmentRepository,
    required SyncVehicleToPortalUseCase syncVehicleToPortalUseCase,
    required SyncServiceItemToPortalUseCase syncServiceItemToPortalUseCase,
    required SyncVehicleAttachmentToPortalUseCase
        syncVehicleAttachmentToPortalUseCase,
  })  : _vehicleRepository = vehicleRepository,
        _serviceItemRepository = serviceItemRepository,
        _attachmentRepository = attachmentRepository,
        _syncVehicleToPortalUseCase = syncVehicleToPortalUseCase,
        _syncServiceItemToPortalUseCase = syncServiceItemToPortalUseCase,
        _syncVehicleAttachmentToPortalUseCase =
            syncVehicleAttachmentToPortalUseCase;

  final VehicleRepository _vehicleRepository;
  final ServiceItemRepository _serviceItemRepository;
  final VehicleAttachmentRepository _attachmentRepository;
  final SyncVehicleToPortalUseCase _syncVehicleToPortalUseCase;
  final SyncServiceItemToPortalUseCase _syncServiceItemToPortalUseCase;
  final SyncVehicleAttachmentToPortalUseCase
      _syncVehicleAttachmentToPortalUseCase;

  Future<void> call() async {
    final vehicles = await _vehicleRepository.getAll();
    await _syncVehicleToPortalUseCase(vehicles);

    final serviceItems = <ServiceItem>[];
    final attachments = <VehicleAttachment>[];
    for (final vehicle in vehicles) {
      serviceItems.addAll(
        await _serviceItemRepository.getByVehicleId(vehicle.id),
      );
      attachments.addAll(
        await _attachmentRepository.listByVehicleId(vehicle.id),
      );
    }

    await _syncServiceItemToPortalUseCase(serviceItems);
    await _syncVehicleAttachmentToPortalUseCase(attachments);
  }
}
