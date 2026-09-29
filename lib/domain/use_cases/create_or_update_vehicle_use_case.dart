import '../entities/vehicle.dart';
import '../repositories/service_item_repository.dart';
import '../repositories/vehicle_repository.dart';
import 'package:carport/logger/logger.dart';
import 'sync_vehicle_to_portal_use_case.dart';
import 'verify_portal_sync_use_case.dart';

class CreateOrUpdateVehicleUseCase {
  CreateOrUpdateVehicleUseCase({
    required VehicleRepository vehicleRepository,
    required ServiceItemRepository serviceItemRepository,
    required SyncVehicleToPortalUseCase syncVehicleToPortalUseCase,
    required VerifyPortalSyncUseCase verifyPortalSyncUseCase,
  })  : _vehicleRepository = vehicleRepository,
        _serviceItemRepository = serviceItemRepository,
        _syncVehicleToPortalUseCase = syncVehicleToPortalUseCase,
        _verifyPortalSyncUseCase = verifyPortalSyncUseCase;

  final VehicleRepository _vehicleRepository;
  final ServiceItemRepository _serviceItemRepository;
  final SyncVehicleToPortalUseCase _syncVehicleToPortalUseCase;
  final VerifyPortalSyncUseCase _verifyPortalSyncUseCase;

  Future<Vehicle> call(Vehicle vehicle) async {
    final toSave = await _applyMileageFloor(vehicle);

    final Vehicle saved;
    if (vehicle.id.isEmpty) {
      final id = await _vehicleRepository.create(toSave);
      saved = _withId(toSave, id);
    } else {
      await _vehicleRepository.update(toSave);
      saved = toSave;
    }

    try {
      await _syncVehicleToPortalUseCase([saved]);
      await _verifyPortalSyncUseCase();
    } catch (e) {
      logFailure(
        'Failed to sync vehicle to portal after save: $e',
        error: e,
      );
    }

    return saved;
  }

  Future<Vehicle> _applyMileageFloor(Vehicle vehicle) async {
    if (vehicle.id.isEmpty) return vehicle;

    final items = await _serviceItemRepository.getByVehicleId(vehicle.id);
    if (items.isEmpty) return vehicle;

    var maxItemMileage = items.first.mileage;
    for (final item in items.skip(1)) {
      if (item.mileage > maxItemMileage) {
        maxItemMileage = item.mileage;
      }
    }

    if (vehicle.mileage >= maxItemMileage) return vehicle;

    return Vehicle(
      id: vehicle.id,
      name: vehicle.name,
      description: vehicle.description,
      maintenancePlanImage: vehicle.maintenancePlanImage,
      documentsImage: vehicle.documentsImage,
      userManualLink: vehicle.userManualLink,
      maintenanceManualLink: vehicle.maintenanceManualLink,
      mileage: maxItemMileage,
    );
  }

  Vehicle _withId(Vehicle vehicle, String id) {
    return Vehicle(
      id: id,
      name: vehicle.name,
      description: vehicle.description,
      maintenancePlanImage: vehicle.maintenancePlanImage,
      documentsImage: vehicle.documentsImage,
      userManualLink: vehicle.userManualLink,
      maintenanceManualLink: vehicle.maintenanceManualLink,
      mileage: vehicle.mileage,
    );
  }
}
