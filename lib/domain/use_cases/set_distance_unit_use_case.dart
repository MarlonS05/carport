import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/repositories/settings_repository.dart';

class SetDistanceUnitUseCase {
  const SetDistanceUnitUseCase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  Future<void> call(DistanceUnit unit) =>
      _settingsRepository.setDistanceUnit(unit);
}
