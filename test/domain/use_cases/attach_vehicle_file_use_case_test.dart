import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/use_cases/attach_vehicle_file_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

import '../../support/mocks.dart';

class MockSyncVehicleAttachmentToPortalUseCase extends Mock
    implements SyncVehicleAttachmentToPortalUseCase {}

class MockVerifyPortalSyncUseCase extends Mock implements VerifyPortalSyncUseCase {}

void main() {
  setUpAll(registerCommonFallbacks);

  test('copies the file into storage and creates the attachment record', () async {
    final repository = MockVehicleAttachmentRepository();
    final storage = MockVehicleAttachmentStorage();
    final syncAttachment = MockSyncVehicleAttachmentToPortalUseCase();
    final verifyPortalSync = MockVerifyPortalSyncUseCase();
    when(
      () => storage.copyIntoStore(
        vehicleId: any(named: 'vehicleId'),
        attachmentId: any(named: 'attachmentId'),
        sourcePath: any(named: 'sourcePath'),
        displayName: any(named: 'displayName'),
      ),
    ).thenAnswer((_) async => '/stored/manual.pdf');
    when(() => repository.create(any())).thenAnswer((_) async => 'a1');
    when(() => syncAttachment(any())).thenAnswer((_) async {});
    when(() => verifyPortalSync()).thenAnswer((_) async {});

    final useCase = AttachVehicleFileUseCase(
      attachmentRepository: repository,
      attachmentStorage: storage,
      syncVehicleAttachmentToPortalUseCase: syncAttachment,
      verifyPortalSyncUseCase: verifyPortalSync,
      uuid: const Uuid(),
    );

    final result = await useCase(
      vehicleId: 'v1',
      sourcePath: '/tmp/manual.pdf',
      displayName: 'manual.pdf',
    );

    expect(result.vehicleId, 'v1');
    expect(result.displayName, 'manual.pdf');
    expect(result.filePath, '/stored/manual.pdf');
    verify(
      () => storage.copyIntoStore(
        vehicleId: 'v1',
        attachmentId: any(named: 'attachmentId'),
        sourcePath: '/tmp/manual.pdf',
        displayName: 'manual.pdf',
      ),
    ).called(1);
    verify(() => repository.create(any(that: isA<VehicleAttachment>()))).called(1);
    verify(() => syncAttachment(any(that: isA<List<VehicleAttachment>>()))).called(1);
    verify(() => verifyPortalSync()).called(1);
  });
}
