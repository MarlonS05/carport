import '../entities/service_item.dart';
import '../entities/vehicle.dart';
import '../repositories/service_item_repository.dart';
import '../repositories/vehicle_repository.dart';
import 'package:carport/logger/logger.dart';
import 'sync_service_item_to_portal_use_case.dart';
import 'sync_vehicle_to_portal_use_case.dart';
import 'verify_portal_sync_use_case.dart';

class CreateOrUpdateServiceItemUseCase {
  CreateOrUpdateServiceItemUseCase({
    required ServiceItemRepository serviceItemRepository,
    required VehicleRepository vehicleRepository,
    required SyncVehicleToPortalUseCase syncVehicleToPortalUseCase,
    required SyncServiceItemToPortalUseCase syncServiceItemToPortalUseCase,
    required VerifyPortalSyncUseCase verifyPortalSyncUseCase,
  })  : _serviceItemRepository = serviceItemRepository,
        _vehicleRepository = vehicleRepository,
        _syncVehicleToPortalUseCase = syncVehicleToPortalUseCase,
        _syncServiceItemToPortalUseCase = syncServiceItemToPortalUseCase,
        _verifyPortalSyncUseCase = verifyPortalSyncUseCase;

  final ServiceItemRepository _serviceItemRepository;
  final VehicleRepository _vehicleRepository;
  final SyncVehicleToPortalUseCase _syncVehicleToPortalUseCase;
  final SyncServiceItemToPortalUseCase _syncServiceItemToPortalUseCase;
  final VerifyPortalSyncUseCase _verifyPortalSyncUseCase;

  Future<String> call(ServiceItem item) async {
    final ServiceItem saved;
    if (item.id.isEmpty) {
      final id = await _serviceItemRepository.create(item);
      saved = ServiceItem(
        id: id,
        vehicleId: item.vehicleId,
        title: item.title,
        description: item.description,
        date: item.date,
        mileage: item.mileage,
      );
    } else {
      await _serviceItemRepository.update(item);
      saved = item;
    }

    await _syncVehicleMileageIfNeeded(saved);

    try {
      final vehicle = await _vehicleRepository.getById(saved.vehicleId);
      if (vehicle != null) {
        await _syncVehicleToPortalUseCase([vehicle]);
      }
      await _syncServiceItemToPortalUseCase([saved]);
      await _verifyPortalSyncUseCase();
    } catch (e) {
      logFailure(
        'Failed to sync service item to portal after save: $e',
        error: e,
      );
    }

    return saved.id;
  }

  Future<void> _syncVehicleMileageIfNeeded(ServiceItem item) async {
    final vehicle = await _vehicleRepository.getById(item.vehicleId);
    if (vehicle == null || vehicle.mileage >= item.mileage) return;

    await _vehicleRepository.update(
      Vehicle(
        id: vehicle.id,
        name: vehicle.name,
        description: vehicle.description,
        maintenancePlanImage: vehicle.maintenancePlanImage,
        documentsImage: vehicle.documentsImage,
        userManualLink: vehicle.userManualLink,
        maintenanceManualLink: vehicle.maintenanceManualLink,
        mileage: item.mileage,
      ),
    );
  }
}
