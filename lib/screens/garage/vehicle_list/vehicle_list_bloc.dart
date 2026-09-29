import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_event.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleListBloc extends Bloc<VehicleListEvent, VehicleListState> {
  VehicleListBloc({
    required VehicleRepository vehicleRepository,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _router = router,
        super(const VehicleListState()) {
    on<VehicleListEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    VehicleListEvent event,
    Emitter<VehicleListState> emit,
  ) async {
    await event.map(
      started: (_) => _loadVehicles(emit),
      backTapped: (_) async => _router.goHome(),
      addVehicleTapped: (_) async {
        await _router.push('/garage/vehicles/add');
        await _loadVehicles(emit, showLoading: false);
      },
      vehicleTapped: (event) async {
        await _router.push('/garage/vehicles/${event.vehicleId}');
        await _loadVehicles(emit, showLoading: false);
      },
    );
  }

  Future<void> _loadVehicles(
    Emitter<VehicleListState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(state.copyWith(isLoading: true, errorMessage: null));
    }

    try {
      final results = await Future.wait([
        _vehicleRepository.getAll(),
        _getDistanceUnitUseCase(),
      ]);
      final vehicles = results[0] as List;
      final distanceUnit = results[1] as DistanceUnit;
      emit(
        state.copyWith(
          vehicles: List<Vehicle>.from(vehicles),
          distanceUnit: distanceUnit,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load vehicles', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load vehicles',
        ),
      );
    }
  }
}
