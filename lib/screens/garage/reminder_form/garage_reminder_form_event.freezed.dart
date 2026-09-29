// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_reminder_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageReminderFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageReminderFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageReminderFormEvent()';
}


}

/// @nodoc
class $GarageReminderFormEventCopyWith<$Res>  {
$GarageReminderFormEventCopyWith(GarageReminderFormEvent _, $Res Function(GarageReminderFormEvent) __);
}


/// Adds pattern-matching-related methods to [GarageReminderFormEvent].
extension GarageReminderFormEventPatterns on GarageReminderFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RepeatingChanged value)?  repeatingChanged,TResult Function( _RepeatFrequencyChanged value)?  repeatFrequencyChanged,TResult Function( _BackTapped value)?  backTapped,TResult Function( _SaveTapped value)?  saveTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RepeatingChanged() when repeatingChanged != null:
return repeatingChanged(_that);case _RepeatFrequencyChanged() when repeatFrequencyChanged != null:
return repeatFrequencyChanged(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _SaveTapped() when saveTapped != null:
return saveTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RepeatingChanged value)  repeatingChanged,required TResult Function( _RepeatFrequencyChanged value)  repeatFrequencyChanged,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _SaveTapped value)  saveTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RepeatingChanged():
return repeatingChanged(_that);case _RepeatFrequencyChanged():
return repeatFrequencyChanged(_that);case _BackTapped():
return backTapped(_that);case _SaveTapped():
return saveTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RepeatingChanged value)?  repeatingChanged,TResult? Function( _RepeatFrequencyChanged value)?  repeatFrequencyChanged,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _SaveTapped value)?  saveTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RepeatingChanged() when repeatingChanged != null:
return repeatingChanged(_that);case _RepeatFrequencyChanged() when repeatFrequencyChanged != null:
return repeatFrequencyChanged(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _SaveTapped() when saveTapped != null:
return saveTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? reminderId)?  started,TResult Function( bool repeating)?  repeatingChanged,TResult Function( ReminderRepeatFrequency frequency)?  repeatFrequencyChanged,TResult Function()?  backTapped,TResult Function( String name,  String body,  DateTime dueAt)?  saveTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.reminderId);case _RepeatingChanged() when repeatingChanged != null:
return repeatingChanged(_that.repeating);case _RepeatFrequencyChanged() when repeatFrequencyChanged != null:
return repeatFrequencyChanged(_that.frequency);case _BackTapped() when backTapped != null:
return backTapped();case _SaveTapped() when saveTapped != null:
return saveTapped(_that.name,_that.body,_that.dueAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? reminderId)  started,required TResult Function( bool repeating)  repeatingChanged,required TResult Function( ReminderRepeatFrequency frequency)  repeatFrequencyChanged,required TResult Function()  backTapped,required TResult Function( String name,  String body,  DateTime dueAt)  saveTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.reminderId);case _RepeatingChanged():
return repeatingChanged(_that.repeating);case _RepeatFrequencyChanged():
return repeatFrequencyChanged(_that.frequency);case _BackTapped():
return backTapped();case _SaveTapped():
return saveTapped(_that.name,_that.body,_that.dueAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? reminderId)?  started,TResult? Function( bool repeating)?  repeatingChanged,TResult? Function( ReminderRepeatFrequency frequency)?  repeatFrequencyChanged,TResult? Function()?  backTapped,TResult? Function( String name,  String body,  DateTime dueAt)?  saveTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.reminderId);case _RepeatingChanged() when repeatingChanged != null:
return repeatingChanged(_that.repeating);case _RepeatFrequencyChanged() when repeatFrequencyChanged != null:
return repeatFrequencyChanged(_that.frequency);case _BackTapped() when backTapped != null:
return backTapped();case _SaveTapped() when saveTapped != null:
return saveTapped(_that.name,_that.body,_that.dueAt);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageReminderFormEvent {
  const _Started({this.reminderId});
  

 final  String? reminderId;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.reminderId, reminderId) || other.reminderId == reminderId));
}


@override
int get hashCode => Object.hash(runtimeType,reminderId);

