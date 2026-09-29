// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_log_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceLogState {

 Vehicle? get vehicle; List<ServiceItem> get entries; bool get isLoading; String? get errorMessage;
/// Create a copy of ServiceLogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceLogStateCopyWith<ServiceLogState> get copyWith => _$ServiceLogStateCopyWithImpl<ServiceLogState>(this as ServiceLogState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceLogState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle,const DeepCollectionEquality().hash(entries),isLoading,errorMessage);

@override
String toString() {
  return 'ServiceLogState(vehicle: $vehicle, entries: $entries, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ServiceLogStateCopyWith<$Res>  {
  factory $ServiceLogStateCopyWith(ServiceLogState value, $Res Function(ServiceLogState) _then) = _$ServiceLogStateCopyWithImpl;
@useResult
$Res call({
 Vehicle? vehicle, List<ServiceItem> entries, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$ServiceLogStateCopyWithImpl<$Res>
    implements $ServiceLogStateCopyWith<$Res> {
  _$ServiceLogStateCopyWithImpl(this._self, this._then);

  final ServiceLogState _self;
  final $Res Function(ServiceLogState) _then;

/// Create a copy of ServiceLogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicle = freezed,Object? entries = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ServiceItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceLogState].
extension ServiceLogStatePatterns on ServiceLogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceLogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceLogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceLogState value)  $default,){
final _that = this;
switch (_that) {
case _ServiceLogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceLogState value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceLogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Vehicle? vehicle,  List<ServiceItem> entries,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceLogState() when $default != null:
return $default(_that.vehicle,_that.entries,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Vehicle? vehicle,  List<ServiceItem> entries,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ServiceLogState():
return $default(_that.vehicle,_that.entries,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Vehicle? vehicle,  List<ServiceItem> entries,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ServiceLogState() when $default != null:
return $default(_that.vehicle,_that.entries,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceLogState implements ServiceLogState {
  const _ServiceLogState({this.vehicle, final  List<ServiceItem> entries = const [], this.isLoading = true, this.errorMessage}): _entries = entries;
  

@override final  Vehicle? vehicle;
 final  List<ServiceItem> _entries;
@override@JsonKey() List<ServiceItem> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of ServiceLogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceLogStateCopyWith<_ServiceLogState> get copyWith => __$ServiceLogStateCopyWithImpl<_ServiceLogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceLogState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle,const DeepCollectionEquality().hash(_entries),isLoading,errorMessage);

@override
String toString() {
  return 'ServiceLogState(vehicle: $vehicle, entries: $entries, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ServiceLogStateCopyWith<$Res> implements $ServiceLogStateCopyWith<$Res> {
  factory _$ServiceLogStateCopyWith(_ServiceLogState value, $Res Function(_ServiceLogState) _then) = __$ServiceLogStateCopyWithImpl;
@override @useResult
$Res call({
 Vehicle? vehicle, List<ServiceItem> entries, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$ServiceLogStateCopyWithImpl<$Res>
    implements _$ServiceLogStateCopyWith<$Res> {
  __$ServiceLogStateCopyWithImpl(this._self, this._then);

  final _ServiceLogState _self;
  final $Res Function(_ServiceLogState) _then;

/// Create a copy of ServiceLogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicle = freezed,Object? entries = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_ServiceLogState(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ServiceItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
