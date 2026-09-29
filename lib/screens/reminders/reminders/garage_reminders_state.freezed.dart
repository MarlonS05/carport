// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_reminders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageRemindersState {

 bool get isLoading; List<Reminder> get reminders; String? get errorMessage;
/// Create a copy of GarageRemindersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageRemindersStateCopyWith<GarageRemindersState> get copyWith => _$GarageRemindersStateCopyWithImpl<GarageRemindersState>(this as GarageRemindersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageRemindersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.reminders, reminders)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(reminders),errorMessage);

@override
String toString() {
  return 'GarageRemindersState(isLoading: $isLoading, reminders: $reminders, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageRemindersStateCopyWith<$Res>  {
  factory $GarageRemindersStateCopyWith(GarageRemindersState value, $Res Function(GarageRemindersState) _then) = _$GarageRemindersStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Reminder> reminders, String? errorMessage
});




}
/// @nodoc
class _$GarageRemindersStateCopyWithImpl<$Res>
    implements $GarageRemindersStateCopyWith<$Res> {
  _$GarageRemindersStateCopyWithImpl(this._self, this._then);

  final GarageRemindersState _self;
  final $Res Function(GarageRemindersState) _then;

/// Create a copy of GarageRemindersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? reminders = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageRemindersState].
extension GarageRemindersStatePatterns on GarageRemindersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageRemindersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageRemindersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageRemindersState value)  $default,){
final _that = this;
switch (_that) {
case _GarageRemindersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageRemindersState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageRemindersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<Reminder> reminders,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageRemindersState() when $default != null:
return $default(_that.isLoading,_that.reminders,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<Reminder> reminders,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageRemindersState():
return $default(_that.isLoading,_that.reminders,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<Reminder> reminders,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageRemindersState() when $default != null:
return $default(_that.isLoading,_that.reminders,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageRemindersState implements GarageRemindersState {
  const _GarageRemindersState({this.isLoading = true, final  List<Reminder> reminders = const [], this.errorMessage}): _reminders = reminders;
  

@override@JsonKey() final  bool isLoading;
 final  List<Reminder> _reminders;
@override@JsonKey() List<Reminder> get reminders {
  if (_reminders is EqualUnmodifiableListView) return _reminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminders);
}

@override final  String? errorMessage;

/// Create a copy of GarageRemindersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageRemindersStateCopyWith<_GarageRemindersState> get copyWith => __$GarageRemindersStateCopyWithImpl<_GarageRemindersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageRemindersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._reminders, _reminders)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_reminders),errorMessage);

@override
String toString() {
  return 'GarageRemindersState(isLoading: $isLoading, reminders: $reminders, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageRemindersStateCopyWith<$Res> implements $GarageRemindersStateCopyWith<$Res> {
  factory _$GarageRemindersStateCopyWith(_GarageRemindersState value, $Res Function(_GarageRemindersState) _then) = __$GarageRemindersStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<Reminder> reminders, String? errorMessage
});




}
/// @nodoc
class __$GarageRemindersStateCopyWithImpl<$Res>
    implements _$GarageRemindersStateCopyWith<$Res> {
  __$GarageRemindersStateCopyWithImpl(this._self, this._then);

  final _GarageRemindersState _self;
  final $Res Function(_GarageRemindersState) _then;

/// Create a copy of GarageRemindersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? reminders = null,Object? errorMessage = freezed,}) {
  return _then(_GarageRemindersState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,reminders: null == reminders ? _self._reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
