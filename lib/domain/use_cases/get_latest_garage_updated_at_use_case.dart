import 'package:carport/domain/formatters/portal_api_datetime_formatter.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/vehicle_attachment_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';

class GetLatestGarageUpdatedAtUseCase {
  const GetLatestGarageUpdatedAtUseCase({
    required VehicleRepository vehicleRepository,
    required ServiceItemRepository serviceItemRepository,
    required VehicleAttachmentRepository attachmentRepository,
  })  : _vehicleRepository = vehicleRepository,
        _serviceItemRepository = serviceItemRepository,
        _attachmentRepository = attachmentRepository;

  final VehicleRepository _vehicleRepository;
  final ServiceItemRepository _serviceItemRepository;
  final VehicleAttachmentRepository _attachmentRepository;

  Future<DateTime> call() async {
    final latestVehicle = await _vehicleRepository.getMostRecentlyUpdated();
    final latestServiceItem =
        await _serviceItemRepository.getMostRecentlyUpdated();
    final latestAttachment = await _attachmentRepository.getMostRecentlyUpdated();

    final candidates = <DateTime>[];
    if (latestVehicle != null) {
      candidates.add(latestVehicle.updatedAt);
    }
    if (latestServiceItem != null) {
      candidates.add(latestServiceItem.updatedAt);
    }
    if (latestAttachment != null) {
      candidates.add(latestAttachment.updatedAt);
    }

    if (candidates.isEmpty) {
      return PortalApiDateTimeFormatter.epochUtc;
    }

    return candidates.reduce((a, b) => a.isAfter(b) ? a : b);
  }
}
