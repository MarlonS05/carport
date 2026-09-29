import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/repositories/settings_repository.dart';

class GetDistanceUnitUseCase {
  const GetDistanceUnitUseCase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  Future<DistanceUnit> call() => _settingsRepository.getDistanceUnit();
}
