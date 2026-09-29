import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_to_portal_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  group('SyncVehicleAttachmentToPortalUseCase', () {
    late MockPortalConnectionRepository portalRepository;
    late MockPortalMonitorApi api;
    late SyncVehicleAttachmentToPortalUseCase useCase;

    const portalUrl = 'https://monitor.example.com';
    const mobileId = '550e8400-e29b-41d4-a716-446655440000';

    final attachment = VehicleAttachment(
      id: 'a1',
      vehicleId: 'v1',
      displayName: 'manual.pdf',
      filePath: '/stored/manual.pdf',
      createdAt: DateTime.utc(2026, 3, 1),
      updatedAt: DateTime.utc(2026, 3, 1),
    );

    setUp(() {
      portalRepository = MockPortalConnectionRepository();
      api = MockPortalMonitorApi();
      useCase = SyncVehicleAttachmentToPortalUseCase(
        portalConnectionRepository: portalRepository,
        portalMonitorApi: api,
        portalUrlValidator: const PortalUrlValidator(),
      );
    });

    test('no-ops when not connected', () async {
      when(() => portalRepository.getPortalBaseUrl()).thenAnswer((_) async => null);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => null);

      await useCase([attachment]);

      verifyNever(
        () => api.uploadAttachment(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicleId: any(named: 'vehicleId'),
          attachmentId: any(named: 'attachmentId'),
          filePath: any(named: 'filePath'),
          filename: any(named: 'filename'),
        ),
      );
    });

    test('uploads attachments when connected', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(
        () => api.uploadAttachment(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicleId: any(named: 'vehicleId'),
          attachmentId: any(named: 'attachmentId'),
          filePath: any(named: 'filePath'),
          filename: any(named: 'filename'),
        ),
      ).thenAnswer((_) async {});

      await useCase([attachment]);

      verify(
        () => api.uploadAttachment(
          apiBaseUrl: '$portalUrl/api',
          mobileId: mobileId,
          vehicleId: 'v1',
          attachmentId: 'a1',
          filePath: '/stored/manual.pdf',
          filename: 'manual.pdf',
        ),
      ).called(1);
    });

    test('continues when duplicate attachment already exists', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(
        () => api.uploadAttachment(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicleId: 'v1',
          attachmentId: 'a1',
          filePath: any(named: 'filePath'),
          filename: any(named: 'filename'),
        ),
      ).thenThrow(
        const PortalMonitorApiException(
          'An attachment with this id already exists.',
          statusCode: 422,
          errors: {
            'id': ['An attachment with this id already exists.'],
          },
        ),
      );
      when(
        () => api.uploadAttachment(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicleId: 'v1',
          attachmentId: 'a2',
          filePath: any(named: 'filePath'),
          filename: any(named: 'filename'),
        ),
      ).thenAnswer((_) async {});

      final secondAttachment = VehicleAttachment(
        id: 'a2',
        vehicleId: 'v1',
        displayName: 'receipt.pdf',
        filePath: '/stored/receipt.pdf',
        createdAt: DateTime.utc(2026, 3, 2),
        updatedAt: DateTime.utc(2026, 3, 2),
      );

      await useCase([attachment, secondAttachment]);

      verify(
        () => api.uploadAttachment(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicleId: 'v1',
          attachmentId: 'a2',
          filePath: any(named: 'filePath'),
          filename: any(named: 'filename'),
        ),
      ).called(1);
    });
  });
}
