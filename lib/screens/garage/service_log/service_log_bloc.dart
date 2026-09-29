import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/service_log/service_log_event.dart';
import 'package:carport/screens/garage/service_log/service_log_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceLogBloc extends Bloc<ServiceLogEvent, ServiceLogState> {
  ServiceLogBloc({
    required VehicleRepository vehicleRepository,
    required ServiceItemRepository serviceItemRepository,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  }) : _vehicleRepository = vehicleRepository,
       _serviceItemRepository = serviceItemRepository,
       _getDistanceUnitUseCase = getDistanceUnitUseCase,
       _router = router,
       super(const ServiceLogState()) {
    on<ServiceLogEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final ServiceItemRepository _serviceItemRepository;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  String? _vehicleId;

  Future<void> _onEvent(
    ServiceLogEvent event,
    Emitter<ServiceLogState> emit,
  ) async {
    await event.map(
      started: (event) => _load(emit, event.vehicleId),
      backTapped: (_) async {
        if (state.isLoading) return;
        _router.pop();
      },
      entryEditTapped: (event) async {
        final vehicleId = _vehicleId;
        if (vehicleId == null) return;
        await _router.push(
          AppRoutes.serviceItemEdit(vehicleId, event.serviceItemId),
        );
        await _load(emit, vehicleId);
      },
    );
  }

  Future<void> _load(Emitter<ServiceLogState> emit, String vehicleId) async {
    _vehicleId = vehicleId;
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing vehicleId in route (/garage/vehicles/:vehicleId/log)',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final distanceUnit = await _getDistanceUnitUseCase();
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

      final entries = await _serviceItemRepository.getByVehicleId(vehicleId);
      emit(
        state.copyWith(
          vehicle: vehicle,
          entries: entries,
          distanceUnit: distanceUnit,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load service log', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load service log: $e',
        ),
      );
    }
  }
}
