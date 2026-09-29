import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/use_cases/get_color_theme_preset_use_case.dart';
import 'package:carport/theme/app_themes/app_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<ColorThemePreset> {
  AppThemeCubit({
    required GetColorThemePresetUseCase getColorThemePresetUseCase,
  })  : _getColorThemePresetUseCase = getColorThemePresetUseCase,
        super(AppThemes.defaultPreset);

  final GetColorThemePresetUseCase _getColorThemePresetUseCase;

  Future<void> load() async {
    final preset = await _getColorThemePresetUseCase();
    emit(preset);
  }

  void setPreset(ColorThemePreset preset) => emit(preset);
}
