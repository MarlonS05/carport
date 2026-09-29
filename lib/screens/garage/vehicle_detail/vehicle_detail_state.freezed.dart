// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleDetailState {

 Vehicle? get vehicle; bool get isEditing; bool get isLoading; bool get isSaving; bool get isDeleting; bool get isAuthenticatingDocuments;/// Incremented after successful biometric unlock so the view can open the
/// documents sheet once.
 int get documentsAccessNonce; Map<String, String> get fieldErrors; String? get errorMessage; DistanceUnit get distanceUnit; int get entryCount; int get mpgEntryCount;
/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleDetailStateCopyWith<VehicleDetailState> get copyWith => _$VehicleDetailStateCopyWithImpl<VehicleDetailState>(this as VehicleDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleDetailState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.isAuthenticatingDocuments, isAuthenticatingDocuments) || other.isAuthenticatingDocuments == isAuthenticatingDocuments)&&(identical(other.documentsAccessNonce, documentsAccessNonce) || other.documentsAccessNonce == documentsAccessNonce)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&(identical(other.mpgEntryCount, mpgEntryCount) || other.mpgEntryCount == mpgEntryCount));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle,isEditing,isLoading,isSaving,isDeleting,isAuthenticatingDocuments,documentsAccessNonce,const DeepCollectionEquality().hash(fieldErrors),errorMessage,distanceUnit,entryCount,mpgEntryCount);

@override
String toString() {
  return 'VehicleDetailState(vehicle: $vehicle, isEditing: $isEditing, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isAuthenticatingDocuments: $isAuthenticatingDocuments, documentsAccessNonce: $documentsAccessNonce, fieldErrors: $fieldErrors, errorMessage: $errorMessage, distanceUnit: $distanceUnit, entryCount: $entryCount, mpgEntryCount: $mpgEntryCount)';
}


}

/// @nodoc
abstract mixin class $VehicleDetailStateCopyWith<$Res>  {
  factory $VehicleDetailStateCopyWith(VehicleDetailState value, $Res Function(VehicleDetailState) _then) = _$VehicleDetailStateCopyWithImpl;
@useResult
$Res call({
 Vehicle? vehicle, bool isEditing, bool isLoading, bool isSaving, bool isDeleting, bool isAuthenticatingDocuments, int documentsAccessNonce, Map<String, String> fieldErrors, String? errorMessage, DistanceUnit distanceUnit, int entryCount, int mpgEntryCount
});




}
/// @nodoc
class _$VehicleDetailStateCopyWithImpl<$Res>
    implements $VehicleDetailStateCopyWith<$Res> {
  _$VehicleDetailStateCopyWithImpl(this._self, this._then);

  final VehicleDetailState _self;
  final $Res Function(VehicleDetailState) _then;

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicle = freezed,Object? isEditing = null,Object? isLoading = null,Object? isSaving = null,Object? isDeleting = null,Object? isAuthenticatingDocuments = null,Object? documentsAccessNonce = null,Object? fieldErrors = null,Object? errorMessage = freezed,Object? distanceUnit = null,Object? entryCount = null,Object? mpgEntryCount = null,}) {
  return _then(_self.copyWith(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticatingDocuments: null == isAuthenticatingDocuments ? _self.isAuthenticatingDocuments : isAuthenticatingDocuments // ignore: cast_nullable_to_non_nullable
as bool,documentsAccessNonce: null == documentsAccessNonce ? _self.documentsAccessNonce : documentsAccessNonce // ignore: cast_nullable_to_non_nullable
as int,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,mpgEntryCount: null == mpgEntryCount ? _self.mpgEntryCount : mpgEntryCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleDetailState].
extension VehicleDetailStatePatterns on VehicleDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleDetailState value)  $default,){
final _that = this;
switch (_that) {
case _VehicleDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Vehicle? vehicle,  bool isEditing,  bool isLoading,  bool isSaving,  bool isDeleting,  bool isAuthenticatingDocuments,  int documentsAccessNonce,  Map<String, String> fieldErrors,  String? errorMessage,  DistanceUnit distanceUnit,  int entryCount,  int mpgEntryCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
return $default(_that.vehicle,_that.isEditing,_that.isLoading,_that.isSaving,_that.isDeleting,_that.isAuthenticatingDocuments,_that.documentsAccessNonce,_that.fieldErrors,_that.errorMessage,_that.distanceUnit,_that.entryCount,_that.mpgEntryCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Vehicle? vehicle,  bool isEditing,  bool isLoading,  bool isSaving,  bool isDeleting,  bool isAuthenticatingDocuments,  int documentsAccessNonce,  Map<String, String> fieldErrors,  String? errorMessage,  DistanceUnit distanceUnit,  int entryCount,  int mpgEntryCount)  $default,) {final _that = this;
switch (_that) {
case _VehicleDetailState():
return $default(_that.vehicle,_that.isEditing,_that.isLoading,_that.isSaving,_that.isDeleting,_that.isAuthenticatingDocuments,_that.documentsAccessNonce,_that.fieldErrors,_that.errorMessage,_that.distanceUnit,_that.entryCount,_that.mpgEntryCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Vehicle? vehicle,  bool isEditing,  bool isLoading,  bool isSaving,  bool isDeleting,  bool isAuthenticatingDocuments,  int documentsAccessNonce,  Map<String, String> fieldErrors,  String? errorMessage,  DistanceUnit distanceUnit,  int entryCount,  int mpgEntryCount)?  $default,) {final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
return $default(_that.vehicle,_that.isEditing,_that.isLoading,_that.isSaving,_that.isDeleting,_that.isAuthenticatingDocuments,_that.documentsAccessNonce,_that.fieldErrors,_that.errorMessage,_that.distanceUnit,_that.entryCount,_that.mpgEntryCount);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleDetailState implements VehicleDetailState {
  const _VehicleDetailState({this.vehicle, this.isEditing = false, this.isLoading = true, this.isSaving = false, this.isDeleting = false, this.isAuthenticatingDocuments = false, this.documentsAccessNonce = 0, final  Map<String, String> fieldErrors = const {}, this.errorMessage, this.distanceUnit = DistanceUnit.miles, this.entryCount = 0, this.mpgEntryCount = 0}): _fieldErrors = fieldErrors;
  

@override final  Vehicle? vehicle;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isDeleting;
@override@JsonKey() final  bool isAuthenticatingDocuments;
/// Incremented after successful biometric unlock so the view can open the
/// documents sheet once.
@override@JsonKey() final  int documentsAccessNonce;
 final  Map<String, String> _fieldErrors;
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

@override final  String? errorMessage;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override@JsonKey() final  int entryCount;
@override@JsonKey() final  int mpgEntryCount;

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleDetailStateCopyWith<_VehicleDetailState> get copyWith => __$VehicleDetailStateCopyWithImpl<_VehicleDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleDetailState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.isAuthenticatingDocuments, isAuthenticatingDocuments) || other.isAuthenticatingDocuments == isAuthenticatingDocuments)&&(identical(other.documentsAccessNonce, documentsAccessNonce) || other.documentsAccessNonce == documentsAccessNonce)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&(identical(other.mpgEntryCount, mpgEntryCount) || other.mpgEntryCount == mpgEntryCount));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle,isEditing,isLoading,isSaving,isDeleting,isAuthenticatingDocuments,documentsAccessNonce,const DeepCollectionEquality().hash(_fieldErrors),errorMessage,distanceUnit,entryCount,mpgEntryCount);

