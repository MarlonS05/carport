import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_event.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickEntrySelectBloc
    extends Bloc<QuickEntrySelectEvent, QuickEntrySelectState> {
  QuickEntrySelectBloc({
    required VehicleRepository vehicleRepository,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _router = router,
        super(const QuickEntrySelectState()) {
    on<QuickEntrySelectEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    QuickEntrySelectEvent event,
    Emitter<QuickEntrySelectState> emit,
  ) async {
    await event.map(
      started: (_) => _loadVehicles(emit),
      backTapped: (_) async => _router.pop(),
      vehicleTapped: (event) async {
        await _router.push('/garage/quick-entry/${event.vehicleId}/form');
      },
    );
  }

  Future<void> _loadVehicles(Emitter<QuickEntrySelectState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final results = await Future.wait([
        _vehicleRepository.getAll(),
        _getDistanceUnitUseCase(),
      ]);
      emit(
        state.copyWith(
          vehicles: List<Vehicle>.from(results[0] as List),
          distanceUnit: results[1] as DistanceUnit,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load vehicles for quick entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load vehicles: $e',
        ),
      );
    }
  }
}
