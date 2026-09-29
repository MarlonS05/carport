import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_item_detail_event.freezed.dart';

@freezed
abstract class ServiceItemDetailEvent with _$ServiceItemDetailEvent {
  const factory ServiceItemDetailEvent.started({
    required String vehicleId,
    required String serviceItemId,
  }) = _Started;

  const factory ServiceItemDetailEvent.backTapped() = _BackTapped;

  const factory ServiceItemDetailEvent.editToggled() = _EditToggled;

  const factory ServiceItemDetailEvent.saved() = _Saved;

  const factory ServiceItemDetailEvent.titleChanged(String value) = _TitleChanged;

  const factory ServiceItemDetailEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory ServiceItemDetailEvent.dateChanged(DateTime value) =
      _DateChanged;

  const factory ServiceItemDetailEvent.mileageChanged(String value) =
      _MileageChanged;
}
