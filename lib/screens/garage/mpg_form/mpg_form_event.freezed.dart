// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpg_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MpgFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MpgFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MpgFormEvent()';
}


}

/// @nodoc
class $MpgFormEventCopyWith<$Res>  {
$MpgFormEventCopyWith(MpgFormEvent _, $Res Function(MpgFormEvent) __);
}


/// Adds pattern-matching-related methods to [MpgFormEvent].
extension MpgFormEventPatterns on MpgFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _LitersChanged value)?  litersChanged,TResult Function( _DistanceChanged value)?  distanceChanged,TResult Function( _Submitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _LitersChanged() when litersChanged != null:
return litersChanged(_that);case _DistanceChanged() when distanceChanged != null:
return distanceChanged(_that);case _Submitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _LitersChanged value)  litersChanged,required TResult Function( _DistanceChanged value)  distanceChanged,required TResult Function( _Submitted value)  submitted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _LitersChanged():
return litersChanged(_that);case _DistanceChanged():
return distanceChanged(_that);case _Submitted():
return submitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _LitersChanged value)?  litersChanged,TResult? Function( _DistanceChanged value)?  distanceChanged,TResult? Function( _Submitted value)?  submitted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _LitersChanged() when litersChanged != null:
return litersChanged(_that);case _DistanceChanged() when distanceChanged != null:
return distanceChanged(_that);case _Submitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId)?  started,TResult Function()?  backTapped,TResult Function( String value)?  litersChanged,TResult Function( String value)?  distanceChanged,TResult Function()?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _LitersChanged() when litersChanged != null:
return litersChanged(_that.value);case _DistanceChanged() when distanceChanged != null:
return distanceChanged(_that.value);case _Submitted() when submitted != null:
return submitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId)  started,required TResult Function()  backTapped,required TResult Function( String value)  litersChanged,required TResult Function( String value)  distanceChanged,required TResult Function()  submitted,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId);case _BackTapped():
return backTapped();case _LitersChanged():
return litersChanged(_that.value);case _DistanceChanged():
return distanceChanged(_that.value);case _Submitted():
return submitted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId)?  started,TResult? Function()?  backTapped,TResult? Function( String value)?  litersChanged,TResult? Function( String value)?  distanceChanged,TResult? Function()?  submitted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _LitersChanged() when litersChanged != null:
return litersChanged(_that.value);case _DistanceChanged() when distanceChanged != null:
return distanceChanged(_that.value);case _Submitted() when submitted != null:
return submitted();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements MpgFormEvent {
  const _Started({required this.vehicleId});
  

 final  String vehicleId;

/// Create a copy of MpgFormEvent
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
  return 'MpgFormEvent.started(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $MpgFormEventCopyWith<$Res> {
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

/// Create a copy of MpgFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements MpgFormEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MpgFormEvent.backTapped()';
}


}




/// @nodoc


class _LitersChanged implements MpgFormEvent {
  const _LitersChanged(this.value);
  

 final  String value;

/// Create a copy of MpgFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LitersChangedCopyWith<_LitersChanged> get copyWith => __$LitersChangedCopyWithImpl<_LitersChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LitersChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MpgFormEvent.litersChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$LitersChangedCopyWith<$Res> implements $MpgFormEventCopyWith<$Res> {
  factory _$LitersChangedCopyWith(_LitersChanged value, $Res Function(_LitersChanged) _then) = __$LitersChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$LitersChangedCopyWithImpl<$Res>
    implements _$LitersChangedCopyWith<$Res> {
  __$LitersChangedCopyWithImpl(this._self, this._then);

  final _LitersChanged _self;
  final $Res Function(_LitersChanged) _then;

/// Create a copy of MpgFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_LitersChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DistanceChanged implements MpgFormEvent {
  const _DistanceChanged(this.value);
  

 final  String value;

/// Create a copy of MpgFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistanceChangedCopyWith<_DistanceChanged> get copyWith => __$DistanceChangedCopyWithImpl<_DistanceChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistanceChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MpgFormEvent.distanceChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$DistanceChangedCopyWith<$Res> implements $MpgFormEventCopyWith<$Res> {
  factory _$DistanceChangedCopyWith(_DistanceChanged value, $Res Function(_DistanceChanged) _then) = __$DistanceChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$DistanceChangedCopyWithImpl<$Res>
    implements _$DistanceChangedCopyWith<$Res> {
  __$DistanceChangedCopyWithImpl(this._self, this._then);

  final _DistanceChanged _self;
  final $Res Function(_DistanceChanged) _then;

/// Create a copy of MpgFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_DistanceChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submitted implements MpgFormEvent {
  const _Submitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MpgFormEvent.submitted()';
}


}




// dart format on
