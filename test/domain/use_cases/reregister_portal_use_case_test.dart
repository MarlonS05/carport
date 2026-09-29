import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/use_cases/connect_portal_use_case.dart';
import 'package:carport/domain/use_cases/reregister_portal_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPortalConnectionRepository extends Mock
    implements PortalConnectionRepository {}

class MockConnectPortalUseCase extends Mock implements ConnectPortalUseCase {}

void main() {
  late MockPortalConnectionRepository repository;
  late MockConnectPortalUseCase connectPortal;
  late ReregisterPortalUseCase useCase;

  const url = 'https://monitor.example.com';

  setUp(() {
    repository = MockPortalConnectionRepository();
    connectPortal = MockConnectPortalUseCase();
    useCase = ReregisterPortalUseCase(
      portalConnectionRepository: repository,
      connectPortalUseCase: connectPortal,
    );
    when(
      () => connectPortal(
        any(),
        forceReregister: any(named: 'forceReregister'),
        onSyncStarting: any(named: 'onSyncStarting'),
      ),
    ).thenAnswer((_) async {});
  });

  test('delegates to ConnectPortalUseCase with forceReregister', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => url);

    await useCase();

    verify(
      () => connectPortal(
        url,
        forceReregister: true,
        onSyncStarting: null,
      ),
    ).called(1);
  });

  test('forwards onSyncStarting callback', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => url);

    void onSyncStarting() {}

    await useCase(onSyncStarting: onSyncStarting);

    verify(
      () => connectPortal(
        url,
        forceReregister: true,
        onSyncStarting: onSyncStarting,
      ),
    ).called(1);
  });

  test('no-ops when portal URL is null', () async {
    when(() => repository.getPortalBaseUrl()).thenAnswer((_) async => null);

    await useCase();

    verifyNever(
      () => connectPortal(
        any(),
        forceReregister: any(named: 'forceReregister'),
        onSyncStarting: any(named: 'onSyncStarting'),
      ),
    );
  });
}
