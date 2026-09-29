// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpg_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MpgFormState {

 String get vehicleId; Vehicle? get vehicle; String get liters; String get distance; bool get isLoading; bool get isSubmitting; DistanceUnit get distanceUnit; String? get litersError; String? get distanceError; String? get errorMessage;
/// Create a copy of MpgFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MpgFormStateCopyWith<MpgFormState> get copyWith => _$MpgFormStateCopyWithImpl<MpgFormState>(this as MpgFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MpgFormState&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.liters, liters) || other.liters == liters)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.litersError, litersError) || other.litersError == litersError)&&(identical(other.distanceError, distanceError) || other.distanceError == distanceError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,vehicle,liters,distance,isLoading,isSubmitting,distanceUnit,litersError,distanceError,errorMessage);

@override
String toString() {
  return 'MpgFormState(vehicleId: $vehicleId, vehicle: $vehicle, liters: $liters, distance: $distance, isLoading: $isLoading, isSubmitting: $isSubmitting, distanceUnit: $distanceUnit, litersError: $litersError, distanceError: $distanceError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MpgFormStateCopyWith<$Res>  {
  factory $MpgFormStateCopyWith(MpgFormState value, $Res Function(MpgFormState) _then) = _$MpgFormStateCopyWithImpl;
@useResult
$Res call({
 String vehicleId, Vehicle? vehicle, String liters, String distance, bool isLoading, bool isSubmitting, DistanceUnit distanceUnit, String? litersError, String? distanceError, String? errorMessage
});




}
/// @nodoc
class _$MpgFormStateCopyWithImpl<$Res>
    implements $MpgFormStateCopyWith<$Res> {
  _$MpgFormStateCopyWithImpl(this._self, this._then);

  final MpgFormState _self;
  final $Res Function(MpgFormState) _then;

/// Create a copy of MpgFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleId = null,Object? vehicle = freezed,Object? liters = null,Object? distance = null,Object? isLoading = null,Object? isSubmitting = null,Object? distanceUnit = null,Object? litersError = freezed,Object? distanceError = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,liters: null == liters ? _self.liters : liters // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,litersError: freezed == litersError ? _self.litersError : litersError // ignore: cast_nullable_to_non_nullable
as String?,distanceError: freezed == distanceError ? _self.distanceError : distanceError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MpgFormState].
extension MpgFormStatePatterns on MpgFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MpgFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MpgFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MpgFormState value)  $default,){
final _that = this;
switch (_that) {
case _MpgFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MpgFormState value)?  $default,){
final _that = this;
switch (_that) {
case _MpgFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vehicleId,  Vehicle? vehicle,  String liters,  String distance,  bool isLoading,  bool isSubmitting,  DistanceUnit distanceUnit,  String? litersError,  String? distanceError,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MpgFormState() when $default != null:
return $default(_that.vehicleId,_that.vehicle,_that.liters,_that.distance,_that.isLoading,_that.isSubmitting,_that.distanceUnit,_that.litersError,_that.distanceError,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vehicleId,  Vehicle? vehicle,  String liters,  String distance,  bool isLoading,  bool isSubmitting,  DistanceUnit distanceUnit,  String? litersError,  String? distanceError,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MpgFormState():
return $default(_that.vehicleId,_that.vehicle,_that.liters,_that.distance,_that.isLoading,_that.isSubmitting,_that.distanceUnit,_that.litersError,_that.distanceError,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vehicleId,  Vehicle? vehicle,  String liters,  String distance,  bool isLoading,  bool isSubmitting,  DistanceUnit distanceUnit,  String? litersError,  String? distanceError,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MpgFormState() when $default != null:
return $default(_that.vehicleId,_that.vehicle,_that.liters,_that.distance,_that.isLoading,_that.isSubmitting,_that.distanceUnit,_that.litersError,_that.distanceError,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MpgFormState implements MpgFormState {
  const _MpgFormState({this.vehicleId = '', this.vehicle, this.liters = '', this.distance = '', this.isLoading = false, this.isSubmitting = false, this.distanceUnit = DistanceUnit.miles, this.litersError, this.distanceError, this.errorMessage});
  

@override@JsonKey() final  String vehicleId;
@override final  Vehicle? vehicle;
@override@JsonKey() final  String liters;
@override@JsonKey() final  String distance;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override final  String? litersError;
@override final  String? distanceError;
@override final  String? errorMessage;

/// Create a copy of MpgFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MpgFormStateCopyWith<_MpgFormState> get copyWith => __$MpgFormStateCopyWithImpl<_MpgFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MpgFormState&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.liters, liters) || other.liters == liters)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.litersError, litersError) || other.litersError == litersError)&&(identical(other.distanceError, distanceError) || other.distanceError == distanceError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,vehicle,liters,distance,isLoading,isSubmitting,distanceUnit,litersError,distanceError,errorMessage);

@override
String toString() {
  return 'MpgFormState(vehicleId: $vehicleId, vehicle: $vehicle, liters: $liters, distance: $distance, isLoading: $isLoading, isSubmitting: $isSubmitting, distanceUnit: $distanceUnit, litersError: $litersError, distanceError: $distanceError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MpgFormStateCopyWith<$Res> implements $MpgFormStateCopyWith<$Res> {
  factory _$MpgFormStateCopyWith(_MpgFormState value, $Res Function(_MpgFormState) _then) = __$MpgFormStateCopyWithImpl;
@override @useResult
$Res call({
 String vehicleId, Vehicle? vehicle, String liters, String distance, bool isLoading, bool isSubmitting, DistanceUnit distanceUnit, String? litersError, String? distanceError, String? errorMessage
});




}
/// @nodoc
class __$MpgFormStateCopyWithImpl<$Res>
    implements _$MpgFormStateCopyWith<$Res> {
  __$MpgFormStateCopyWithImpl(this._self, this._then);

  final _MpgFormState _self;
  final $Res Function(_MpgFormState) _then;

/// Create a copy of MpgFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,Object? vehicle = freezed,Object? liters = null,Object? distance = null,Object? isLoading = null,Object? isSubmitting = null,Object? distanceUnit = null,Object? litersError = freezed,Object? distanceError = freezed,Object? errorMessage = freezed,}) {
  return _then(_MpgFormState(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,liters: null == liters ? _self.liters : liters // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,litersError: freezed == litersError ? _self.litersError : litersError // ignore: cast_nullable_to_non_nullable
as String?,distanceError: freezed == distanceError ? _self.distanceError : distanceError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
