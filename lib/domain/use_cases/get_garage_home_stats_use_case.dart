import '../repositories/service_item_repository.dart';
import '../repositories/vehicle_repository.dart';

class GarageHomeStats {
  const GarageHomeStats({
    required this.vehicleCount,
    required this.entryCount,
  });

  final int vehicleCount;
  final int entryCount;
}

class GetGarageHomeStatsUseCase {
  GetGarageHomeStatsUseCase({
    required VehicleRepository vehicleRepository,
    required ServiceItemRepository serviceItemRepository,
  })  : _vehicleRepository = vehicleRepository,
        _serviceItemRepository = serviceItemRepository;

  final VehicleRepository _vehicleRepository;
  final ServiceItemRepository _serviceItemRepository;

  Future<GarageHomeStats> call() async {
    final vehicleCount = await _vehicleRepository.countAll();
    final entryCount = await _serviceItemRepository.countAll();
    return GarageHomeStats(
      vehicleCount: vehicleCount,
      entryCount: entryCount,
    );
  }
}
