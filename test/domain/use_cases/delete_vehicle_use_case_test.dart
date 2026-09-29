import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/use_cases/delete_vehicle_attachment_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

class MockDeleteVehicleAttachmentUseCase extends Mock
    implements DeleteVehicleAttachmentUseCase {}

class MockSyncVehicleAttachmentIdsToPortalUseCase extends Mock
    implements SyncVehicleAttachmentIdsToPortalUseCase {}

void main() {
  setUpAll(registerCommonFallbacks);

  test(
    'deletes each attachment, syncs IDs once, then removes the vehicle',
    () async {
      final repository = MockVehicleRepository();
      final attachmentRepository = MockVehicleAttachmentRepository();
      final deleteAttachment = MockDeleteVehicleAttachmentUseCase();
      final syncIds = MockSyncVehicleAttachmentIdsToPortalUseCase();
      final attachments = [
        VehicleAttachment(
          id: 'a1',
          vehicleId: 'v1',
          displayName: 'manual.pdf',
          filePath: '/stored/manual.pdf',
          createdAt: DateTime.fromMillisecondsSinceEpoch(0),
          updatedAt: DateTime.fromMillisecondsSinceEpoch(0),
        ),
        VehicleAttachment(
          id: 'a2',
          vehicleId: 'v1',
          displayName: 'receipt.pdf',
          filePath: '/stored/receipt.pdf',
          createdAt: DateTime.fromMillisecondsSinceEpoch(0),
          updatedAt: DateTime.fromMillisecondsSinceEpoch(0),
        ),
      ];
      when(() => attachmentRepository.listByVehicleId('v1'))
          .thenAnswer((_) async => attachments);
      when(
        () => deleteAttachment(
          any(),
          syncAttachmentIdsToPortal: any(named: 'syncAttachmentIdsToPortal'),
        ),
      ).thenAnswer((_) async {});
      when(() => syncIds()).thenAnswer((_) async {});
      when(() => repository.delete(any())).thenAnswer((_) async {});

      final useCase = DeleteVehicleUseCase(
        vehicleRepository: repository,
        attachmentRepository: attachmentRepository,
        deleteVehicleAttachmentUseCase: deleteAttachment,
        syncVehicleAttachmentIdsToPortalUseCase: syncIds,
      );

      await useCase('v1');

      verify(
        () => deleteAttachment('a1', syncAttachmentIdsToPortal: false),
      ).called(1);
      verify(
        () => deleteAttachment('a2', syncAttachmentIdsToPortal: false),
      ).called(1);
      verifyInOrder([
        () => syncIds(),
        () => repository.delete('v1'),
      ]);
    },
  );
}
