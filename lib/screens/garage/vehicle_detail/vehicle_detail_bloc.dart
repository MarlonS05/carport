import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/repositories/mpg_entry_repository.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/authenticate_with_biometrics_use_case.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/create_or_update_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/use_case_validation_exception.dart';
import 'package:carport/domain/validators/mileage_input.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_event.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDetailBloc extends Bloc<VehicleDetailEvent, VehicleDetailState> {
  VehicleDetailBloc({
    required VehicleRepository vehicleRepository,
    required ServiceItemRepository serviceItemRepository,
    required MpgEntryRepository mpgEntryRepository,
    required CreateOrUpdateVehicleUseCase createOrUpdateVehicleUseCase,
    required DeleteVehicleUseCase deleteVehicleUseCase,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required AuthenticateWithBiometricsUseCase authenticateWithBiometricsUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _serviceItemRepository = serviceItemRepository,
        _mpgEntryRepository = mpgEntryRepository,
        _createOrUpdateVehicleUseCase = createOrUpdateVehicleUseCase,
        _deleteVehicleUseCase = deleteVehicleUseCase,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _authenticateWithBiometricsUseCase = authenticateWithBiometricsUseCase,
        _router = router,
        super(const VehicleDetailState()) {
    on<VehicleDetailEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final ServiceItemRepository _serviceItemRepository;
  final MpgEntryRepository _mpgEntryRepository;
  final CreateOrUpdateVehicleUseCase _createOrUpdateVehicleUseCase;
  final DeleteVehicleUseCase _deleteVehicleUseCase;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final AuthenticateWithBiometricsUseCase _authenticateWithBiometricsUseCase;
  final AppRouter _router;

  String? _vehicleId;

  Future<void> _onEvent(
    VehicleDetailEvent event,
    Emitter<VehicleDetailState> emit,
  ) async {
    await event.map(
      started: (event) => _loadVehicle(emit, event.vehicleId),
      backTapped: (_) async => _router.pop(),
      editToggled: (_) async => _enterEditMode(emit),
      saved: (event) async => _saveVehicle(
        emit,
        name: event.name,
        description: event.description,
        mileage: event.mileage,
        userManualLink: event.userManualLink,
        maintenanceManualLink: event.maintenanceManualLink,
        maintenancePlanImage: event.maintenancePlanImage,
        documentsImage: event.documentsImage,
      ),
      serviceLogTapped: (_) async {
        final id = _vehicleId;
        if (id == null) return;
        await _router.push(AppRoutes.serviceLog(id));
        await _reloadVehicleAndEntryCount(emit);
      },
      mpgHistoryTapped: (_) async {
        final id = _vehicleId;
        if (id == null) return;
        await _router.push(AppRoutes.mpgHistory(id));
        await _reloadVehicleAndEntryCount(emit);
      },
      attachmentsTapped: (_) async {
        final id = _vehicleId;
        if (id == null) return;
        await _router.push(AppRoutes.vehicleAttachments(id));
      },
      documentsButtonTapped: (_) async => _unlockDocuments(emit),
      deleteConfirmed: (_) async => _deleteVehicle(emit),
    );
  }

  Future<void> _loadVehicle(
    Emitter<VehicleDetailState> emit,
    String vehicleId,
  ) async {
    _vehicleId = vehicleId;
    emit(state.copyWith(isLoading: true, errorMessage: null));

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
            errorMessage: 'Vehicle not found',
          ),
        );
        _router.pop();
        return;
      }

      final entries = await _serviceItemRepository.getByVehicleId(vehicleId);
      final mpgEntries = await _mpgEntryRepository.getByVehicleId(vehicleId);
      emit(
        state.copyWith(
          vehicle: vehicle,
          distanceUnit: distanceUnit,
          isLoading: false,
          errorMessage: null,
          entryCount: entries.length,
          mpgEntryCount: mpgEntries.length,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load vehicle', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load vehicle',
        ),
      );
    }
  }

  Future<void> _reloadVehicleAndEntryCount(
    Emitter<VehicleDetailState> emit,
  ) async {
    final id = _vehicleId;
    if (id == null) return;

    try {
      final vehicle = await _vehicleRepository.getById(id);
      final entries = await _serviceItemRepository.getByVehicleId(id);
      final mpgEntries = await _mpgEntryRepository.getByVehicleId(id);
      emit(
        state.copyWith(
          vehicle: vehicle ?? state.vehicle,
          entryCount: entries.length,
          mpgEntryCount: mpgEntries.length,
        ),
      );
    } catch (e, st) {
      logger.e(
        'Failed to reload vehicle and entry count',
        error: e,
        stackTrace: st,
      );
    }
  }

  void _enterEditMode(Emitter<VehicleDetailState> emit) {
    if (state.vehicle == null) return;

    emit(
      state.copyWith(
        isEditing: true,
        errorMessage: null,
        fieldErrors: {},
      ),
    );
  }

  Future<void> _unlockDocuments(Emitter<VehicleDetailState> emit) async {
    if (state.vehicle == null || state.isAuthenticatingDocuments) return;

    emit(
      state.copyWith(
        isAuthenticatingDocuments: true,
        errorMessage: null,
      ),
    );

    try {
      final unlocked = await _authenticateWithBiometricsUseCase(
        reason: 'Authenticate to view vehicle documents',
      );
      if (unlocked) {
        emit(
          state.copyWith(
            isAuthenticatingDocuments: false,
            documentsAccessNonce: state.documentsAccessNonce + 1,
          ),
        );
        return;
      }

      emit(state.copyWith(isAuthenticatingDocuments: false));
    } catch (e, st) {
      logger.e(
        'Failed to authenticate for vehicle documents',
        error: e,
        stackTrace: st,
      );
      emit(
        state.copyWith(
          isAuthenticatingDocuments: false,
          errorMessage: 'Could not unlock vehicle documents',
        ),
      );
    }
  }

  Future<void> _saveVehicle(
    Emitter<VehicleDetailState> emit, {
    required String name,
    required String description,
    required String mileage,
    required String userManualLink,
    required String maintenanceManualLink,
    String? maintenancePlanImage,
    String? documentsImage,
  }) async {
    final vehicle = state.vehicle;
    if (vehicle == null || state.isSaving) return;

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
      final saved = await _createOrUpdateVehicleUseCase(
        Vehicle(
          id: vehicle.id,
          name: name.trim(),
          description: description.trim(),
          maintenancePlanImage: maintenancePlanImage,
          documentsImage: documentsImage,
          userManualLink: _nullableTrim(userManualLink),
          maintenanceManualLink: _nullableTrim(maintenanceManualLink),
          mileage: mileageResult.value!,
        ),
      );
      emit(
        state.copyWith(
          vehicle: saved,
          isEditing: false,
          isSaving: false,
          errorMessage: null,
        ),
      );
    } on UseCaseValidationException catch (e) {
      emit(
        state.copyWith(
          isSaving: false,
          fieldErrors: e.fieldErrors,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to save vehicle', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: 'Could not save vehicle',
        ),
      );
    }
  }

  Future<void> _deleteVehicle(Emitter<VehicleDetailState> emit) async {
    final vehicle = state.vehicle;
    if (vehicle == null || state.isDeleting || state.isSaving) return;

    emit(state.copyWith(isDeleting: true, errorMessage: null));

    try {
      await _deleteVehicleUseCase(vehicle.id);
      _router.pop();
    } catch (e, st) {
      logger.e('Failed to delete vehicle', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isDeleting: false,
          errorMessage: 'Could not delete vehicle',
        ),
      );
    }
  }

  String? _nullableTrim(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
