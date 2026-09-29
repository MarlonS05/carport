import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_bloc.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_event.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockVehicleRepository vehicleRepository;
  late MockVehicleAttachmentRepository attachmentRepository;
  late MockAttachVehicleFileUseCase attachFile;
  late MockDeleteVehicleAttachmentUseCase deleteAttachment;
  late MockAppRouter router;

  setUp(() {
    vehicleRepository = MockVehicleRepository();
    attachmentRepository = MockVehicleAttachmentRepository();
    attachFile = MockAttachVehicleFileUseCase();
    deleteAttachment = MockDeleteVehicleAttachmentUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
    when(() => router.pop()).thenReturn(null);
  });

  VehicleAttachmentsBloc build() => VehicleAttachmentsBloc(
        vehicleRepository: vehicleRepository,
        attachmentRepository: attachmentRepository,
        attachVehicleFileUseCase: attachFile,
        deleteVehicleAttachmentUseCase: deleteAttachment,
        router: router,
      );

  final vehicle = buildVehicle(id: 'v1', name: 'Civic');
  final attachment = VehicleAttachment(
    id: 'a1',
    vehicleId: 'v1',
    displayName: 'manual.pdf',
    filePath: '/stored/manual.pdf',
    createdAt: DateTime(2026, 1, 15, 10, 30),
    updatedAt: DateTime(2026, 1, 15, 10, 30),
  );

  blocTest<VehicleAttachmentsBloc, VehicleAttachmentsState>(
    'started loads vehicle and attachments',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => attachmentRepository.listByVehicleId('v1'))
          .thenAnswer((_) async => [attachment]);
    },
    build: build,
    act: (bloc) =>
        bloc.add(const VehicleAttachmentsEvent.started(vehicleId: 'v1')),
    expect: () => [
      const VehicleAttachmentsState(isLoading: true),
      VehicleAttachmentsState(
        vehicle: vehicle,
        attachments: [attachment],
        isLoading: false,
      ),
    ],
  );

  blocTest<VehicleAttachmentsBloc, VehicleAttachmentsState>(
    'filePicked attaches the file and reloads the list',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(
        () => attachFile(
          vehicleId: any(named: 'vehicleId'),
          sourcePath: any(named: 'sourcePath'),
          displayName: any(named: 'displayName'),
          mimeType: any(named: 'mimeType'),
        ),
      ).thenAnswer((_) async => attachment);
      when(() => attachmentRepository.listByVehicleId('v1'))
          .thenAnswer((_) async => [attachment]);
    },
    build: build,
    act: (bloc) async {
      bloc.add(const VehicleAttachmentsEvent.started(vehicleId: 'v1'));
      await Future<void>.delayed(Duration.zero);
      bloc.add(
        const VehicleAttachmentsEvent.filePicked(
          sourcePath: '/tmp/manual.pdf',
          displayName: 'manual.pdf',
        ),
      );
    },
    verify: (_) {
      verify(
        () => attachFile(
          vehicleId: 'v1',
          sourcePath: '/tmp/manual.pdf',
          displayName: 'manual.pdf',
          mimeType: null,
        ),
      ).called(1);
    },
  );

  blocTest<VehicleAttachmentsBloc, VehicleAttachmentsState>(
    'deleteTapped removes the attachment',
    setUp: () {
      when(() => vehicleRepository.getById('v1'))
          .thenAnswer((_) async => vehicle);
      when(() => deleteAttachment(any())).thenAnswer((_) async {});
      when(() => attachmentRepository.listByVehicleId('v1'))
          .thenAnswer((_) async => []);
    },
    build: build,
    act: (bloc) async {
      bloc.add(const VehicleAttachmentsEvent.started(vehicleId: 'v1'));
      await Future<void>.delayed(Duration.zero);
      bloc.add(
        const VehicleAttachmentsEvent.deleteTapped(attachmentId: 'a1'),
      );
    },
    verify: (_) => verify(() => deleteAttachment('a1')).called(1),
  );

  blocTest<VehicleAttachmentsBloc, VehicleAttachmentsState>(
    'backTapped pops the route',
    build: build,
    act: (bloc) => bloc.add(const VehicleAttachmentsEvent.backTapped()),
    verify: (_) => verify(() => router.pop()).called(1),
  );
}
