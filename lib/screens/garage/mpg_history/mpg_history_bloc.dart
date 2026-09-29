import 'package:carport/domain/formatters/fuel_economy_calculator.dart';
import 'package:carport/domain/repositories/mpg_entry_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_event.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MpgHistoryBloc extends Bloc<MpgHistoryEvent, MpgHistoryState> {
  MpgHistoryBloc({
    required VehicleRepository vehicleRepository,
    required MpgEntryRepository mpgEntryRepository,
    required AppRouter router,
  }) : _vehicleRepository = vehicleRepository,
       _mpgEntryRepository = mpgEntryRepository,
       _router = router,
       super(const MpgHistoryState()) {
    on<MpgHistoryEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final MpgEntryRepository _mpgEntryRepository;
  final AppRouter _router;

  Future<void> _onEvent(
    MpgHistoryEvent event,
    Emitter<MpgHistoryState> emit,
  ) async {
    await event.map(
      started: (event) => _load(emit, event.vehicleId),
      backTapped: (_) async {
        if (state.isLoading) return;
        _router.pop();
      },
      unitChanged: (event) async {
        if (event.unit == state.unit) return;
        emit(
          state.copyWith(
            unit: event.unit,
            monthlyPeriods: FuelEconomyCalculator.byMonth(
              state.entries,
              unit: event.unit,
            ),
            yearlyPeriods: FuelEconomyCalculator.byYear(
              state.entries,
              unit: event.unit,
            ),
          ),
        );
      },
    );
  }

  Future<void> _load(Emitter<MpgHistoryState> emit, String vehicleId) async {
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing vehicleId in route (/garage/vehicles/:vehicleId/mpg)',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final vehicle = await _vehicleRepository.getById(vehicleId);
      if (vehicle == null) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Vehicle not found: $vehicleId',
          ),
        );
        return;
      }

      final entries = await _mpgEntryRepository.getByVehicleId(vehicleId);
      final unit = state.unit;
      emit(
        state.copyWith(
          isLoading: false,
          vehicle: vehicle,
          entries: entries,
          monthlyPeriods: FuelEconomyCalculator.byMonth(entries, unit: unit),
          yearlyPeriods: FuelEconomyCalculator.byYear(entries, unit: unit),
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.e(
        'Failed to load MPG history',
        error: error,
        stackTrace: stackTrace,
      );
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load MPG history',
        ),
      );
    }
  }
}
