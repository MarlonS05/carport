// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_web_access_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsWebAccessState {

 bool get isLoading; bool get isConnected; List<WebPortalUser> get users; Set<int> get savingUserIds; String? get errorMessage;
/// Create a copy of GarageSettingsWebAccessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsWebAccessStateCopyWith<GarageSettingsWebAccessState> get copyWith => _$GarageSettingsWebAccessStateCopyWithImpl<GarageSettingsWebAccessState>(this as GarageSettingsWebAccessState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsWebAccessState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&const DeepCollectionEquality().equals(other.users, users)&&const DeepCollectionEquality().equals(other.savingUserIds, savingUserIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isConnected,const DeepCollectionEquality().hash(users),const DeepCollectionEquality().hash(savingUserIds),errorMessage);

@override
String toString() {
  return 'GarageSettingsWebAccessState(isLoading: $isLoading, isConnected: $isConnected, users: $users, savingUserIds: $savingUserIds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsWebAccessStateCopyWith<$Res>  {
  factory $GarageSettingsWebAccessStateCopyWith(GarageSettingsWebAccessState value, $Res Function(GarageSettingsWebAccessState) _then) = _$GarageSettingsWebAccessStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isConnected, List<WebPortalUser> users, Set<int> savingUserIds, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsWebAccessStateCopyWithImpl<$Res>
    implements $GarageSettingsWebAccessStateCopyWith<$Res> {
  _$GarageSettingsWebAccessStateCopyWithImpl(this._self, this._then);

  final GarageSettingsWebAccessState _self;
  final $Res Function(GarageSettingsWebAccessState) _then;

/// Create a copy of GarageSettingsWebAccessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isConnected = null,Object? users = null,Object? savingUserIds = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<WebPortalUser>,savingUserIds: null == savingUserIds ? _self.savingUserIds : savingUserIds // ignore: cast_nullable_to_non_nullable
as Set<int>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsWebAccessState].
extension GarageSettingsWebAccessStatePatterns on GarageSettingsWebAccessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsWebAccessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsWebAccessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsWebAccessState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsWebAccessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsWebAccessState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsWebAccessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isConnected,  List<WebPortalUser> users,  Set<int> savingUserIds,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsWebAccessState() when $default != null:
return $default(_that.isLoading,_that.isConnected,_that.users,_that.savingUserIds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isConnected,  List<WebPortalUser> users,  Set<int> savingUserIds,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsWebAccessState():
return $default(_that.isLoading,_that.isConnected,_that.users,_that.savingUserIds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isConnected,  List<WebPortalUser> users,  Set<int> savingUserIds,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsWebAccessState() when $default != null:
return $default(_that.isLoading,_that.isConnected,_that.users,_that.savingUserIds,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsWebAccessState implements GarageSettingsWebAccessState {
  const _GarageSettingsWebAccessState({this.isLoading = true, this.isConnected = false, final  List<WebPortalUser> users = const <WebPortalUser>[], final  Set<int> savingUserIds = const <int>{}, this.errorMessage}): _users = users,_savingUserIds = savingUserIds;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isConnected;
 final  List<WebPortalUser> _users;
@override@JsonKey() List<WebPortalUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  Set<int> _savingUserIds;
@override@JsonKey() Set<int> get savingUserIds {
  if (_savingUserIds is EqualUnmodifiableSetView) return _savingUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_savingUserIds);
}

@override final  String? errorMessage;

/// Create a copy of GarageSettingsWebAccessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsWebAccessStateCopyWith<_GarageSettingsWebAccessState> get copyWith => __$GarageSettingsWebAccessStateCopyWithImpl<_GarageSettingsWebAccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsWebAccessState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._savingUserIds, _savingUserIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isConnected,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_savingUserIds),errorMessage);

@override
String toString() {
  return 'GarageSettingsWebAccessState(isLoading: $isLoading, isConnected: $isConnected, users: $users, savingUserIds: $savingUserIds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsWebAccessStateCopyWith<$Res> implements $GarageSettingsWebAccessStateCopyWith<$Res> {
  factory _$GarageSettingsWebAccessStateCopyWith(_GarageSettingsWebAccessState value, $Res Function(_GarageSettingsWebAccessState) _then) = __$GarageSettingsWebAccessStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isConnected, List<WebPortalUser> users, Set<int> savingUserIds, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsWebAccessStateCopyWithImpl<$Res>
    implements _$GarageSettingsWebAccessStateCopyWith<$Res> {
  __$GarageSettingsWebAccessStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsWebAccessState _self;
  final $Res Function(_GarageSettingsWebAccessState) _then;

/// Create a copy of GarageSettingsWebAccessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isConnected = null,Object? users = null,Object? savingUserIds = null,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsWebAccessState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<WebPortalUser>,savingUserIds: null == savingUserIds ? _self._savingUserIds : savingUserIds // ignore: cast_nullable_to_non_nullable
as Set<int>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
