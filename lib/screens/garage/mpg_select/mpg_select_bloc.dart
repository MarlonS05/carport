import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_event.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MpgSelectBloc extends Bloc<MpgSelectEvent, MpgSelectState> {
  MpgSelectBloc({
    required VehicleRepository vehicleRepository,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _router = router,
        super(const MpgSelectState()) {
    on<MpgSelectEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    MpgSelectEvent event,
    Emitter<MpgSelectState> emit,
  ) async {
    await event.map(
      started: (_) => _loadVehicles(emit),
      backTapped: (_) async => _router.pop(),
      vehicleTapped: (event) async {
        await _router.push(AppRoutes.mpgForm(event.vehicleId));
      },
    );
  }

  Future<void> _loadVehicles(Emitter<MpgSelectState> emit) async {
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
      logger.e('Failed to load vehicles for MPG', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load vehicles: $e',
        ),
      );
    }
  }
}
