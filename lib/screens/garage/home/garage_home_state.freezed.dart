// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageHomeState {

 int get vehicleCount; int get entryCount; bool get isLoading; String? get errorMessage;
/// Create a copy of GarageHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageHomeStateCopyWith<GarageHomeState> get copyWith => _$GarageHomeStateCopyWithImpl<GarageHomeState>(this as GarageHomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageHomeState&&(identical(other.vehicleCount, vehicleCount) || other.vehicleCount == vehicleCount)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleCount,entryCount,isLoading,errorMessage);

@override
String toString() {
  return 'GarageHomeState(vehicleCount: $vehicleCount, entryCount: $entryCount, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageHomeStateCopyWith<$Res>  {
  factory $GarageHomeStateCopyWith(GarageHomeState value, $Res Function(GarageHomeState) _then) = _$GarageHomeStateCopyWithImpl;
@useResult
$Res call({
 int vehicleCount, int entryCount, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$GarageHomeStateCopyWithImpl<$Res>
    implements $GarageHomeStateCopyWith<$Res> {
  _$GarageHomeStateCopyWithImpl(this._self, this._then);

  final GarageHomeState _self;
  final $Res Function(GarageHomeState) _then;

/// Create a copy of GarageHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleCount = null,Object? entryCount = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicleCount: null == vehicleCount ? _self.vehicleCount : vehicleCount // ignore: cast_nullable_to_non_nullable
as int,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageHomeState].
extension GarageHomeStatePatterns on GarageHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageHomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageHomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageHomeState value)  $default,){
final _that = this;
switch (_that) {
case _GarageHomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageHomeState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageHomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int vehicleCount,  int entryCount,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageHomeState() when $default != null:
return $default(_that.vehicleCount,_that.entryCount,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int vehicleCount,  int entryCount,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageHomeState():
return $default(_that.vehicleCount,_that.entryCount,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int vehicleCount,  int entryCount,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageHomeState() when $default != null:
return $default(_that.vehicleCount,_that.entryCount,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageHomeState implements GarageHomeState {
  const _GarageHomeState({this.vehicleCount = 0, this.entryCount = 0, this.isLoading = false, this.errorMessage});
  

@override@JsonKey() final  int vehicleCount;
@override@JsonKey() final  int entryCount;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of GarageHomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageHomeStateCopyWith<_GarageHomeState> get copyWith => __$GarageHomeStateCopyWithImpl<_GarageHomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageHomeState&&(identical(other.vehicleCount, vehicleCount) || other.vehicleCount == vehicleCount)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleCount,entryCount,isLoading,errorMessage);

@override
String toString() {
  return 'GarageHomeState(vehicleCount: $vehicleCount, entryCount: $entryCount, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageHomeStateCopyWith<$Res> implements $GarageHomeStateCopyWith<$Res> {
  factory _$GarageHomeStateCopyWith(_GarageHomeState value, $Res Function(_GarageHomeState) _then) = __$GarageHomeStateCopyWithImpl;
@override @useResult
$Res call({
 int vehicleCount, int entryCount, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$GarageHomeStateCopyWithImpl<$Res>
    implements _$GarageHomeStateCopyWith<$Res> {
  __$GarageHomeStateCopyWithImpl(this._self, this._then);

  final _GarageHomeState _self;
  final $Res Function(_GarageHomeState) _then;

/// Create a copy of GarageHomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleCount = null,Object? entryCount = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_GarageHomeState(
vehicleCount: null == vehicleCount ? _self.vehicleCount : vehicleCount // ignore: cast_nullable_to_non_nullable
as int,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
