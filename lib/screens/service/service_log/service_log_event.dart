import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_log_event.freezed.dart';

@freezed
abstract class ServiceLogEvent with _$ServiceLogEvent {
  const factory ServiceLogEvent.started({
    required String vehicleId,
  }) = _Started;

  const factory ServiceLogEvent.backTapped() = _BackTapped;

  const factory ServiceLogEvent.entryEditTapped({
    required String serviceItemId,
  }) = _EntryEditTapped;
}
