import 'package:carport/domain/entities/portal_attachment_ids_sync_result.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  group('SyncVehicleAttachmentIdsToPortalUseCase', () {
    late MockPortalConnectionRepository portalRepository;
    late MockPortalMonitorApi api;
    late MockVehicleAttachmentRepository attachmentRepository;
    late SyncVehicleAttachmentIdsToPortalUseCase useCase;

    const portalUrl = 'https://monitor.example.com';
    const mobileId = '550e8400-e29b-41d4-a716-446655440000';

    setUp(() {
      portalRepository = MockPortalConnectionRepository();
      api = MockPortalMonitorApi();
      attachmentRepository = MockVehicleAttachmentRepository();
      useCase = SyncVehicleAttachmentIdsToPortalUseCase(
        portalConnectionRepository: portalRepository,
        portalMonitorApi: api,
        portalUrlValidator: const PortalUrlValidator(),
        attachmentRepository: attachmentRepository,
      );
    });

    test('no-ops when not connected', () async {
      when(() => portalRepository.getPortalBaseUrl()).thenAnswer((_) async => null);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => null);
      when(() => attachmentRepository.listAllIds())
          .thenAnswer((_) async => ['a1']);

      await useCase();

      verifyNever(
        () => api.syncAttachmentIds(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          attachmentIds: any(named: 'attachmentIds'),
        ),
      );
    });

    test('posts collected attachment IDs when connected', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => attachmentRepository.listAllIds())
          .thenAnswer((_) async => ['a1', 'a2']);
      when(
        () => api.syncAttachmentIds(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          attachmentIds: any(named: 'attachmentIds'),
        ),
      ).thenAnswer(
        (_) async => const PortalAttachmentIdsSyncResult(
          deleted: 0,
          attachmentIds: [],
        ),
      );

      await useCase();

      verify(
        () => api.syncAttachmentIds(
          apiBaseUrl: '$portalUrl/api',
          mobileId: mobileId,
          attachmentIds: ['a1', 'a2'],
        ),
      ).called(1);
    });

    test('sends empty list when no attachments exist', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => attachmentRepository.listAllIds()).thenAnswer((_) async => []);
      when(
        () => api.syncAttachmentIds(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          attachmentIds: any(named: 'attachmentIds'),
        ),
      ).thenAnswer(
        (_) async => const PortalAttachmentIdsSyncResult(
          deleted: 0,
          attachmentIds: [],
        ),
      );

      await useCase();

      verify(
        () => api.syncAttachmentIds(
          apiBaseUrl: '$portalUrl/api',
          mobileId: mobileId,
          attachmentIds: [],
        ),
      ).called(1);
    });

    test('logs API errors without throwing', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => attachmentRepository.listAllIds())
          .thenAnswer((_) async => ['a1']);
      when(
        () => api.syncAttachmentIds(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          attachmentIds: any(named: 'attachmentIds'),
        ),
      ).thenThrow(
        const PortalMonitorApiException('Validation failed', statusCode: 422),
      );

      await expectLater(useCase(), completes);
    });
  });
}
