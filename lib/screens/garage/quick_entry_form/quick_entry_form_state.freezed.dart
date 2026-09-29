// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_entry_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuickEntryFormState {

 String get vehicleId; Vehicle? get vehicle; String get title; String get description; DateTime get date; String get mileage; bool get isLoading; bool get isSubmitting; DistanceUnit get distanceUnit; String? get titleError; String? get errorMessage;
/// Create a copy of QuickEntryFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickEntryFormStateCopyWith<QuickEntryFormState> get copyWith => _$QuickEntryFormStateCopyWithImpl<QuickEntryFormState>(this as QuickEntryFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickEntryFormState&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,vehicle,title,description,date,mileage,isLoading,isSubmitting,distanceUnit,titleError,errorMessage);

@override
String toString() {
  return 'QuickEntryFormState(vehicleId: $vehicleId, vehicle: $vehicle, title: $title, description: $description, date: $date, mileage: $mileage, isLoading: $isLoading, isSubmitting: $isSubmitting, distanceUnit: $distanceUnit, titleError: $titleError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $QuickEntryFormStateCopyWith<$Res>  {
  factory $QuickEntryFormStateCopyWith(QuickEntryFormState value, $Res Function(QuickEntryFormState) _then) = _$QuickEntryFormStateCopyWithImpl;
@useResult
$Res call({
 String vehicleId, Vehicle? vehicle, String title, String description, DateTime date, String mileage, bool isLoading, bool isSubmitting, DistanceUnit distanceUnit, String? titleError, String? errorMessage
});




}
/// @nodoc
class _$QuickEntryFormStateCopyWithImpl<$Res>
    implements $QuickEntryFormStateCopyWith<$Res> {
  _$QuickEntryFormStateCopyWithImpl(this._self, this._then);

  final QuickEntryFormState _self;
  final $Res Function(QuickEntryFormState) _then;

/// Create a copy of QuickEntryFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleId = null,Object? vehicle = freezed,Object? title = null,Object? description = null,Object? date = null,Object? mileage = null,Object? isLoading = null,Object? isSubmitting = null,Object? distanceUnit = null,Object? titleError = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,titleError: freezed == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuickEntryFormState].
extension QuickEntryFormStatePatterns on QuickEntryFormState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickEntryFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickEntryFormState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickEntryFormState value)  $default,){
final _that = this;
switch (_that) {
case _QuickEntryFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickEntryFormState value)?  $default,){
final _that = this;
switch (_that) {
case _QuickEntryFormState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vehicleId,  Vehicle? vehicle,  String title,  String description,  DateTime date,  String mileage,  bool isLoading,  bool isSubmitting,  DistanceUnit distanceUnit,  String? titleError,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickEntryFormState() when $default != null:
return $default(_that.vehicleId,_that.vehicle,_that.title,_that.description,_that.date,_that.mileage,_that.isLoading,_that.isSubmitting,_that.distanceUnit,_that.titleError,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vehicleId,  Vehicle? vehicle,  String title,  String description,  DateTime date,  String mileage,  bool isLoading,  bool isSubmitting,  DistanceUnit distanceUnit,  String? titleError,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _QuickEntryFormState():
return $default(_that.vehicleId,_that.vehicle,_that.title,_that.description,_that.date,_that.mileage,_that.isLoading,_that.isSubmitting,_that.distanceUnit,_that.titleError,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vehicleId,  Vehicle? vehicle,  String title,  String description,  DateTime date,  String mileage,  bool isLoading,  bool isSubmitting,  DistanceUnit distanceUnit,  String? titleError,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _QuickEntryFormState() when $default != null:
return $default(_that.vehicleId,_that.vehicle,_that.title,_that.description,_that.date,_that.mileage,_that.isLoading,_that.isSubmitting,_that.distanceUnit,_that.titleError,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _QuickEntryFormState implements QuickEntryFormState {
  const _QuickEntryFormState({this.vehicleId = '', this.vehicle, this.title = '', this.description = '', required this.date, this.mileage = '', this.isLoading = false, this.isSubmitting = false, this.distanceUnit = DistanceUnit.miles, this.titleError, this.errorMessage});
  

@override@JsonKey() final  String vehicleId;
@override final  Vehicle? vehicle;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  DateTime date;
@override@JsonKey() final  String mileage;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override final  String? titleError;
@override final  String? errorMessage;

/// Create a copy of QuickEntryFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickEntryFormStateCopyWith<_QuickEntryFormState> get copyWith => __$QuickEntryFormStateCopyWithImpl<_QuickEntryFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickEntryFormState&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,vehicle,title,description,date,mileage,isLoading,isSubmitting,distanceUnit,titleError,errorMessage);

@override
String toString() {
  return 'QuickEntryFormState(vehicleId: $vehicleId, vehicle: $vehicle, title: $title, description: $description, date: $date, mileage: $mileage, isLoading: $isLoading, isSubmitting: $isSubmitting, distanceUnit: $distanceUnit, titleError: $titleError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$QuickEntryFormStateCopyWith<$Res> implements $QuickEntryFormStateCopyWith<$Res> {
  factory _$QuickEntryFormStateCopyWith(_QuickEntryFormState value, $Res Function(_QuickEntryFormState) _then) = __$QuickEntryFormStateCopyWithImpl;
@override @useResult
$Res call({
 String vehicleId, Vehicle? vehicle, String title, String description, DateTime date, String mileage, bool isLoading, bool isSubmitting, DistanceUnit distanceUnit, String? titleError, String? errorMessage
});




}
/// @nodoc
class __$QuickEntryFormStateCopyWithImpl<$Res>
    implements _$QuickEntryFormStateCopyWith<$Res> {
  __$QuickEntryFormStateCopyWithImpl(this._self, this._then);

  final _QuickEntryFormState _self;
  final $Res Function(_QuickEntryFormState) _then;

/// Create a copy of QuickEntryFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,Object? vehicle = freezed,Object? title = null,Object? description = null,Object? date = null,Object? mileage = null,Object? isLoading = null,Object? isSubmitting = null,Object? distanceUnit = null,Object? titleError = freezed,Object? errorMessage = freezed,}) {
  return _then(_QuickEntryFormState(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,titleError: freezed == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
