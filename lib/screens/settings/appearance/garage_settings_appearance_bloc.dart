import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/use_cases/get_color_theme_preset_use_case.dart';
import 'package:carport/domain/use_cases/set_color_theme_preset_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_event.dart';
import 'package:carport/screens/settings/appearance/garage_settings_appearance_state.dart';
import 'package:carport/theme/app_themes/app_theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsAppearanceBloc extends Bloc<GarageSettingsAppearanceEvent,
    GarageSettingsAppearanceState> {
  GarageSettingsAppearanceBloc({
    required GetColorThemePresetUseCase getColorThemePresetUseCase,
    required SetColorThemePresetUseCase setColorThemePresetUseCase,
    required AppThemeCubit appThemeCubit,
    required AppRouter router,
  })  : _getColorThemePresetUseCase = getColorThemePresetUseCase,
        _setColorThemePresetUseCase = setColorThemePresetUseCase,
        _appThemeCubit = appThemeCubit,
        _router = router,
        super(const GarageSettingsAppearanceState()) {
    on<GarageSettingsAppearanceEvent>(_onEvent);
  }

  final GetColorThemePresetUseCase _getColorThemePresetUseCase;
  final SetColorThemePresetUseCase _setColorThemePresetUseCase;
  final AppThemeCubit _appThemeCubit;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageSettingsAppearanceEvent event,
    Emitter<GarageSettingsAppearanceState> emit,
  ) async {
    await event.map(
      started: (_) => _load(emit),
      presetSelected: (event) async => _selectPreset(emit, event.preset),
      saveTapped: (_) => _save(emit),
      backTapped: (_) async {
        if (!state.isSaving) _router.pop();
      },
    );
  }

  Future<void> _load(Emitter<GarageSettingsAppearanceState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final preset = await _getColorThemePresetUseCase();
      emit(
        state.copyWith(
          isLoading: false,
          savedPreset: preset,
          selectedPreset: preset,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load color theme preset', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load appearance settings: $e',
        ),
      );
    }
  }

  void _selectPreset(
    Emitter<GarageSettingsAppearanceState> emit,
    ColorThemePreset preset,
  ) {
    if (state.isSaving) return;
    emit(state.copyWith(selectedPreset: preset, errorMessage: null));
  }

  Future<void> _save(Emitter<GarageSettingsAppearanceState> emit) async {
    if (state.isSaving || !state.hasChanges) return;

    emit(state.copyWith(isSaving: true, errorMessage: null));
    try {
      await _setColorThemePresetUseCase(state.selectedPreset);
      _appThemeCubit.setPreset(state.selectedPreset);
      _router.pop();
    } catch (e, st) {
      logger.e('Failed to save color theme preset', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: 'Could not save appearance settings: $e',
        ),
      );
    }
  }
}
