import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/create_or_update_service_item_use_case.dart';
import 'package:carport/domain/validators/mileage_input.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/service_item_detail/service_item_detail_event.dart';
import 'package:carport/screens/garage/service_item_detail/service_item_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceItemDetailBloc
    extends Bloc<ServiceItemDetailEvent, ServiceItemDetailState> {
  ServiceItemDetailBloc({
    required ServiceItemRepository serviceItemRepository,
    required VehicleRepository vehicleRepository,
    required CreateOrUpdateServiceItemUseCase createOrUpdateServiceItemUseCase,
    required AppRouter router,
  })  : _serviceItemRepository = serviceItemRepository,
        _vehicleRepository = vehicleRepository,
        _createOrUpdateServiceItemUseCase = createOrUpdateServiceItemUseCase,
        _router = router,
        super(const ServiceItemDetailState()) {
    on<ServiceItemDetailEvent>(_onEvent);
  }

  final ServiceItemRepository _serviceItemRepository;
  final VehicleRepository _vehicleRepository;
  final CreateOrUpdateServiceItemUseCase _createOrUpdateServiceItemUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    ServiceItemDetailEvent event,
    Emitter<ServiceItemDetailState> emit,
  ) async {
    await event.map(
      started: (event) => _load(emit, event.vehicleId, event.serviceItemId),
      backTapped: (_) async {
        if (state.isSaving) return;
        _router.pop();
      },
      editToggled: (_) async => _enterEditMode(emit),
      saved: (_) async => _save(emit),
      titleChanged: (event) async {
        emit(
          state.copyWith(
            draftTitle: event.value,
            titleError: null,
            errorMessage: null,
          ),
        );
      },
      descriptionChanged: (event) async {
        emit(state.copyWith(draftDescription: event.value, errorMessage: null));
      },
      dateChanged: (event) async {
        emit(state.copyWith(draftDate: event.value, errorMessage: null));
      },
      mileageChanged: (event) async {
        emit(state.copyWith(draftMileage: event.value, errorMessage: null));
      },
    );
  }

  Future<void> _load(
    Emitter<ServiceItemDetailState> emit,
    String vehicleId,
    String serviceItemId,
  ) async {
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing vehicleId in route (/garage/vehicles/:vehicleId/log/:serviceItemId)',
        ),
      );
      return;
    }

    if (serviceItemId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing serviceItemId in route (/garage/vehicles/:vehicleId/log/:serviceItemId)',
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

  void _enterEditMode(Emitter<ServiceItemDetailState> emit) {
    final serviceItem = state.serviceItem;
    if (serviceItem == null) return;

    emit(
      state.copyWith(
        isEditing: true,
        errorMessage: null,
        titleError: null,
        draftTitle: serviceItem.title,
        draftDescription: serviceItem.description,
        draftDate: serviceItem.date,
        draftMileage: MileageInput.formatForField(serviceItem.mileage),
      ),
    );
  }

  Future<void> _save(Emitter<ServiceItemDetailState> emit) async {
    final serviceItem = state.serviceItem;
    final vehicle = state.vehicle;
    if (serviceItem == null || vehicle == null || state.isSaving) return;

    final title = state.draftTitle.trim();
    if (title.isEmpty) {
      emit(
        state.copyWith(
          titleError: 'Title is required',
          errorMessage: null,
        ),
      );
      return;
    }

    final mileageResult = MileageInput.parse(state.draftMileage);
    if (mileageResult.errorMessage != null) {
      emit(state.copyWith(errorMessage: mileageResult.errorMessage));
      return;
    }

    final date = state.draftDate ?? serviceItem.date;

    emit(
      state.copyWith(
        isSaving: true,
        errorMessage: null,
        titleError: null,
      ),
    );

    try {
      await _createOrUpdateServiceItemUseCase(
        ServiceItem(
          id: serviceItem.id,
          vehicleId: vehicle.id,
          title: title,
          description: state.draftDescription.trim(),
          date: date,
          mileage: mileageResult.value!,
        ),
      );

      final updated = ServiceItem(
        id: serviceItem.id,
        vehicleId: vehicle.id,
        title: title,
        description: state.draftDescription.trim(),
        date: date,
        mileage: mileageResult.value!,
      );

      emit(
        state.copyWith(
          serviceItem: updated,
          isEditing: false,
          isSaving: false,
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
}
