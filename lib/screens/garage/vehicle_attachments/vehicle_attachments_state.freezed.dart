// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_attachments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleAttachmentsState {

 bool get isLoading; bool get isAttaching; bool get isDeleting; Vehicle? get vehicle; List<VehicleAttachment> get attachments; String? get errorMessage;
/// Create a copy of VehicleAttachmentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleAttachmentsStateCopyWith<VehicleAttachmentsState> get copyWith => _$VehicleAttachmentsStateCopyWithImpl<VehicleAttachmentsState>(this as VehicleAttachmentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleAttachmentsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isAttaching, isAttaching) || other.isAttaching == isAttaching)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isAttaching,isDeleting,vehicle,const DeepCollectionEquality().hash(attachments),errorMessage);

@override
String toString() {
  return 'VehicleAttachmentsState(isLoading: $isLoading, isAttaching: $isAttaching, isDeleting: $isDeleting, vehicle: $vehicle, attachments: $attachments, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VehicleAttachmentsStateCopyWith<$Res>  {
  factory $VehicleAttachmentsStateCopyWith(VehicleAttachmentsState value, $Res Function(VehicleAttachmentsState) _then) = _$VehicleAttachmentsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isAttaching, bool isDeleting, Vehicle? vehicle, List<VehicleAttachment> attachments, String? errorMessage
});




}
/// @nodoc
class _$VehicleAttachmentsStateCopyWithImpl<$Res>
    implements $VehicleAttachmentsStateCopyWith<$Res> {
  _$VehicleAttachmentsStateCopyWithImpl(this._self, this._then);

  final VehicleAttachmentsState _self;
  final $Res Function(VehicleAttachmentsState) _then;

/// Create a copy of VehicleAttachmentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isAttaching = null,Object? isDeleting = null,Object? vehicle = freezed,Object? attachments = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isAttaching: null == isAttaching ? _self.isAttaching : isAttaching // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<VehicleAttachment>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleAttachmentsState].
extension VehicleAttachmentsStatePatterns on VehicleAttachmentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleAttachmentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleAttachmentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleAttachmentsState value)  $default,){
final _that = this;
switch (_that) {
case _VehicleAttachmentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleAttachmentsState value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleAttachmentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isAttaching,  bool isDeleting,  Vehicle? vehicle,  List<VehicleAttachment> attachments,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleAttachmentsState() when $default != null:
return $default(_that.isLoading,_that.isAttaching,_that.isDeleting,_that.vehicle,_that.attachments,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isAttaching,  bool isDeleting,  Vehicle? vehicle,  List<VehicleAttachment> attachments,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VehicleAttachmentsState():
return $default(_that.isLoading,_that.isAttaching,_that.isDeleting,_that.vehicle,_that.attachments,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isAttaching,  bool isDeleting,  Vehicle? vehicle,  List<VehicleAttachment> attachments,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VehicleAttachmentsState() when $default != null:
return $default(_that.isLoading,_that.isAttaching,_that.isDeleting,_that.vehicle,_that.attachments,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleAttachmentsState implements VehicleAttachmentsState {
  const _VehicleAttachmentsState({this.isLoading = true, this.isAttaching = false, this.isDeleting = false, this.vehicle, final  List<VehicleAttachment> attachments = const [], this.errorMessage}): _attachments = attachments;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isAttaching;
@override@JsonKey() final  bool isDeleting;
@override final  Vehicle? vehicle;
 final  List<VehicleAttachment> _attachments;
@override@JsonKey() List<VehicleAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  String? errorMessage;

/// Create a copy of VehicleAttachmentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleAttachmentsStateCopyWith<_VehicleAttachmentsState> get copyWith => __$VehicleAttachmentsStateCopyWithImpl<_VehicleAttachmentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleAttachmentsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isAttaching, isAttaching) || other.isAttaching == isAttaching)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isAttaching,isDeleting,vehicle,const DeepCollectionEquality().hash(_attachments),errorMessage);

@override
String toString() {
  return 'VehicleAttachmentsState(isLoading: $isLoading, isAttaching: $isAttaching, isDeleting: $isDeleting, vehicle: $vehicle, attachments: $attachments, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VehicleAttachmentsStateCopyWith<$Res> implements $VehicleAttachmentsStateCopyWith<$Res> {
  factory _$VehicleAttachmentsStateCopyWith(_VehicleAttachmentsState value, $Res Function(_VehicleAttachmentsState) _then) = __$VehicleAttachmentsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isAttaching, bool isDeleting, Vehicle? vehicle, List<VehicleAttachment> attachments, String? errorMessage
});




}
/// @nodoc
class __$VehicleAttachmentsStateCopyWithImpl<$Res>
    implements _$VehicleAttachmentsStateCopyWith<$Res> {
  __$VehicleAttachmentsStateCopyWithImpl(this._self, this._then);

  final _VehicleAttachmentsState _self;
  final $Res Function(_VehicleAttachmentsState) _then;

/// Create a copy of VehicleAttachmentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isAttaching = null,Object? isDeleting = null,Object? vehicle = freezed,Object? attachments = null,Object? errorMessage = freezed,}) {
  return _then(_VehicleAttachmentsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isAttaching: null == isAttaching ? _self.isAttaching : isAttaching // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<VehicleAttachment>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
