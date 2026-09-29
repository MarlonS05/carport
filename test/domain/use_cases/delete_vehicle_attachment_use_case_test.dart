import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/use_cases/delete_vehicle_attachment_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

class MockSyncVehicleAttachmentIdsToPortalUseCase extends Mock
    implements SyncVehicleAttachmentIdsToPortalUseCase {}

void main() {
  setUpAll(registerCommonFallbacks);

  test('deletes the stored file before removing the database row', () async {
    final repository = MockVehicleAttachmentRepository();
    final storage = MockVehicleAttachmentStorage();
    final syncIds = MockSyncVehicleAttachmentIdsToPortalUseCase();
    final attachment = VehicleAttachment(
      id: 'a1',
      vehicleId: 'v1',
      displayName: 'manual.pdf',
      filePath: '/stored/manual.pdf',
      createdAt: DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(0),
    );
    when(() => repository.getById('a1')).thenAnswer((_) async => attachment);
    when(() => storage.deleteFile(any())).thenAnswer((_) async {});
    when(() => repository.delete(any())).thenAnswer((_) async {});
    when(() => syncIds()).thenAnswer((_) async {});

    final useCase = DeleteVehicleAttachmentUseCase(
      attachmentRepository: repository,
      attachmentStorage: storage,
      syncVehicleAttachmentIdsToPortalUseCase: syncIds,
    );

    await useCase('a1');

    verifyInOrder([
      () => storage.deleteFile('/stored/manual.pdf'),
      () => repository.delete('a1'),
      () => syncIds(),
    ]);
  });

  test('skips portal sync when syncAttachmentIdsToPortal is false', () async {
    final repository = MockVehicleAttachmentRepository();
    final storage = MockVehicleAttachmentStorage();
    final syncIds = MockSyncVehicleAttachmentIdsToPortalUseCase();
    final attachment = VehicleAttachment(
      id: 'a1',
      vehicleId: 'v1',
      displayName: 'manual.pdf',
      filePath: '/stored/manual.pdf',
      createdAt: DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(0),
    );
    when(() => repository.getById('a1')).thenAnswer((_) async => attachment);
    when(() => storage.deleteFile(any())).thenAnswer((_) async {});
    when(() => repository.delete(any())).thenAnswer((_) async {});

    final useCase = DeleteVehicleAttachmentUseCase(
      attachmentRepository: repository,
      attachmentStorage: storage,
      syncVehicleAttachmentIdsToPortalUseCase: syncIds,
    );

    await useCase('a1', syncAttachmentIdsToPortal: false);

    verifyNever(() => syncIds());
  });
}
