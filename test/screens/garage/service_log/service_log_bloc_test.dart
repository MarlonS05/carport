import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/service_log/service_log_bloc.dart';
import 'package:carport/screens/garage/service_log/service_log_event.dart';
import 'package:carport/screens/garage/service_log/service_log_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  late MockVehicleRepository vehicleRepository;
  late MockServiceItemRepository serviceItemRepository;
  late MockGetDistanceUnitUseCase getUnit;
  late MockAppRouter router;

  setUp(() {
    vehicleRepository = MockVehicleRepository();
    serviceItemRepository = MockServiceItemRepository();
    getUnit = MockGetDistanceUnitUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
    when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
  });

  ServiceLogBloc build() => ServiceLogBloc(
        vehicleRepository: vehicleRepository,
        serviceItemRepository: serviceItemRepository,
        getDistanceUnitUseCase: getUnit,
        router: router,
      );

  final vehicle = buildVehicle(id: 'v1');
  final entries = [buildServiceItem(id: 's1', vehicleId: 'v1')];

  blocTest<ServiceLogBloc, ServiceLogState>(
    'started loads the vehicle and its entries',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => serviceItemRepository.getByVehicleId('v1'))
          .thenAnswer((_) async => entries);
    },
    build: build,
    act: (bloc) => bloc.add(const ServiceLogEvent.started(vehicleId: 'v1')),
    expect: () => [
      const ServiceLogState(isLoading: true),
      ServiceLogState(
        vehicle: vehicle,
        entries: entries,
        isLoading: false,
        distanceUnit: DistanceUnit.miles,
      ),
    ],
  );

  blocTest<ServiceLogBloc, ServiceLogState>(
    'started with an empty vehicleId reports an error',
    build: build,
    act: (bloc) => bloc.add(const ServiceLogEvent.started(vehicleId: '')),
    expect: () => [
      isA<ServiceLogState>()
          .having((s) => s.isLoading, 'isLoading', false)
          .having((s) => s.errorMessage, 'errorMessage', contains('vehicleId')),
    ],
  );

  blocTest<ServiceLogBloc, ServiceLogState>(
    'started reports when the vehicle is not found',
    setUp: () =>
        when(() => vehicleRepository.getById('v1')).thenAnswer((_) async => null),
    build: build,
    act: (bloc) => bloc.add(const ServiceLogEvent.started(vehicleId: 'v1')),
    expect: () => [
      const ServiceLogState(isLoading: true),
      const ServiceLogState(
        isLoading: false,
        errorMessage: 'Vehicle not found: v1',
      ),
    ],
  );

  blocTest<ServiceLogBloc, ServiceLogState>(
    'entryEditTapped navigates to the edit route after load',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => serviceItemRepository.getByVehicleId('v1'))
          .thenAnswer((_) async => entries);
    },
    build: build,
    act: (bloc) async {
      bloc.add(const ServiceLogEvent.started(vehicleId: 'v1'));
      await Future<void>.delayed(Duration.zero);
      bloc.add(const ServiceLogEvent.entryEditTapped(serviceItemId: 's1'));
    },
    verify: (_) => verify(
      () => router.push(AppRoutes.serviceItemEdit('v1', 's1')),
    ).called(1),
  );
}
