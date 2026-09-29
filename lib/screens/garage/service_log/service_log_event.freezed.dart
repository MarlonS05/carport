// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_log_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceLogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceLogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceLogEvent()';
}


}

/// @nodoc
class $ServiceLogEventCopyWith<$Res>  {
$ServiceLogEventCopyWith(ServiceLogEvent _, $Res Function(ServiceLogEvent) __);
}


/// Adds pattern-matching-related methods to [ServiceLogEvent].
extension ServiceLogEventPatterns on ServiceLogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _EntryEditTapped value)?  entryEditTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _EntryEditTapped() when entryEditTapped != null:
return entryEditTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _EntryEditTapped value)  entryEditTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _EntryEditTapped():
return entryEditTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _EntryEditTapped value)?  entryEditTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _EntryEditTapped() when entryEditTapped != null:
return entryEditTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId)?  started,TResult Function()?  backTapped,TResult Function( String serviceItemId)?  entryEditTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _EntryEditTapped() when entryEditTapped != null:
return entryEditTapped(_that.serviceItemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId)  started,required TResult Function()  backTapped,required TResult Function( String serviceItemId)  entryEditTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId);case _BackTapped():
return backTapped();case _EntryEditTapped():
return entryEditTapped(_that.serviceItemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId)?  started,TResult? Function()?  backTapped,TResult? Function( String serviceItemId)?  entryEditTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _EntryEditTapped() when entryEditTapped != null:
return entryEditTapped(_that.serviceItemId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ServiceLogEvent {
  const _Started({required this.vehicleId});
  

 final  String vehicleId;

/// Create a copy of ServiceLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'ServiceLogEvent.started(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ServiceLogEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String vehicleId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ServiceLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements ServiceLogEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceLogEvent.backTapped()';
}


}




/// @nodoc


class _EntryEditTapped implements ServiceLogEvent {
  const _EntryEditTapped({required this.serviceItemId});
  

 final  String serviceItemId;

/// Create a copy of ServiceLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryEditTappedCopyWith<_EntryEditTapped> get copyWith => __$EntryEditTappedCopyWithImpl<_EntryEditTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryEditTapped&&(identical(other.serviceItemId, serviceItemId) || other.serviceItemId == serviceItemId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceItemId);

@override
String toString() {
  return 'ServiceLogEvent.entryEditTapped(serviceItemId: $serviceItemId)';
}


}

/// @nodoc
abstract mixin class _$EntryEditTappedCopyWith<$Res> implements $ServiceLogEventCopyWith<$Res> {
  factory _$EntryEditTappedCopyWith(_EntryEditTapped value, $Res Function(_EntryEditTapped) _then) = __$EntryEditTappedCopyWithImpl;
@useResult
$Res call({
 String serviceItemId
});




}
/// @nodoc
class __$EntryEditTappedCopyWithImpl<$Res>
    implements _$EntryEditTappedCopyWith<$Res> {
  __$EntryEditTappedCopyWithImpl(this._self, this._then);

  final _EntryEditTapped _self;
  final $Res Function(_EntryEditTapped) _then;

/// Create a copy of ServiceLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceItemId = null,}) {
  return _then(_EntryEditTapped(
serviceItemId: null == serviceItemId ? _self.serviceItemId : serviceItemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
