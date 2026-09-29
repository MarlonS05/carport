import 'package:carport/domain/use_cases/get_garage_home_stats_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  test('aggregates vehicle and service item counts', () async {
    final vehicleRepository = MockVehicleRepository();
    final serviceItemRepository = MockServiceItemRepository();
    when(() => vehicleRepository.countAll()).thenAnswer((_) async => 3);
    when(() => serviceItemRepository.countAll()).thenAnswer((_) async => 7);

    final useCase = GetGarageHomeStatsUseCase(
      vehicleRepository: vehicleRepository,
      serviceItemRepository: serviceItemRepository,
    );

    final stats = await useCase();

    expect(stats.vehicleCount, 3);
    expect(stats.entryCount, 7);
  });
}
