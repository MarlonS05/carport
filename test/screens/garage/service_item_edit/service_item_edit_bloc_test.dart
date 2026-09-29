import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_bloc.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_event.dart';
import 'package:carport/screens/garage/service_item_edit/service_item_edit_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockServiceItemRepository serviceItemRepository;
  late MockVehicleRepository vehicleRepository;
  late MockCreateOrUpdateServiceItemUseCase saveItem;
  late MockDeleteServiceItemUseCase deleteItem;
  late MockGetDistanceUnitUseCase getUnit;
  late MockAppRouter router;

  setUp(() {
    serviceItemRepository = MockServiceItemRepository();
    vehicleRepository = MockVehicleRepository();
    saveItem = MockCreateOrUpdateServiceItemUseCase();
    deleteItem = MockDeleteServiceItemUseCase();
    getUnit = MockGetDistanceUnitUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
    when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
  });

  ServiceItemEditBloc build() => ServiceItemEditBloc(
        serviceItemRepository: serviceItemRepository,
        vehicleRepository: vehicleRepository,
        createOrUpdateServiceItemUseCase: saveItem,
        deleteServiceItemUseCase: deleteItem,
        getDistanceUnitUseCase: getUnit,
        router: router,
      );

  final vehicle = buildVehicle(id: 'v1');
  final item = buildServiceItem(id: 's1', vehicleId: 'v1', title: 'Oil', mileage: 1200);

  blocTest<ServiceItemEditBloc, ServiceItemEditState>(
    'started loads the entry and seeds the draft fields',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => serviceItemRepository.getById('s1'))
          .thenAnswer((_) async => item);
    },
    build: build,
    act: (bloc) => bloc.add(
      const ServiceItemEditEvent.started(vehicleId: 'v1', serviceItemId: 's1'),
    ),
    expect: () => [
      isA<ServiceItemEditState>().having((s) => s.isLoading, 'isLoading', true),
      isA<ServiceItemEditState>()
          .having((s) => s.isLoading, 'isLoading', false)
          .having((s) => s.serviceItem, 'serviceItem', item)
          .having((s) => s.draftTitle, 'draftTitle', 'Oil')
          .having((s) => s.draftMileage, 'draftMileage', '1200'),
    ],
  );

  blocTest<ServiceItemEditBloc, ServiceItemEditState>(
    'started reports mismatched vehicle ownership',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => serviceItemRepository.getById('s1')).thenAnswer(
        (_) async => buildServiceItem(id: 's1', vehicleId: 'other'),
      );
    },
    build: build,
    act: (bloc) => bloc.add(
      const ServiceItemEditEvent.started(vehicleId: 'v1', serviceItemId: 's1'),
    ),
    expect: () => [
      isA<ServiceItemEditState>().having((s) => s.isLoading, 'isLoading', true),
      isA<ServiceItemEditState>()
          .having((s) => s.isLoading, 'isLoading', false)
          .having((s) => s.errorMessage, 'errorMessage', contains('does not belong')),
    ],
  );

  final seeded = ServiceItemEditState(
    serviceItem: item,
    vehicle: vehicle,
    isLoading: false,
    draftTitle: 'Oil',
    draftMileage: '1200',
    draftDate: item.date,
  );

  blocTest<ServiceItemEditBloc, ServiceItemEditState>(
    'saved with a blank title reports a title error',
    build: build,
    seed: () => seeded.copyWith(draftTitle: ''),
    act: (bloc) => bloc.add(const ServiceItemEditEvent.saved()),
    expect: () => [
      seeded.copyWith(draftTitle: '', titleError: 'Title is required'),
    ],
    verify: (_) => verifyNever(() => saveItem(any())),
  );

  blocTest<ServiceItemEditBloc, ServiceItemEditState>(
    'saved persists the entry and pops',
    setUp: () => when(() => saveItem(any())).thenAnswer((_) async => 's1'),
    build: build,
    seed: () => seeded,
    act: (bloc) => bloc.add(const ServiceItemEditEvent.saved()),
    expect: () => [seeded.copyWith(isSaving: true)],
    verify: (_) {
      verify(() => saveItem(any())).called(1);
      verify(() => router.pop()).called(1);
    },
  );

  blocTest<ServiceItemEditBloc, ServiceItemEditState>(
    'deleteConfirmed deletes the entry and pops',
    setUp: () => when(() => deleteItem(any())).thenAnswer((_) async {}),
    build: build,
    seed: () => seeded,
    act: (bloc) => bloc.add(const ServiceItemEditEvent.deleteConfirmed()),
    expect: () => [seeded.copyWith(isDeleting: true)],
    verify: (_) {
      verify(() => deleteItem('s1')).called(1);
      verify(() => router.pop()).called(1);
    },
  );
}
