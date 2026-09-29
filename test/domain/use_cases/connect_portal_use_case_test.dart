import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/connect_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_all_garage_data_to_portal_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPortalConnectionRepository extends Mock
    implements PortalConnectionRepository {}

class MockPortalMonitorApi extends Mock implements PortalMonitorApi {}

class MockSyncAllGarageDataToPortalUseCase extends Mock
    implements SyncAllGarageDataToPortalUseCase {}

void main() {
  late MockPortalConnectionRepository repository;
  late MockPortalMonitorApi api;
  late MockSyncAllGarageDataToPortalUseCase syncAll;
  late ConnectPortalUseCase useCase;

  const url = 'https://monitor.example.com';
  const mobileId = '550e8400-e29b-41d4-a716-446655440000';

  setUp(() {
    repository = MockPortalConnectionRepository();
    api = MockPortalMonitorApi();
    syncAll = MockSyncAllGarageDataToPortalUseCase();
    useCase = ConnectPortalUseCase(
      portalConnectionRepository: repository,
      portalMonitorApi: api,
      portalUrlValidator: const PortalUrlValidator(),
      syncAllGarageDataToPortalUseCase: syncAll,
    );
    when(() => syncAll()).thenAnswer((_) async {});
  });

  test('registers on first connect', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => null);
    when(() => repository.getMobileId()).thenAnswer((_) async => null);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenAnswer((_) async => mobileId);
    when(() => repository.setMobileId(any())).thenAnswer((_) async {});

    await useCase(url);

    verify(() => repository.setPortalBaseUrl(url)).called(1);
    verify(
      () => api.register(apiBaseUrl: 'https://monitor.example.com/api'),
    ).called(1);
    verify(() => repository.setMobileId(mobileId)).called(1);
    verify(() => syncAll()).called(1);
  });

  test('skips register when same URL and mobile ID exist', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => url);
    when(() => repository.getMobileId()).thenAnswer((_) async => mobileId);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});

    await useCase(url);

    verify(() => repository.setPortalBaseUrl(url)).called(1);
    verifyNever(() => api.register(apiBaseUrl: any(named: 'apiBaseUrl')));
    verifyNever(() => repository.setMobileId(any()));
    verifyNever(() => syncAll());
  });

  test('re-registers when portal URL changes', () async {
    const newUrl = 'https://other.example.com';
    const newMobileId = '660e8400-e29b-41d4-a716-446655440001';

    when(() => repository.getPortalBaseUrl())
        .thenAnswer((_) async => url);
    when(() => repository.getMobileId()).thenAnswer((_) async => mobileId);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenAnswer((_) async => newMobileId);
    when(() => repository.setMobileId(any())).thenAnswer((_) async {});

    await useCase(newUrl);

    verify(() => repository.setPortalBaseUrl(newUrl)).called(1);
    verify(
      () => api.register(apiBaseUrl: 'https://other.example.com/api'),
    ).called(1);
    verify(() => repository.setMobileId(newMobileId)).called(1);
    verify(() => syncAll()).called(1);
  });

  test('re-registers when URL is saved but mobile ID is missing', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => url);
    when(() => repository.getMobileId()).thenAnswer((_) async => null);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenAnswer((_) async => mobileId);
    when(() => repository.setMobileId(any())).thenAnswer((_) async {});

    await useCase(url);

    verify(
      () => api.register(apiBaseUrl: 'https://monitor.example.com/api'),
    ).called(1);
    verify(() => repository.setMobileId(mobileId)).called(1);
    verify(() => syncAll()).called(1);
  });

  test('propagates API errors without saving portal URL or mobile ID', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => null);
    when(() => repository.getMobileId()).thenAnswer((_) async => null);
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenThrow(const PortalMonitorApiException('Monitor unreachable'));

    await expectLater(useCase(url), throwsA(isA<PortalMonitorApiException>()));

    verifyNever(() => repository.setPortalBaseUrl(any()));
    verifyNever(() => repository.setMobileId(any()));
    verifyNever(() => syncAll());
  });

  test('does not update URL when register fails after URL change', () async {
    const newUrl = 'https://other.example.com';

    when(() => repository.getPortalBaseUrl())
        .thenAnswer((_) async => url);
    when(() => repository.getMobileId()).thenAnswer((_) async => mobileId);
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenThrow(const PortalMonitorApiException('Monitor unreachable'));

    await expectLater(
      useCase(newUrl),
      throwsA(isA<PortalMonitorApiException>()),
    );

    verifyNever(() => repository.setPortalBaseUrl(any()));
    verifyNever(() => repository.setMobileId(any()));
    verifyNever(() => syncAll());
  });

  test('still completes registration when bulk sync fails', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => null);
    when(() => repository.getMobileId()).thenAnswer((_) async => null);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenAnswer((_) async => mobileId);
    when(() => repository.setMobileId(any())).thenAnswer((_) async {});
    when(() => syncAll()).thenThrow(Exception('sync failed'));

    await useCase(url);

    verify(() => repository.setMobileId(mobileId)).called(1);
  });

  test('re-registers when forceReregister is true with same URL and mobile ID',
      () async {
    const newMobileId = '660e8400-e29b-41d4-a716-446655440001';

    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => url);
    when(() => repository.getMobileId()).thenAnswer((_) async => mobileId);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenAnswer((_) async => newMobileId);
    when(() => repository.setMobileId(any())).thenAnswer((_) async {});

    await useCase(url, forceReregister: true);

    verify(
      () => api.register(apiBaseUrl: 'https://monitor.example.com/api'),
    ).called(1);
    verify(() => repository.setMobileId(newMobileId)).called(1);
    verify(() => syncAll()).called(1);
  });

  test('calls onSyncStarting before bulk sync', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => null);
    when(() => repository.getMobileId()).thenAnswer((_) async => null);
    when(() => repository.setPortalBaseUrl(any())).thenAnswer((_) async {});
    when(
      () => api.register(apiBaseUrl: any(named: 'apiBaseUrl')),
    ).thenAnswer((_) async => mobileId);
    when(() => repository.setMobileId(any())).thenAnswer((_) async {});

    var syncStartingCalled = false;
    when(() => syncAll()).thenAnswer((_) async {
      expect(syncStartingCalled, isTrue);
    });

    await useCase(
      url,
      onSyncStarting: () => syncStartingCalled = true,
    );

    expect(syncStartingCalled, isTrue);
    verify(() => syncAll()).called(1);
  });
}
