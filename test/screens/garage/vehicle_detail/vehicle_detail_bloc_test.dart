import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_bloc.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_event.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockVehicleRepository vehicleRepository;
  late MockServiceItemRepository serviceItemRepository;
  late MockMpgEntryRepository mpgEntryRepository;
  late MockCreateOrUpdateVehicleUseCase saveVehicle;
  late MockDeleteVehicleUseCase deleteVehicle;
  late MockGetDistanceUnitUseCase getUnit;
  late MockAuthenticateWithBiometricsUseCase authenticate;
  late MockAppRouter router;

  setUp(() {
    vehicleRepository = MockVehicleRepository();
    serviceItemRepository = MockServiceItemRepository();
    mpgEntryRepository = MockMpgEntryRepository();
    saveVehicle = MockCreateOrUpdateVehicleUseCase();
    deleteVehicle = MockDeleteVehicleUseCase();
    getUnit = MockGetDistanceUnitUseCase();
    authenticate = MockAuthenticateWithBiometricsUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
    when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
    when(() => mpgEntryRepository.getByVehicleId(any()))
        .thenAnswer((_) async => []);
  });

  VehicleDetailBloc build() => VehicleDetailBloc(
        vehicleRepository: vehicleRepository,
        serviceItemRepository: serviceItemRepository,
        mpgEntryRepository: mpgEntryRepository,
        createOrUpdateVehicleUseCase: saveVehicle,
        deleteVehicleUseCase: deleteVehicle,
        getDistanceUnitUseCase: getUnit,
        authenticateWithBiometricsUseCase: authenticate,
        router: router,
      );

  final vehicle = buildVehicle(id: 'v1', name: 'Civic');
  final savedVehicle = buildVehicle(id: 'v1', name: 'New', mileage: 2000);
  final loaded = VehicleDetailState(
    vehicle: vehicle,
    isLoading: false,
    distanceUnit: DistanceUnit.miles,
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'started loads the vehicle and entry count',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => serviceItemRepository.getByVehicleId('v1'))
          .thenAnswer((_) async => [buildServiceItem(id: 's1')]);
    },
    build: build,
    act: (bloc) =>
        bloc.add(const VehicleDetailEvent.started(vehicleId: 'v1')),
    expect: () => [
      const VehicleDetailState(isLoading: true),
      VehicleDetailState(
        vehicle: vehicle,
        isLoading: false,
        distanceUnit: DistanceUnit.miles,
        entryCount: 1,
      ),
    ],
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'started pops and errors when the vehicle is missing',
    setUp: () =>
        when(() => vehicleRepository.getById('v1')).thenAnswer((_) async => null),
    build: build,
    act: (bloc) =>
        bloc.add(const VehicleDetailEvent.started(vehicleId: 'v1')),
    expect: () => [
      const VehicleDetailState(isLoading: true),
      const VehicleDetailState(
        isLoading: false,
        errorMessage: 'Vehicle not found',
      ),
    ],
    verify: (_) => verify(() => router.pop()).called(1),
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'editToggled enters edit mode',
    build: build,
    seed: () => loaded,
    act: (bloc) => bloc.add(const VehicleDetailEvent.editToggled()),
    expect: () => [loaded.copyWith(isEditing: true)],
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'saved persists the vehicle and leaves edit mode',
    setUp: () =>
        when(() => saveVehicle(any())).thenAnswer((_) async => savedVehicle),
    build: build,
    seed: () => loaded.copyWith(isEditing: true),
    act: (bloc) => bloc.add(
      const VehicleDetailEvent.saved(
        name: 'New',
        description: '',
        mileage: '2000',
        userManualLink: '',
        maintenanceManualLink: '',
        documentsImage: 'docs',
      ),
    ),
    expect: () => [
      loaded.copyWith(isEditing: true, isSaving: true),
      loaded.copyWith(vehicle: savedVehicle, isEditing: false),
    ],
    verify: (_) {
      final saved = verify(() => saveVehicle(captureAny())).captured.single;
      expect(saved.documentsImage, 'docs');
    },
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'saved with invalid mileage reports a field error',
    build: build,
    seed: () => loaded.copyWith(isEditing: true),
    act: (bloc) => bloc.add(
      const VehicleDetailEvent.saved(
        name: 'New',
        description: '',
        mileage: 'abc',
        userManualLink: '',
        maintenanceManualLink: '',
      ),
    ),
    expect: () => [
      loaded.copyWith(
        isEditing: true,
        fieldErrors: const {'mileage': 'Enter a valid mileage'},
      ),
    ],
    verify: (_) => verifyNever(() => saveVehicle(any())),
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'attachmentsTapped pushes the attachments route',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => serviceItemRepository.getByVehicleId('v1'))
          .thenAnswer((_) async => []);
    },
    build: build,
    seed: () => loaded,
    act: (bloc) {
      bloc.add(const VehicleDetailEvent.started(vehicleId: 'v1'));
      bloc.add(const VehicleDetailEvent.attachmentsTapped());
    },
    verify: (_) => verify(
      () => router.push<Object?>(AppRoutes.vehicleAttachments('v1')),
    ).called(1),
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'documentsButtonTapped unlocks documents after biometrics succeed',
    setUp: () => when(
      () => authenticate(reason: any(named: 'reason')),
    ).thenAnswer((_) async => true),
    build: build,
    seed: () => loaded,
    act: (bloc) =>
        bloc.add(const VehicleDetailEvent.documentsButtonTapped()),
    expect: () => [
      loaded.copyWith(isAuthenticatingDocuments: true),
      loaded.copyWith(
        isAuthenticatingDocuments: false,
        documentsAccessNonce: 1,
      ),
    ],
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'documentsButtonTapped does not open sheet when biometrics fail',
    setUp: () => when(
      () => authenticate(reason: any(named: 'reason')),
    ).thenAnswer((_) async => false),
    build: build,
    seed: () => loaded,
    act: (bloc) =>
        bloc.add(const VehicleDetailEvent.documentsButtonTapped()),
    expect: () => [
      loaded.copyWith(isAuthenticatingDocuments: true),
      loaded.copyWith(isAuthenticatingDocuments: false),
    ],
  );

  blocTest<VehicleDetailBloc, VehicleDetailState>(
    'deleteConfirmed deletes the vehicle and pops',
    setUp: () => when(() => deleteVehicle(any())).thenAnswer((_) async {}),
    build: build,
    seed: () => loaded,
    act: (bloc) => bloc.add(const VehicleDetailEvent.deleteConfirmed()),
    expect: () => [loaded.copyWith(isDeleting: true)],
    verify: (_) {
      verify(() => deleteVehicle('v1')).called(1);
      verify(() => router.pop()).called(1);
    },
  );
}
