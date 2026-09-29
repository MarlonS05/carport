import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/connect_portal_use_case.dart';
import 'package:carport/domain/use_cases/get_mobile_id_use_case.dart';
import 'package:carport/domain/use_cases/get_portal_base_url_use_case.dart';
import 'package:carport/domain/use_cases/reregister_portal_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_event.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsQrScannerBloc
    extends Bloc<GarageSettingsQrScannerEvent, GarageSettingsQrScannerState> {
  GarageSettingsQrScannerBloc({
    required GetPortalBaseUrlUseCase getPortalBaseUrlUseCase,
    required GetMobileIdUseCase getMobileIdUseCase,
    required ConnectPortalUseCase connectPortalUseCase,
    required ReregisterPortalUseCase reregisterPortalUseCase,
    required PortalUrlValidator portalUrlValidator,
    required AppRouter router,
  })  : _getPortalBaseUrlUseCase = getPortalBaseUrlUseCase,
        _getMobileIdUseCase = getMobileIdUseCase,
        _connectPortalUseCase = connectPortalUseCase,
        _reregisterPortalUseCase = reregisterPortalUseCase,
        _portalUrlValidator = portalUrlValidator,
        _router = router,
        super(const GarageSettingsQrScannerState()) {
    on<GarageSettingsQrScannerEvent>(_onEvent);
  }

  final GetPortalBaseUrlUseCase _getPortalBaseUrlUseCase;
  final GetMobileIdUseCase _getMobileIdUseCase;
  final ConnectPortalUseCase _connectPortalUseCase;
  final ReregisterPortalUseCase _reregisterPortalUseCase;
  final PortalUrlValidator _portalUrlValidator;
  final AppRouter _router;

  String? _lastRejectedRaw;

  Future<void> _onEvent(
    GarageSettingsQrScannerEvent event,
    Emitter<GarageSettingsQrScannerState> emit,
  ) async {
    await event.map(
      started: (_) => _load(emit),
      codeDetected: (event) => _handleCode(event.raw, emit),
      cameraDenied: (_) async {
        if (state.scanPhase == PortalScanPhase.cameraDenied) {
          return;
        }
        emit(
          state.copyWith(
            scanPhase: PortalScanPhase.cameraDenied,
            isProcessing: false,
          ),
        );
      },
      backTapped: (_) async {
        if (!state.isProcessing) {
          _router.pop();
        }
      },
      reRegisterTapped: (_) => _handleReRegister(emit),
    );
  }

  Future<void> _load(Emitter<GarageSettingsQrScannerState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final baseUrl = await _getPortalBaseUrlUseCase();
      final mobileId = await _getMobileIdUseCase();
      final isConnected = baseUrl != null && mobileId != null;
      emit(
        state.copyWith(
          isLoading: false,
          portalBaseUrl: baseUrl,
          scanPhase: isConnected
              ? PortalScanPhase.connected
              : PortalScanPhase.scanning,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load portal connection', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load portal connection: $e',
        ),
      );
    }
  }

  Future<void> _handleCode(
    String raw,
    Emitter<GarageSettingsQrScannerState> emit,
  ) async {
    if (state.isProcessing ||
        state.scanPhase == PortalScanPhase.cameraDenied) {
      return;
    }

    if (raw == _lastRejectedRaw) {
      return;
    }

    final wasConnected = state.scanPhase == PortalScanPhase.connected;

    emit(
      state.copyWith(
        isProcessing: true,
        scanPhase: PortalScanPhase.validating,
        errorMessage: null,
      ),
    );

    final normalized = _portalUrlValidator.normalize(raw);
    if (normalized == null) {
      _lastRejectedRaw = raw;
      emit(
        state.copyWith(
          isProcessing: false,
          scanPhase: PortalScanPhase.scanning,
          errorMessage: 'QR code must contain a valid portal URL.',
        ),
      );
      return;
    }

    _lastRejectedRaw = null;

    emit(
      state.copyWith(
        scanPhase: PortalScanPhase.registering,
      ),
    );

    try {
      await _connectPortalUseCase(
        normalized,
        onSyncStarting: () => emit(
          state.copyWith(scanPhase: PortalScanPhase.syncing),
        ),
      );
      emit(
        state.copyWith(
          isProcessing: false,
          portalBaseUrl: normalized,
          scanPhase: PortalScanPhase.connected,
        ),
      );
    } on PortalMonitorApiException catch (_) {
      emit(
        state.copyWith(
          isProcessing: false,
          scanPhase: wasConnected
              ? PortalScanPhase.connected
              : PortalScanPhase.scanning,
          errorMessage:
              'Could not register with the monitor. Check the URL and try again.',
        ),
      );
    } catch (e, st) {
      logger.e('Failed to connect portal', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isProcessing: false,
          scanPhase: wasConnected
              ? PortalScanPhase.connected
              : PortalScanPhase.scanning,
          errorMessage: 'Could not connect to portal: $e',
        ),
      );
    }
  }

  Future<void> _handleReRegister(
    Emitter<GarageSettingsQrScannerState> emit,
  ) async {
    if (state.isProcessing ||
        state.scanPhase != PortalScanPhase.connected ||
        state.portalBaseUrl == null) {
      return;
    }

    emit(
      state.copyWith(
        isProcessing: true,
        scanPhase: PortalScanPhase.registering,
        errorMessage: null,
      ),
    );

    try {
      await _reregisterPortalUseCase(
        onSyncStarting: () => emit(
          state.copyWith(scanPhase: PortalScanPhase.syncing),
        ),
      );
      emit(
        state.copyWith(
          isProcessing: false,
          scanPhase: PortalScanPhase.connected,
        ),
      );
    } on PortalMonitorApiException catch (_) {
      emit(
        state.copyWith(
          isProcessing: false,
          scanPhase: PortalScanPhase.connected,
          errorMessage:
              'Could not register with the monitor. Check the URL and try again.',
        ),
      );
    } catch (e, st) {
      logger.e('Failed to re-register portal', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isProcessing: false,
          scanPhase: PortalScanPhase.connected,
          errorMessage: 'Could not connect to portal: $e',
        ),
      );
    }
  }
}
