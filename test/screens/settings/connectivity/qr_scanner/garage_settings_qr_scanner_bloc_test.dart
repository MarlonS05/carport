import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_bloc.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_event.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../support/mocks.dart';

void main() {
  late MockGetPortalBaseUrlUseCase getPortalBaseUrl;
  late MockGetMobileIdUseCase getMobileId;
  late MockConnectPortalUseCase connectPortal;
  late MockReregisterPortalUseCase reregisterPortal;
  late MockAppRouter router;

  const portalUrl = 'https://monitor.example.com';
  const invalidRaw = 'not-a-url';

  setUp(() {
    getPortalBaseUrl = MockGetPortalBaseUrlUseCase();
    getMobileId = MockGetMobileIdUseCase();
    connectPortal = MockConnectPortalUseCase();
    reregisterPortal = MockReregisterPortalUseCase();
    router = MockAppRouter();

    when(() => getPortalBaseUrl()).thenAnswer((_) async => null);
    when(() => getMobileId()).thenAnswer((_) async => null);
    when(
      () => connectPortal(
        any(),
        forceReregister: any(named: 'forceReregister'),
        onSyncStarting: any(named: 'onSyncStarting'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => reregisterPortal(
        onSyncStarting: any(named: 'onSyncStarting'),
      ),
    ).thenAnswer((_) async {});
  });

  GarageSettingsQrScannerBloc build() => GarageSettingsQrScannerBloc(
        getPortalBaseUrlUseCase: getPortalBaseUrl,
        getMobileIdUseCase: getMobileId,
        connectPortalUseCase: connectPortal,
        reregisterPortalUseCase: reregisterPortal,
        portalUrlValidator: const PortalUrlValidator(),
        router: router,
      );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'started loads connected state when portal URL and mobile ID exist',
    setUp: () {
      when(() => getPortalBaseUrl()).thenAnswer((_) async => portalUrl);
      when(() => getMobileId()).thenAnswer((_) async => 'mobile-id');
    },
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsQrScannerEvent.started()),
    expect: () => [
      const GarageSettingsQrScannerState(isLoading: true, errorMessage: null),
      const GarageSettingsQrScannerState(
        isLoading: false,
        portalBaseUrl: portalUrl,
        scanPhase: PortalScanPhase.connected,
      ),
    ],
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'codeDetected connects on valid portal URL',
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.codeDetected(portalUrl),
    ),
    expect: () => [
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: false,
        portalBaseUrl: portalUrl,
        scanPhase: PortalScanPhase.connected,
      ),
    ],
    verify: (_) {
      verify(
        () => connectPortal(
          portalUrl,
          forceReregister: false,
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).called(1);
    },
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'codeDetected ignores duplicate raw after validation failure',
    build: build,
    act: (bloc) async {
      bloc.add(const GarageSettingsQrScannerEvent.codeDetected(invalidRaw));
      await Future<void>.delayed(Duration.zero);
      bloc.add(const GarageSettingsQrScannerEvent.codeDetected(invalidRaw));
    },
    expect: () => [
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: false,
        scanPhase: PortalScanPhase.scanning,
        errorMessage: 'QR code must contain a valid portal URL.',
      ),
    ],
    verify: (_) {
      verifyNever(
        () => connectPortal(
          any(),
          forceReregister: any(named: 'forceReregister'),
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      );
    },
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'codeDetected ignores events while processing',
    build: build,
    act: (bloc) async {
      when(
        () => connectPortal(
          any(),
          forceReregister: any(named: 'forceReregister'),
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).thenAnswer((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });
      bloc.add(const GarageSettingsQrScannerEvent.codeDetected(portalUrl));
      bloc.add(const GarageSettingsQrScannerEvent.codeDetected(portalUrl));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: false,
        portalBaseUrl: portalUrl,
        scanPhase: PortalScanPhase.connected,
      ),
    ],
    verify: (_) {
      verify(
        () => connectPortal(
          portalUrl,
          forceReregister: false,
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).called(1);
    },
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'codeDetected allows rescan when connected',
    seed: () => const GarageSettingsQrScannerState(
      portalBaseUrl: portalUrl,
      scanPhase: PortalScanPhase.connected,
    ),
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.codeDetected(
        'https://other.example.com',
      ),
    ),
    expect: () => [
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: false,
        portalBaseUrl: 'https://other.example.com',
        scanPhase: PortalScanPhase.connected,
      ),
    ],
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'codeDetected returns to connected after register failure when replacing URL',
    seed: () => const GarageSettingsQrScannerState(
      portalBaseUrl: portalUrl,
      scanPhase: PortalScanPhase.connected,
    ),
    setUp: () {
      when(
        () => connectPortal(
          any(),
          forceReregister: any(named: 'forceReregister'),
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).thenThrow(
        const PortalMonitorApiException('Monitor unreachable'),
      );
    },
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.codeDetected(
        'https://other.example.com',
      ),
    ),
    expect: () => [
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: false,
        scanPhase: PortalScanPhase.connected,
        errorMessage:
            'Could not register with the monitor. Check the URL and try again.',
      ),
    ],
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'codeDetected emits syncing when onSyncStarting fires',
    build: build,
    act: (bloc) async {
      when(
        () => connectPortal(
          any(),
          forceReregister: any(named: 'forceReregister'),
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).thenAnswer((invocation) async {
        final onSyncStarting = invocation.namedArguments[
            #onSyncStarting] as void Function()?;
        onSyncStarting?.call();
      });
      bloc.add(const GarageSettingsQrScannerEvent.codeDetected(portalUrl));
    },
    expect: () => [
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: true,
        scanPhase: PortalScanPhase.syncing,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        isProcessing: false,
        portalBaseUrl: portalUrl,
        scanPhase: PortalScanPhase.connected,
      ),
    ],
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'reRegisterTapped succeeds when connected',
    seed: () => const GarageSettingsQrScannerState(
      portalBaseUrl: portalUrl,
      scanPhase: PortalScanPhase.connected,
    ),
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.reRegisterTapped(),
    ),
    expect: () => [
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: false,
        scanPhase: PortalScanPhase.connected,
      ),
    ],
    verify: (_) {
      verify(
        () => reregisterPortal(
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).called(1);
    },
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'reRegisterTapped emits syncing when onSyncStarting fires',
    seed: () => const GarageSettingsQrScannerState(
      portalBaseUrl: portalUrl,
      scanPhase: PortalScanPhase.connected,
    ),
    build: build,
    act: (bloc) async {
      when(
        () => reregisterPortal(
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).thenAnswer((invocation) async {
        final onSyncStarting = invocation.namedArguments[
            #onSyncStarting] as void Function()?;
        onSyncStarting?.call();
      });
      bloc.add(const GarageSettingsQrScannerEvent.reRegisterTapped());
    },
    expect: () => [
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.syncing,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: false,
        scanPhase: PortalScanPhase.connected,
      ),
    ],
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'reRegisterTapped is ignored when not connected',
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.reRegisterTapped(),
    ),
    expect: () => [],
    verify: (_) {
      verifyNever(
        () => reregisterPortal(
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      );
    },
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'reRegisterTapped is ignored while processing',
    seed: () => const GarageSettingsQrScannerState(
      portalBaseUrl: portalUrl,
      scanPhase: PortalScanPhase.connected,
      isProcessing: true,
    ),
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.reRegisterTapped(),
    ),
    expect: () => [],
    verify: (_) {
      verifyNever(
        () => reregisterPortal(
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      );
    },
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'reRegisterTapped shows error and stays connected on failure',
    seed: () => const GarageSettingsQrScannerState(
      portalBaseUrl: portalUrl,
      scanPhase: PortalScanPhase.connected,
    ),
    setUp: () {
      when(
        () => reregisterPortal(
          onSyncStarting: any(named: 'onSyncStarting'),
        ),
      ).thenThrow(const PortalMonitorApiException('Monitor unreachable'));
    },
    build: build,
    act: (bloc) => bloc.add(
      const GarageSettingsQrScannerEvent.reRegisterTapped(),
    ),
    expect: () => [
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
      const GarageSettingsQrScannerState(
        portalBaseUrl: portalUrl,
        isProcessing: false,
        scanPhase: PortalScanPhase.connected,
        errorMessage:
            'Could not register with the monitor. Check the URL and try again.',
      ),
    ],
  );

  blocTest<GarageSettingsQrScannerBloc, GarageSettingsQrScannerState>(
    'cameraDenied transitions once',
    build: build,
    act: (bloc) async {
      bloc.add(const GarageSettingsQrScannerEvent.cameraDenied());
      bloc.add(const GarageSettingsQrScannerEvent.cameraDenied());
    },
    expect: () => [
      const GarageSettingsQrScannerState(
        scanPhase: PortalScanPhase.cameraDenied,
        isProcessing: false,
      ),
    ],
  );
}
