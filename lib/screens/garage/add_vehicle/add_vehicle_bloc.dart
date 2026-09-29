import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/use_cases/create_or_update_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_event.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVehicleBloc extends Bloc<AddVehicleEvent, AddVehicleState> {
  AddVehicleBloc({
    required CreateOrUpdateVehicleUseCase createOrUpdateVehicleUseCase,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  })  : _createOrUpdateVehicleUseCase = createOrUpdateVehicleUseCase,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _router = router,
        super(const AddVehicleState()) {
    on<AddVehicleEvent>(_onEvent);
  }

  final CreateOrUpdateVehicleUseCase _createOrUpdateVehicleUseCase;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    AddVehicleEvent event,
    Emitter<AddVehicleState> emit,
  ) async {
    await event.map(
      started: (_) => _loadUnit(emit),
      backTapped: (_) async => _router.pop(),
      submitted: (_) async => _submit(emit),
      nameChanged: (event) async {
        emit(
          state.copyWith(
            name: event.value,
            nameError: null,
            errorMessage: null,
          ),
        );
      },
      descriptionChanged: (event) async {
        emit(state.copyWith(description: event.value, errorMessage: null));
      },
      mileageChanged: (event) async {
        emit(state.copyWith(mileage: event.value, errorMessage: null));
      },
      link1Changed: (event) async {
        emit(state.copyWith(link1: event.value, errorMessage: null));
      },
      link2Changed: (event) async {
        emit(state.copyWith(link2: event.value, errorMessage: null));
      },
    );
  }

  Future<void> _loadUnit(Emitter<AddVehicleState> emit) async {
    try {
      final unit = await _getDistanceUnitUseCase();
      emit(state.copyWith(distanceUnit: unit));
    } catch (e, st) {
      logger.e('Failed to load distance unit', error: e, stackTrace: st);
    }
  }

  Future<void> _submit(Emitter<AddVehicleState> emit) async {
    if (state.isSubmitting) return;

    final name = state.name.trim();
    if (name.isEmpty) {
      emit(
        state.copyWith(
          nameError: 'Name is required',
          errorMessage: null,
        ),
      );
      return;
    }

    final mileageText = state.mileage.trim().replaceAll(',', '');
    final double mileage;
    if (mileageText.isEmpty) {
      mileage = 0;
    } else {
      final parsed = double.tryParse(mileageText);
      if (parsed == null) {
        emit(state.copyWith(errorMessage: 'Enter a valid mileage'));
        return;
      }
      if (parsed < 0) {
        emit(state.copyWith(errorMessage: 'Mileage cannot be negative'));
        return;
      }
      mileage = parsed;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null, nameError: null));

    try {
      await _createOrUpdateVehicleUseCase(
        Vehicle(
          id: '',
          name: name,
          description: state.description.trim(),
          maintenancePlanImage: null,
          documentsImage: null,
          userManualLink: _nullableTrim(state.link1),
          maintenanceManualLink: _nullableTrim(state.link2),
          mileage: mileage,
        ),
      );
      _router.go('/garage/vehicles');
    } catch (e, st) {
      logger.e('Failed to create vehicle', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Could not add vehicle',
        ),
      );
    }
  }

  String? _nullableTrim(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
