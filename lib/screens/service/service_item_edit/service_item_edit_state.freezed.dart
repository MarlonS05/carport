// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_item_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceItemEditState {

 ServiceItem? get serviceItem; Vehicle? get vehicle; bool get isLoading; bool get isSaving; bool get isDeleting; Map<String, String> get fieldErrors; String? get errorMessage;
/// Create a copy of ServiceItemEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceItemEditStateCopyWith<ServiceItemEditState> get copyWith => _$ServiceItemEditStateCopyWithImpl<ServiceItemEditState>(this as ServiceItemEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceItemEditState&&(identical(other.serviceItem, serviceItem) || other.serviceItem == serviceItem)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,serviceItem,vehicle,isLoading,isSaving,isDeleting,const DeepCollectionEquality().hash(fieldErrors),errorMessage);

@override
String toString() {
  return 'ServiceItemEditState(serviceItem: $serviceItem, vehicle: $vehicle, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, fieldErrors: $fieldErrors, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ServiceItemEditStateCopyWith<$Res>  {
  factory $ServiceItemEditStateCopyWith(ServiceItemEditState value, $Res Function(ServiceItemEditState) _then) = _$ServiceItemEditStateCopyWithImpl;
@useResult
$Res call({
 ServiceItem? serviceItem, Vehicle? vehicle, bool isLoading, bool isSaving, bool isDeleting, Map<String, String> fieldErrors, String? errorMessage
});




}
/// @nodoc
class _$ServiceItemEditStateCopyWithImpl<$Res>
    implements $ServiceItemEditStateCopyWith<$Res> {
  _$ServiceItemEditStateCopyWithImpl(this._self, this._then);

  final ServiceItemEditState _self;
  final $Res Function(ServiceItemEditState) _then;

/// Create a copy of ServiceItemEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceItem = freezed,Object? vehicle = freezed,Object? isLoading = null,Object? isSaving = null,Object? isDeleting = null,Object? fieldErrors = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
serviceItem: freezed == serviceItem ? _self.serviceItem : serviceItem // ignore: cast_nullable_to_non_nullable
as ServiceItem?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceItemEditState].
extension ServiceItemEditStatePatterns on ServiceItemEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceItemEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceItemEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceItemEditState value)  $default,){
final _that = this;
switch (_that) {
case _ServiceItemEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceItemEditState value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceItemEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ServiceItem? serviceItem,  Vehicle? vehicle,  bool isLoading,  bool isSaving,  bool isDeleting,  Map<String, String> fieldErrors,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceItemEditState() when $default != null:
return $default(_that.serviceItem,_that.vehicle,_that.isLoading,_that.isSaving,_that.isDeleting,_that.fieldErrors,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ServiceItem? serviceItem,  Vehicle? vehicle,  bool isLoading,  bool isSaving,  bool isDeleting,  Map<String, String> fieldErrors,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ServiceItemEditState():
return $default(_that.serviceItem,_that.vehicle,_that.isLoading,_that.isSaving,_that.isDeleting,_that.fieldErrors,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ServiceItem? serviceItem,  Vehicle? vehicle,  bool isLoading,  bool isSaving,  bool isDeleting,  Map<String, String> fieldErrors,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ServiceItemEditState() when $default != null:
return $default(_that.serviceItem,_that.vehicle,_that.isLoading,_that.isSaving,_that.isDeleting,_that.fieldErrors,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceItemEditState implements ServiceItemEditState {
  const _ServiceItemEditState({this.serviceItem, this.vehicle, this.isLoading = true, this.isSaving = false, this.isDeleting = false, final  Map<String, String> fieldErrors = const {}, this.errorMessage}): _fieldErrors = fieldErrors;
  

@override final  ServiceItem? serviceItem;
@override final  Vehicle? vehicle;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isDeleting;
 final  Map<String, String> _fieldErrors;
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

@override final  String? errorMessage;

/// Create a copy of ServiceItemEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceItemEditStateCopyWith<_ServiceItemEditState> get copyWith => __$ServiceItemEditStateCopyWithImpl<_ServiceItemEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceItemEditState&&(identical(other.serviceItem, serviceItem) || other.serviceItem == serviceItem)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,serviceItem,vehicle,isLoading,isSaving,isDeleting,const DeepCollectionEquality().hash(_fieldErrors),errorMessage);

@override
String toString() {
  return 'ServiceItemEditState(serviceItem: $serviceItem, vehicle: $vehicle, isLoading: $isLoading, isSaving: $isSaving, isDeleting: $isDeleting, fieldErrors: $fieldErrors, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ServiceItemEditStateCopyWith<$Res> implements $ServiceItemEditStateCopyWith<$Res> {
  factory _$ServiceItemEditStateCopyWith(_ServiceItemEditState value, $Res Function(_ServiceItemEditState) _then) = __$ServiceItemEditStateCopyWithImpl;
@override @useResult
$Res call({
 ServiceItem? serviceItem, Vehicle? vehicle, bool isLoading, bool isSaving, bool isDeleting, Map<String, String> fieldErrors, String? errorMessage
});




}
/// @nodoc
class __$ServiceItemEditStateCopyWithImpl<$Res>
    implements _$ServiceItemEditStateCopyWith<$Res> {
  __$ServiceItemEditStateCopyWithImpl(this._self, this._then);

  final _ServiceItemEditState _self;
  final $Res Function(_ServiceItemEditState) _then;

/// Create a copy of ServiceItemEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceItem = freezed,Object? vehicle = freezed,Object? isLoading = null,Object? isSaving = null,Object? isDeleting = null,Object? fieldErrors = null,Object? errorMessage = freezed,}) {
  return _then(_ServiceItemEditState(
serviceItem: freezed == serviceItem ? _self.serviceItem : serviceItem // ignore: cast_nullable_to_non_nullable
as ServiceItem?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
