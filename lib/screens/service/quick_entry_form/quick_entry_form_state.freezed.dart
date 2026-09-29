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

 String get vehicleId; Vehicle? get vehicle; bool get isLoading; bool get isSubmitting; Map<String, String> get fieldErrors; String? get errorMessage;
/// Create a copy of QuickEntryFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickEntryFormStateCopyWith<QuickEntryFormState> get copyWith => _$QuickEntryFormStateCopyWithImpl<QuickEntryFormState>(this as QuickEntryFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickEntryFormState&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,vehicle,isLoading,isSubmitting,const DeepCollectionEquality().hash(fieldErrors),errorMessage);

@override
String toString() {
  return 'QuickEntryFormState(vehicleId: $vehicleId, vehicle: $vehicle, isLoading: $isLoading, isSubmitting: $isSubmitting, fieldErrors: $fieldErrors, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $QuickEntryFormStateCopyWith<$Res>  {
  factory $QuickEntryFormStateCopyWith(QuickEntryFormState value, $Res Function(QuickEntryFormState) _then) = _$QuickEntryFormStateCopyWithImpl;
@useResult
$Res call({
 String vehicleId, Vehicle? vehicle, bool isLoading, bool isSubmitting, Map<String, String> fieldErrors, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleId = null,Object? vehicle = freezed,Object? isLoading = null,Object? isSubmitting = null,Object? fieldErrors = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vehicleId,  Vehicle? vehicle,  bool isLoading,  bool isSubmitting,  Map<String, String> fieldErrors,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickEntryFormState() when $default != null:
return $default(_that.vehicleId,_that.vehicle,_that.isLoading,_that.isSubmitting,_that.fieldErrors,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vehicleId,  Vehicle? vehicle,  bool isLoading,  bool isSubmitting,  Map<String, String> fieldErrors,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _QuickEntryFormState():
return $default(_that.vehicleId,_that.vehicle,_that.isLoading,_that.isSubmitting,_that.fieldErrors,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vehicleId,  Vehicle? vehicle,  bool isLoading,  bool isSubmitting,  Map<String, String> fieldErrors,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _QuickEntryFormState() when $default != null:
return $default(_that.vehicleId,_that.vehicle,_that.isLoading,_that.isSubmitting,_that.fieldErrors,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _QuickEntryFormState implements QuickEntryFormState {
  const _QuickEntryFormState({this.vehicleId = '', this.vehicle, this.isLoading = true, this.isSubmitting = false, final  Map<String, String> fieldErrors = const {}, this.errorMessage}): _fieldErrors = fieldErrors;
  

@override@JsonKey() final  String vehicleId;
@override final  Vehicle? vehicle;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
 final  Map<String, String> _fieldErrors;
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

@override final  String? errorMessage;

/// Create a copy of QuickEntryFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickEntryFormStateCopyWith<_QuickEntryFormState> get copyWith => __$QuickEntryFormStateCopyWithImpl<_QuickEntryFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickEntryFormState&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,vehicle,isLoading,isSubmitting,const DeepCollectionEquality().hash(_fieldErrors),errorMessage);

@override
String toString() {
  return 'QuickEntryFormState(vehicleId: $vehicleId, vehicle: $vehicle, isLoading: $isLoading, isSubmitting: $isSubmitting, fieldErrors: $fieldErrors, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$QuickEntryFormStateCopyWith<$Res> implements $QuickEntryFormStateCopyWith<$Res> {
  factory _$QuickEntryFormStateCopyWith(_QuickEntryFormState value, $Res Function(_QuickEntryFormState) _then) = __$QuickEntryFormStateCopyWithImpl;
@override @useResult
$Res call({
 String vehicleId, Vehicle? vehicle, bool isLoading, bool isSubmitting, Map<String, String> fieldErrors, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,Object? vehicle = freezed,Object? isLoading = null,Object? isSubmitting = null,Object? fieldErrors = null,Object? errorMessage = freezed,}) {
  return _then(_QuickEntryFormState(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