@override
String toString() {
  return 'GarageReminderFormEvent.started(reminderId: $reminderId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $GarageReminderFormEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String? reminderId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reminderId = freezed,}) {
  return _then(_Started(
reminderId: freezed == reminderId ? _self.reminderId : reminderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _RepeatingChanged implements GarageReminderFormEvent {
  const _RepeatingChanged({required this.repeating});
  

 final  bool repeating;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepeatingChangedCopyWith<_RepeatingChanged> get copyWith => __$RepeatingChangedCopyWithImpl<_RepeatingChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepeatingChanged&&(identical(other.repeating, repeating) || other.repeating == repeating));
}


@override
int get hashCode => Object.hash(runtimeType,repeating);

@override
String toString() {
  return 'GarageReminderFormEvent.repeatingChanged(repeating: $repeating)';
}


}

/// @nodoc
abstract mixin class _$RepeatingChangedCopyWith<$Res> implements $GarageReminderFormEventCopyWith<$Res> {
  factory _$RepeatingChangedCopyWith(_RepeatingChanged value, $Res Function(_RepeatingChanged) _then) = __$RepeatingChangedCopyWithImpl;
@useResult
$Res call({
 bool repeating
});




}
/// @nodoc
class __$RepeatingChangedCopyWithImpl<$Res>
    implements _$RepeatingChangedCopyWith<$Res> {
  __$RepeatingChangedCopyWithImpl(this._self, this._then);

  final _RepeatingChanged _self;
  final $Res Function(_RepeatingChanged) _then;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? repeating = null,}) {
  return _then(_RepeatingChanged(
repeating: null == repeating ? _self.repeating : repeating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _RepeatFrequencyChanged implements GarageReminderFormEvent {
  const _RepeatFrequencyChanged({required this.frequency});
  

 final  ReminderRepeatFrequency frequency;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepeatFrequencyChangedCopyWith<_RepeatFrequencyChanged> get copyWith => __$RepeatFrequencyChangedCopyWithImpl<_RepeatFrequencyChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepeatFrequencyChanged&&(identical(other.frequency, frequency) || other.frequency == frequency));
}


@override
int get hashCode => Object.hash(runtimeType,frequency);

@override
String toString() {
  return 'GarageReminderFormEvent.repeatFrequencyChanged(frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class _$RepeatFrequencyChangedCopyWith<$Res> implements $GarageReminderFormEventCopyWith<$Res> {
  factory _$RepeatFrequencyChangedCopyWith(_RepeatFrequencyChanged value, $Res Function(_RepeatFrequencyChanged) _then) = __$RepeatFrequencyChangedCopyWithImpl;
@useResult
$Res call({
 ReminderRepeatFrequency frequency
});




}
/// @nodoc
class __$RepeatFrequencyChangedCopyWithImpl<$Res>
    implements _$RepeatFrequencyChangedCopyWith<$Res> {
  __$RepeatFrequencyChangedCopyWithImpl(this._self, this._then);

  final _RepeatFrequencyChanged _self;
  final $Res Function(_RepeatFrequencyChanged) _then;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? frequency = null,}) {
  return _then(_RepeatFrequencyChanged(
frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as ReminderRepeatFrequency,
  ));
}


}

/// @nodoc


class _BackTapped implements GarageReminderFormEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageReminderFormEvent.backTapped()';
}


}




/// @nodoc


class _SaveTapped implements GarageReminderFormEvent {
  const _SaveTapped({required this.name, required this.body, required this.dueAt});
  

 final  String name;
 final  String body;
 final  DateTime dueAt;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveTappedCopyWith<_SaveTapped> get copyWith => __$SaveTappedCopyWithImpl<_SaveTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTapped&&(identical(other.name, name) || other.name == name)&&(identical(other.body, body) || other.body == body)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,body,dueAt);

@override
String toString() {
  return 'GarageReminderFormEvent.saveTapped(name: $name, body: $body, dueAt: $dueAt)';
}


}

/// @nodoc
abstract mixin class _$SaveTappedCopyWith<$Res> implements $GarageReminderFormEventCopyWith<$Res> {
  factory _$SaveTappedCopyWith(_SaveTapped value, $Res Function(_SaveTapped) _then) = __$SaveTappedCopyWithImpl;
@useResult
$Res call({
 String name, String body, DateTime dueAt
});




}
/// @nodoc
class __$SaveTappedCopyWithImpl<$Res>
    implements _$SaveTappedCopyWith<$Res> {
  __$SaveTappedCopyWithImpl(this._self, this._then);

  final _SaveTapped _self;
  final $Res Function(_SaveTapped) _then;

/// Create a copy of GarageReminderFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? body = null,Object? dueAt = null,}) {
  return _then(_SaveTapped(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,dueAt: null == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
