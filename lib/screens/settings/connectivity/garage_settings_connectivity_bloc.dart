import 'package:carport/domain/use_cases/get_portal_base_url_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_event.dart';
import 'package:carport/screens/settings/connectivity/garage_settings_connectivity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsConnectivityBloc extends Bloc<GarageSettingsConnectivityEvent,
    GarageSettingsConnectivityState> {
  GarageSettingsConnectivityBloc({
    required GetPortalBaseUrlUseCase getPortalBaseUrlUseCase,
    required AppRouter router,
  })  : _getPortalBaseUrlUseCase = getPortalBaseUrlUseCase,
        _router = router,
        super(const GarageSettingsConnectivityState()) {
    on<GarageSettingsConnectivityEvent>(_onEvent);
  }

  final GetPortalBaseUrlUseCase _getPortalBaseUrlUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageSettingsConnectivityEvent event,
    Emitter<GarageSettingsConnectivityState> emit,
  ) async {
    await event.map(
      started: (_) => _load(emit),
      qrScannerTapped: (_) async {
        await _router.push(AppRoutes.settingsConnectivityQrScanner);
        await _load(emit);
      },
      webAccessTapped: (_) async {
        await _router.push(AppRoutes.settingsConnectivityWebAccess);
        await _load(emit);
      },
      backTapped: (_) async => _router.pop(),
    );
  }

  Future<void> _load(Emitter<GarageSettingsConnectivityState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final baseUrl = await _getPortalBaseUrlUseCase();
      emit(state.copyWith(isLoading: false, portalBaseUrl: baseUrl));
    } catch (e, st) {
      logger.e('Failed to load connectivity settings', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load connectivity settings: $e',
        ),
      );
    }
  }
}
