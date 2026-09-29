import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/use_cases/create_or_update_service_item_use_case.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_event.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickEntryFormBloc extends Bloc<QuickEntryFormEvent, QuickEntryFormState> {
  QuickEntryFormBloc({
    required VehicleRepository vehicleRepository,
    required CreateOrUpdateServiceItemUseCase createOrUpdateServiceItemUseCase,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _createOrUpdateServiceItemUseCase = createOrUpdateServiceItemUseCase,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _router = router,
        super(QuickEntryFormState.initial()) {
    on<QuickEntryFormEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final CreateOrUpdateServiceItemUseCase _createOrUpdateServiceItemUseCase;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    QuickEntryFormEvent event,
    Emitter<QuickEntryFormState> emit,
  ) async {
    await event.map(
      started: (event) => _loadVehicle(emit, event.vehicleId),
      backTapped: (_) async {
        if (state.isSubmitting) return;
        _router.pop();
      },
      titleChanged: (event) async {
        emit(
          state.copyWith(
            title: event.value,
            titleError: null,
            errorMessage: null,
          ),
        );
      },
      descriptionChanged: (event) async {
        emit(state.copyWith(description: event.value, errorMessage: null));
      },
      dateChanged: (event) async {
        emit(state.copyWith(date: event.value, errorMessage: null));
      },
      mileageChanged: (event) async {
        emit(state.copyWith(mileage: event.value, errorMessage: null));
      },
      submitted: (_) async => _submit(emit),
    );
  }

  Future<void> _loadVehicle(
    Emitter<QuickEntryFormState> emit,
    String vehicleId,
  ) async {
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing vehicleId in route (/garage/quick-entry/:vehicleId/form)',
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
      logger.e('Failed to load vehicle for quick entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load vehicle: $e',
        ),
      );
    }
  }

  Future<void> _submit(Emitter<QuickEntryFormState> emit) async {
    if (state.isSubmitting || state.isLoading) return;

    final vehicle = state.vehicle;
    if (vehicle == null) {
      emit(state.copyWith(errorMessage: 'Vehicle not loaded'));
      return;
    }

    final title = state.title.trim();
    if (title.isEmpty) {
      emit(
        state.copyWith(
          titleError: 'Title is required',
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

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        titleError: null,
      ),
    );

    try {
      await _createOrUpdateServiceItemUseCase(
        ServiceItem(
          id: '',
          vehicleId: vehicle.id,
          title: title,
          description: state.description.trim(),
          date: state.date,
          mileage: mileage,
        ),
      );
      _router.goHome();
    } catch (e, st) {
      logger.e('Failed to save service entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Could not save entry: $e',
        ),
      );
    }
  }
}
