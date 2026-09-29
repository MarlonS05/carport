import 'package:carport/logger/logger.dart';

import '../../entities/mpg_entry.dart';
import '../../repositories/mpg_entry_repository.dart';
import '../use_case_validation_exception.dart';

class CreateMpgEntryUseCase {
  CreateMpgEntryUseCase({
    required MpgEntryRepository mpgEntryRepository,
  }) : _mpgEntryRepository = mpgEntryRepository;

  final MpgEntryRepository _mpgEntryRepository;

  Future<String> call(MpgEntry entry) async {
    final fieldErrors = <String, String>{};
    if (entry.vehicleId.isEmpty) {
      fieldErrors['vehicleId'] = 'Vehicle is required';
    }
    if (entry.liters <= 0) {
      fieldErrors['liters'] = 'Fill amount must be greater than zero';
    }
    if (entry.distance <= 0) {
      fieldErrors['distance'] = 'Distance must be greater than zero';
    }
    if (fieldErrors.isNotEmpty) {
      throw UseCaseValidationException(fieldErrors);
    }

    final id = await _mpgEntryRepository.create(entry);
    logSuccess('Created MPG entry $id for vehicle ${entry.vehicleId}');
    return id;
  }
}
