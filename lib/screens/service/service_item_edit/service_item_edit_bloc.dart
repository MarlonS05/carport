import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/create_or_update_service_item_use_case.dart';
import 'package:carport/domain/use_cases/delete_service_item_use_case.dart';
import 'package:carport/domain/use_cases/use_case_validation_exception.dart';
import 'package:carport/domain/validators/mileage_input.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/service/service_item_edit/service_item_edit_event.dart';
import 'package:carport/screens/service/service_item_edit/service_item_edit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceItemEditBloc
    extends Bloc<ServiceItemEditEvent, ServiceItemEditState> {
  ServiceItemEditBloc({
    required ServiceItemRepository serviceItemRepository,
    required VehicleRepository vehicleRepository,
    required CreateOrUpdateServiceItemUseCase createOrUpdateServiceItemUseCase,
    required DeleteServiceItemUseCase deleteServiceItemUseCase,
    required AppRouter router,
  })  : _serviceItemRepository = serviceItemRepository,
        _vehicleRepository = vehicleRepository,
        _createOrUpdateServiceItemUseCase = createOrUpdateServiceItemUseCase,
        _deleteServiceItemUseCase = deleteServiceItemUseCase,
        _router = router,
        super(const ServiceItemEditState()) {
    on<ServiceItemEditEvent>(_onEvent);
  }

  final ServiceItemRepository _serviceItemRepository;
  final VehicleRepository _vehicleRepository;
  final CreateOrUpdateServiceItemUseCase _createOrUpdateServiceItemUseCase;
  final DeleteServiceItemUseCase _deleteServiceItemUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    ServiceItemEditEvent event,
    Emitter<ServiceItemEditState> emit,
  ) async {
    await event.map(
      started: (event) => _load(emit, event.vehicleId, event.serviceItemId),
      backTapped: (_) async {
        if (state.isSaving || state.isDeleting) return;
        _router.pop();
      },
      saved: (event) async => _save(
        emit,
        title: event.title,
        description: event.description,
        date: event.date,
        mileage: event.mileage,
      ),
      deleteTapped: (_) async => _delete(emit),
    );
  }

  Future<void> _load(
    Emitter<ServiceItemEditState> emit,
    String vehicleId,
    String serviceItemId,
  ) async {
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing vehicleId in route (/garage/vehicles/:vehicleId/log/:serviceItemId/edit)',
        ),
      );
      return;
    }

    if (serviceItemId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing serviceItemId in route (/garage/vehicles/:vehicleId/log/:serviceItemId/edit)',
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

      final serviceItem = await _serviceItemRepository.getById(serviceItemId);
      if (serviceItem == null) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Service entry not found: $serviceItemId',
          ),
        );
        return;
      }

      if (serviceItem.vehicleId != vehicleId) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage:
                'Service entry $serviceItemId does not belong to vehicle $vehicleId',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          serviceItem: serviceItem,
          vehicle: vehicle,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load service entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load service entry: $e',
        ),
      );
    }
  }

  Future<void> _save(
    Emitter<ServiceItemEditState> emit, {
    required String title,
    required String description,
    required DateTime date,
    required String mileage,
  }) async {
    final serviceItem = state.serviceItem;
    final vehicle = state.vehicle;
    if (serviceItem == null || vehicle == null || state.isSaving || state.isDeleting) {
      return;
    }

    final mileageResult = MileageInput.parse(mileage);
    if (mileageResult.errorMessage != null) {
      emit(
        state.copyWith(
          fieldErrors: {'mileage': mileageResult.errorMessage!},
          errorMessage: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isSaving: true,
        errorMessage: null,
        fieldErrors: {},
      ),
    );

    try {
      await _createOrUpdateServiceItemUseCase(
        ServiceItem(
          id: serviceItem.id,
          vehicleId: vehicle.id,
          title: title.trim(),
          description: description.trim(),
          date: date,
          mileage: mileageResult.value!,
        ),
      );

      _router.pop();
    } on UseCaseValidationException catch (e) {
      emit(
        state.copyWith(
          isSaving: false,
          fieldErrors: e.fieldErrors,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to save service entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: 'Could not save entry: $e',
        ),
      );
    }
  }

  Future<void> _delete(Emitter<ServiceItemEditState> emit) async {
    final serviceItem = state.serviceItem;
    if (serviceItem == null || state.isDeleting || state.isSaving) return;

    emit(
      state.copyWith(
        isDeleting: true,
        errorMessage: null,
      ),
    );

    try {
      await _deleteServiceItemUseCase(serviceItem.id);
      _router.pop();
    } catch (e, st) {
      logger.e('Failed to delete service entry', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isDeleting: false,
          errorMessage: 'Could not delete entry',
        ),
      );
    }
  }
}
