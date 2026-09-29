import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_form_state.freezed.dart';

@freezed
abstract class QuickEntryFormState with _$QuickEntryFormState {
  const factory QuickEntryFormState({
    @Default('') String vehicleId,
    Vehicle? vehicle,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
    @Default('') String mileage,
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    String? titleError,
    String? errorMessage,
  }) = _QuickEntryFormState;

  factory QuickEntryFormState.initial() {
    final now = DateTime.now();
    return QuickEntryFormState(
      date: DateTime(now.year, now.month, now.day),
    );
  }
}
