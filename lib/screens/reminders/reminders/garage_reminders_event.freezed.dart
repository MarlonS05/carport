// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_reminders_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageRemindersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageRemindersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageRemindersEvent()';
}


}

/// @nodoc
class $GarageRemindersEventCopyWith<$Res>  {
$GarageRemindersEventCopyWith(GarageRemindersEvent _, $Res Function(GarageRemindersEvent) __);
}


/// Adds pattern-matching-related methods to [GarageRemindersEvent].
extension GarageRemindersEventPatterns on GarageRemindersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refreshed value)?  refreshed,TResult Function( _BackTapped value)?  backTapped,TResult Function( _AddTapped value)?  addTapped,TResult Function( _EditTapped value)?  editTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _AddTapped() when addTapped != null:
return addTapped(_that);case _EditTapped() when editTapped != null:
return editTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refreshed value)  refreshed,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _AddTapped value)  addTapped,required TResult Function( _EditTapped value)  editTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refreshed():
return refreshed(_that);case _BackTapped():
return backTapped(_that);case _AddTapped():
return addTapped(_that);case _EditTapped():
return editTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refreshed value)?  refreshed,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _AddTapped value)?  addTapped,TResult? Function( _EditTapped value)?  editTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _AddTapped() when addTapped != null:
return addTapped(_that);case _EditTapped() when editTapped != null:
return editTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function()?  backTapped,TResult Function()?  addTapped,TResult Function( String reminderId)?  editTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _BackTapped() when backTapped != null:
return backTapped();case _AddTapped() when addTapped != null:
return addTapped();case _EditTapped() when editTapped != null:
return editTapped(_that.reminderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function()  backTapped,required TResult Function()  addTapped,required TResult Function( String reminderId)  editTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Refreshed():
return refreshed();case _BackTapped():
return backTapped();case _AddTapped():
return addTapped();case _EditTapped():
return editTapped(_that.reminderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function()?  backTapped,TResult? Function()?  addTapped,TResult? Function( String reminderId)?  editTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _BackTapped() when backTapped != null:
return backTapped();case _AddTapped() when addTapped != null:
return addTapped();case _EditTapped() when editTapped != null:
return editTapped(_that.reminderId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageRemindersEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageRemindersEvent.started()';
}


}




/// @nodoc


class _Refreshed implements GarageRemindersEvent {
  const _Refreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageRemindersEvent.refreshed()';
}


}




/// @nodoc


class _BackTapped implements GarageRemindersEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageRemindersEvent.backTapped()';
}


}




/// @nodoc


class _AddTapped implements GarageRemindersEvent {
  const _AddTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageRemindersEvent.addTapped()';
}


}




/// @nodoc


class _EditTapped implements GarageRemindersEvent {
  const _EditTapped({required this.reminderId});
  

 final  String reminderId;

/// Create a copy of GarageRemindersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditTappedCopyWith<_EditTapped> get copyWith => __$EditTappedCopyWithImpl<_EditTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditTapped&&(identical(other.reminderId, reminderId) || other.reminderId == reminderId));
}


@override
int get hashCode => Object.hash(runtimeType,reminderId);

@override
String toString() {
  return 'GarageRemindersEvent.editTapped(reminderId: $reminderId)';
}


}

/// @nodoc
abstract mixin class _$EditTappedCopyWith<$Res> implements $GarageRemindersEventCopyWith<$Res> {
  factory _$EditTappedCopyWith(_EditTapped value, $Res Function(_EditTapped) _then) = __$EditTappedCopyWithImpl;
@useResult
$Res call({
 String reminderId
});




}
/// @nodoc
class __$EditTappedCopyWithImpl<$Res>
    implements _$EditTappedCopyWith<$Res> {
  __$EditTappedCopyWithImpl(this._self, this._then);

  final _EditTapped _self;
  final $Res Function(_EditTapped) _then;

/// Create a copy of GarageRemindersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reminderId = null,}) {
  return _then(_EditTapped(
reminderId: null == reminderId ? _self.reminderId : reminderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
