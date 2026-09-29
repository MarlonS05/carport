import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/set_distance_unit_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/units/garage_settings_units_event.dart';
import 'package:carport/screens/settings/units/garage_settings_units_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsUnitsBloc
    extends Bloc<GarageSettingsUnitsEvent, GarageSettingsUnitsState> {
  GarageSettingsUnitsBloc({
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required SetDistanceUnitUseCase setDistanceUnitUseCase,
    required AppRouter router,
  })  : _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _setDistanceUnitUseCase = setDistanceUnitUseCase,
        _router = router,
        super(const GarageSettingsUnitsState()) {
    on<GarageSettingsUnitsEvent>(_onEvent);
  }

  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final SetDistanceUnitUseCase _setDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageSettingsUnitsEvent event,
    Emitter<GarageSettingsUnitsState> emit,
  ) async {
    await event.map(
      started: (_) => _load(emit),
      unitSelected: (event) => _selectUnit(emit, event.unit),
      backTapped: (_) async {
        if (!state.isSaving) _router.pop();
      },
    );
  }

  Future<void> _load(Emitter<GarageSettingsUnitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final unit = await _getDistanceUnitUseCase();
      emit(state.copyWith(isLoading: false, selectedUnit: unit));
    } catch (e, st) {
      logger.e('Failed to load distance unit', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load distance unit: $e',
        ),
      );
    }
  }

  Future<void> _selectUnit(
    Emitter<GarageSettingsUnitsState> emit,
    unit,
  ) async {
    if (state.isSaving || state.selectedUnit == unit) return;

    emit(state.copyWith(isSaving: true, errorMessage: null));
    try {
      await _setDistanceUnitUseCase(unit);
      _router.pop();
    } catch (e, st) {
      logger.e('Failed to save distance unit', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: 'Could not save distance unit: $e',
        ),
      );
    }
  }
}
