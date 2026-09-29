import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_attachments_event.freezed.dart';

@freezed
abstract class VehicleAttachmentsEvent with _$VehicleAttachmentsEvent {
  const factory VehicleAttachmentsEvent.started({
    required String vehicleId,
  }) = _Started;

  const factory VehicleAttachmentsEvent.backTapped() = _BackTapped;

  const factory VehicleAttachmentsEvent.filePicked({
    required String sourcePath,
    required String displayName,
    String? mimeType,
  }) = _FilePicked;

  const factory VehicleAttachmentsEvent.deleteTapped({
    required String attachmentId,
  }) = _DeleteTapped;
}