@override
String toString() {
  return 'VehicleDetailState(vehicle: $vehicle, isEditing: $isEditing, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, isAuthenticatingDocuments: $isAuthenticatingDocuments, documentsAccessNonce: $documentsAccessNonce, fieldErrors: $fieldErrors, errorMessage: $errorMessage, distanceUnit: $distanceUnit, entryCount: $entryCount, mpgEntryCount: $mpgEntryCount)';
}


}

/// @nodoc
abstract mixin class _$VehicleDetailStateCopyWith<$Res> implements $VehicleDetailStateCopyWith<$Res> {
  factory _$VehicleDetailStateCopyWith(_VehicleDetailState value, $Res Function(_VehicleDetailState) _then) = __$VehicleDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Vehicle? vehicle, bool isEditing, bool isLoading, bool isSaving, bool isDeleting, bool isAuthenticatingDocuments, int documentsAccessNonce, Map<String, String> fieldErrors, String? errorMessage, DistanceUnit distanceUnit, int entryCount, int mpgEntryCount
});




}
/// @nodoc
class __$VehicleDetailStateCopyWithImpl<$Res>
    implements _$VehicleDetailStateCopyWith<$Res> {
  __$VehicleDetailStateCopyWithImpl(this._self, this._then);

  final _VehicleDetailState _self;
  final $Res Function(_VehicleDetailState) _then;

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicle = freezed,Object? isEditing = null,Object? isLoading = null,Object? isSaving = null,Object? isDeleting = null,Object? isAuthenticatingDocuments = null,Object? documentsAccessNonce = null,Object? fieldErrors = null,Object? errorMessage = freezed,Object? distanceUnit = null,Object? entryCount = null,Object? mpgEntryCount = null,}) {
  return _then(_VehicleDetailState(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticatingDocuments: null == isAuthenticatingDocuments ? _self.isAuthenticatingDocuments : isAuthenticatingDocuments // ignore: cast_nullable_to_non_nullable
as bool,documentsAccessNonce: null == documentsAccessNonce ? _self.documentsAccessNonce : documentsAccessNonce // ignore: cast_nullable_to_non_nullable
as int,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,mpgEntryCount: null == mpgEntryCount ? _self.mpgEntryCount : mpgEntryCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
