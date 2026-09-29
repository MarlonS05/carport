import 'package:carport/domain/use_cases/get_color_theme_preset_use_case.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/get_portal_base_url_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/garage_settings_event.dart';
import 'package:carport/screens/settings/garage_settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsBloc extends Bloc<GarageSettingsEvent, GarageSettingsState> {
  GarageSettingsBloc({
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required GetColorThemePresetUseCase getColorThemePresetUseCase,
    required GetPortalBaseUrlUseCase getPortalBaseUrlUseCase,
    required AppRouter router,
  })  : _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _getColorThemePresetUseCase = getColorThemePresetUseCase,
        _getPortalBaseUrlUseCase = getPortalBaseUrlUseCase,
        _router = router,
        super(const GarageSettingsState()) {
    on<GarageSettingsEvent>(_onEvent);
  }

  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final GetColorThemePresetUseCase _getColorThemePresetUseCase;
  final GetPortalBaseUrlUseCase _getPortalBaseUrlUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageSettingsEvent event,
    Emitter<GarageSettingsState> emit,
  ) async {
    await event.map(
      started: (_) => _load(emit),
      unitsTapped: (_) async {
        await _router.push(AppRoutes.settingsUnits);
        await _load(emit);
      },
      permissionsTapped: (_) async => _router.push(AppRoutes.settingsPermissions),
      connectivityTapped: (_) async {
        await _router.push(AppRoutes.settingsConnectivity);
        await _load(emit);
      },
      appearanceTapped: (_) async {
        await _router.push(AppRoutes.settingsAppearance);
        await _load(emit);
      },
      backTapped: (_) async => _router.pop(),
    );
  }

  Future<void> _load(Emitter<GarageSettingsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final unit = await _getDistanceUnitUseCase();
      final colorThemePreset = await _getColorThemePresetUseCase();
      final portalBaseUrl = await _getPortalBaseUrlUseCase();
      emit(
        state.copyWith(
          isLoading: false,
          distanceUnit: unit,
          colorThemePreset: colorThemePreset,
          portalBaseUrl: portalBaseUrl,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load settings', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load settings: $e',
        ),
      );
    }
  }
}
