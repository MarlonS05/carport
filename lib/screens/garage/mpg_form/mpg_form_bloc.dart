import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/mpg_entry.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/mpg/create_mpg_entry_use_case.dart';
import 'package:carport/domain/use_cases/use_case_validation_exception.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_event.dart';
import 'package:carport/screens/garage/mpg_form/mpg_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MpgFormBloc extends Bloc<MpgFormEvent, MpgFormState> {
  MpgFormBloc({
    required VehicleRepository vehicleRepository,
    required CreateMpgEntryUseCase createMpgEntryUseCase,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _createMpgEntryUseCase = createMpgEntryUseCase,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _router = router,
        super(const MpgFormState()) {
    on<MpgFormEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final CreateMpgEntryUseCase _createMpgEntryUseCase;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    MpgFormEvent event,
    Emitter<MpgFormState> emit,
  ) async {
    await event.map(
      started: (event) => _loadVehicle(emit, event.vehicleId),
      backTapped: (_) async {
        if (state.isSubmitting) return;
        _router.pop();
      },
      litersChanged: (event) async {
        emit(
          state.copyWith(
            liters: event.value,
            litersError: null,
            errorMessage: null,
          ),
        );
      },
      distanceChanged: (event) async {
        emit(
          state.copyWith(
            distance: event.value,
            distanceError: null,
            errorMessage: null,
          ),
        );
      },
      submitted: (_) async => _submit(emit),
    );
  }

  Future<void> _loadVehicle(
    Emitter<MpgFormState> emit,
    String vehicleId,
  ) async {
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Missing vehicleId in route (/garage/mpg/:vehicleId/form)',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        vehicleId: vehicleId,
        isLoading: true,
        errorMessage: null,
      ),
    );

    try {
      final results = await Future.wait([
        _vehicleRepository.getById(vehicleId),
        _getDistanceUnitUseCase(),
      ]);
      final vehicle = results[0] as Vehicle?;
      final distanceUnit = results[1] as DistanceUnit;
      if (vehicle == null) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Vehicle not found: $vehicleId',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          vehicle: vehicle,
          distanceUnit: distanceUnit,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load vehicle for MPG form', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load vehicle: $e',
        ),
      );
    }
  }

  Future<void> _submit(Emitter<MpgFormState> emit) async {
    if (state.isSubmitting || state.isLoading) return;

    final vehicle = state.vehicle;
    if (vehicle == null) {
      emit(state.copyWith(errorMessage: 'Vehicle not loaded'));
      return;
    }

    final litersResult = _parsePositive(
      state.liters,
      emptyMessage: 'Enter the fill amount in liters',
      invalidMessage: 'Enter a valid fill amount',
      nonPositiveMessage: 'Fill amount must be greater than zero',
    );
    final distanceResult = _parsePositive(
      state.distance,
      emptyMessage: 'Enter distance since last fill-up',
      invalidMessage: 'Enter a valid distance',
      nonPositiveMessage: 'Distance must be greater than zero',
    );

    if (litersResult.error != null || distanceResult.error != null) {
      emit(
        state.copyWith(
          litersError: litersResult.error,
          distanceError: distanceResult.error,
          errorMessage: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        litersError: null,
        distanceError: null,
        errorMessage: null,
      ),
    );

    try {
      final now = DateTime.now();
      await _createMpgEntryUseCase(
        MpgEntry(
          id: '',
          vehicleId: vehicle.id,
          liters: litersResult.value!,
          distance: distanceResult.value!,
          distanceUnit: state.distanceUnit,
          recordedAt: DateTime(now.year, now.month, now.day),
        ),
      );
      _router.goHome();
    } on UseCaseValidationException catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          litersError: e.fieldErrors['liters'],
          distanceError: e.fieldErrors['distance'],
          errorMessage: e.fieldErrors['vehicleId'],
        ),
      );
    } catch (e, st) {
      logger.e('Failed to save MPG entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Could not save fill-up: $e',
        ),
      );
    }
  }

  ({double? value, String? error}) _parsePositive(
    String raw, {
    required String emptyMessage,
    required String invalidMessage,
    required String nonPositiveMessage,
  }) {
    final text = raw.trim().replaceAll(',', '');
    if (text.isEmpty) {
      return (value: null, error: emptyMessage);
    }
    final parsed = double.tryParse(text);
    if (parsed == null) {
      return (value: null, error: invalidMessage);
    }
    if (parsed <= 0) {
      return (value: null, error: nonPositiveMessage);
    }
    return (value: parsed, error: null);
  }
}
