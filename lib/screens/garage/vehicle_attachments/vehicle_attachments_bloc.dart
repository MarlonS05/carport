import 'package:carport/domain/repositories/vehicle_attachment_repository.dart';
import 'package:carport/domain/repositories/vehicle_repository.dart';
import 'package:carport/domain/use_cases/attach_vehicle_file_use_case.dart';
import 'package:carport/domain/use_cases/delete_vehicle_attachment_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_event.dart';
import 'package:carport/screens/garage/vehicle_attachments/vehicle_attachments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleAttachmentsBloc
    extends Bloc<VehicleAttachmentsEvent, VehicleAttachmentsState> {
  VehicleAttachmentsBloc({
    required VehicleRepository vehicleRepository,
    required VehicleAttachmentRepository attachmentRepository,
    required AttachVehicleFileUseCase attachVehicleFileUseCase,
    required DeleteVehicleAttachmentUseCase deleteVehicleAttachmentUseCase,
    required AppRouter router,
  })  : _vehicleRepository = vehicleRepository,
        _attachmentRepository = attachmentRepository,
        _attachVehicleFileUseCase = attachVehicleFileUseCase,
        _deleteVehicleAttachmentUseCase = deleteVehicleAttachmentUseCase,
        _router = router,
        super(const VehicleAttachmentsState()) {
    on<VehicleAttachmentsEvent>(_onEvent);
  }

  final VehicleRepository _vehicleRepository;
  final VehicleAttachmentRepository _attachmentRepository;
  final AttachVehicleFileUseCase _attachVehicleFileUseCase;
  final DeleteVehicleAttachmentUseCase _deleteVehicleAttachmentUseCase;
  final AppRouter _router;

  String? _vehicleId;

  Future<void> _onEvent(
    VehicleAttachmentsEvent event,
    Emitter<VehicleAttachmentsState> emit,
  ) async {
    await event.map(
      started: (event) => _load(emit, event.vehicleId),
      backTapped: (_) async => _router.pop(),
      filePicked: (event) async => _attachFile(
        emit,
        sourcePath: event.sourcePath,
        displayName: event.displayName,
        mimeType: event.mimeType,
      ),
      deleteTapped: (event) async =>
          _deleteAttachment(emit, event.attachmentId),
    );
  }

  Future<void> _load(Emitter<VehicleAttachmentsState> emit, String vehicleId) async {
    _vehicleId = vehicleId;
    if (vehicleId.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage:
              'Missing vehicleId in route (/garage/vehicles/:vehicleId/attachments)',
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

      final attachments =
          await _attachmentRepository.listByVehicleId(vehicleId);
      emit(
        state.copyWith(
          vehicle: vehicle,
          attachments: attachments,
          isLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load vehicle attachments', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load attachments',
        ),
      );
    }
  }

  Future<void> _reloadAttachments(Emitter<VehicleAttachmentsState> emit) async {
    final vehicleId = _vehicleId;
    if (vehicleId == null) return;

    try {
      final attachments =
          await _attachmentRepository.listByVehicleId(vehicleId);
      emit(state.copyWith(attachments: attachments));
    } catch (e, st) {
      logger.e('Failed to reload attachments', error: e, stackTrace: st);
    }
  }

  Future<void> _attachFile(
    Emitter<VehicleAttachmentsState> emit, {
    required String sourcePath,
    required String displayName,
    String? mimeType,
  }) async {
    final vehicleId = _vehicleId;
    if (vehicleId == null || state.isAttaching) return;

    emit(state.copyWith(isAttaching: true, errorMessage: null));

    try {
      await _attachVehicleFileUseCase(
        vehicleId: vehicleId,
        sourcePath: sourcePath,
        displayName: displayName,
        mimeType: mimeType,
      );
      await _reloadAttachments(emit);
      emit(state.copyWith(isAttaching: false));
    } catch (e, st) {
      logger.e('Failed to attach file', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isAttaching: false,
          errorMessage: 'Could not attach file',
        ),
      );
    }
  }

  Future<void> _deleteAttachment(
    Emitter<VehicleAttachmentsState> emit,
    String attachmentId,
  ) async {
    if (state.isDeleting) return;

    emit(state.copyWith(isDeleting: true, errorMessage: null));

    try {
      await _deleteVehicleAttachmentUseCase(attachmentId);
      await _reloadAttachments(emit);
      emit(state.copyWith(isDeleting: false));
    } catch (e, st) {
      logger.e('Failed to delete attachment', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isDeleting: false,
          errorMessage: 'Could not delete file',
        ),
      );
    }
  }
}
