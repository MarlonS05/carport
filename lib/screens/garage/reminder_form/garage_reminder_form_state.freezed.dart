// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_reminder_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageReminderFormState {

 GarageReminderFormMode get mode; String get reminderId; Reminder? get reminder; bool get repeating; ReminderRepeatFrequency get repeatFrequency; bool get isLoading; bool get isSubmitting; Map<String, String> get fieldErrors; String? get errorMessage; String? get warningMessage;
/// Create a copy of GarageReminderFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageReminderFormStateCopyWith<GarageReminderFormState> get copyWith => _$GarageReminderFormStateCopyWithImpl<GarageReminderFormState>(this as GarageReminderFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageReminderFormState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.reminderId, reminderId) || other.reminderId == reminderId)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.repeating, repeating) || other.repeating == repeating)&&(identical(other.repeatFrequency, repeatFrequency) || other.repeatFrequency == repeatFrequency)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.warningMessage, warningMessage) || other.warningMessage == warningMessage));
}


@override
int get hashCode => Object.hash(runtimeType,mode,reminderId,reminder,repeating,repeatFrequency,isLoading,isSubmitting,const DeepCollectionEquality().hash(fieldErrors),errorMessage,warningMessage);

@override
String toString() {
  return 'GarageReminderFormState(mode: $mode, reminderId: $reminderId, reminder: $reminder, repeating: $repeating, repeatFrequency: $repeatFrequency, isLoading: $isLoading, isSubmitting: $isSubmitting, fieldErrors: $fieldErrors, errorMessage: $errorMessage, warningMessage: $warningMessage)';
}


}

/// @nodoc
abstract mixin class $GarageReminderFormStateCopyWith<$Res>  {
  factory $GarageReminderFormStateCopyWith(GarageReminderFormState value, $Res Function(GarageReminderFormState) _then) = _$GarageReminderFormStateCopyWithImpl;
@useResult
$Res call({
 GarageReminderFormMode mode, String reminderId, Reminder? reminder, bool repeating, ReminderRepeatFrequency repeatFrequency, bool isLoading, bool isSubmitting, Map<String, String> fieldErrors, String? errorMessage, String? warningMessage
});




}
/// @nodoc
class _$GarageReminderFormStateCopyWithImpl<$Res>
    implements $GarageReminderFormStateCopyWith<$Res> {
  _$GarageReminderFormStateCopyWithImpl(this._self, this._then);

  final GarageReminderFormState _self;
  final $Res Function(GarageReminderFormState) _then;

/// Create a copy of GarageReminderFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? reminderId = null,Object? reminder = freezed,Object? repeating = null,Object? repeatFrequency = null,Object? isLoading = null,Object? isSubmitting = null,Object? fieldErrors = null,Object? errorMessage = freezed,Object? warningMessage = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as GarageReminderFormMode,reminderId: null == reminderId ? _self.reminderId : reminderId // ignore: cast_nullable_to_non_nullable
as String,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as Reminder?,repeating: null == repeating ? _self.repeating : repeating // ignore: cast_nullable_to_non_nullable
as bool,repeatFrequency: null == repeatFrequency ? _self.repeatFrequency : repeatFrequency // ignore: cast_nullable_to_non_nullable
as ReminderRepeatFrequency,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,warningMessage: freezed == warningMessage ? _self.warningMessage : warningMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageReminderFormState].
extension GarageReminderFormStatePatterns on GarageReminderFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageReminderFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageReminderFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageReminderFormState value)  $default,){
final _that = this;
switch (_that) {
case _GarageReminderFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageReminderFormState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageReminderFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GarageReminderFormMode mode,  String reminderId,  Reminder? reminder,  bool repeating,  ReminderRepeatFrequency repeatFrequency,  bool isLoading,  bool isSubmitting,  Map<String, String> fieldErrors,  String? errorMessage,  String? warningMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageReminderFormState() when $default != null:
return $default(_that.mode,_that.reminderId,_that.reminder,_that.repeating,_that.repeatFrequency,_that.isLoading,_that.isSubmitting,_that.fieldErrors,_that.errorMessage,_that.warningMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GarageReminderFormMode mode,  String reminderId,  Reminder? reminder,  bool repeating,  ReminderRepeatFrequency repeatFrequency,  bool isLoading,  bool isSubmitting,  Map<String, String> fieldErrors,  String? errorMessage,  String? warningMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageReminderFormState():
return $default(_that.mode,_that.reminderId,_that.reminder,_that.repeating,_that.repeatFrequency,_that.isLoading,_that.isSubmitting,_that.fieldErrors,_that.errorMessage,_that.warningMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GarageReminderFormMode mode,  String reminderId,  Reminder? reminder,  bool repeating,  ReminderRepeatFrequency repeatFrequency,  bool isLoading,  bool isSubmitting,  Map<String, String> fieldErrors,  String? errorMessage,  String? warningMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageReminderFormState() when $default != null:
return $default(_that.mode,_that.reminderId,_that.reminder,_that.repeating,_that.repeatFrequency,_that.isLoading,_that.isSubmitting,_that.fieldErrors,_that.errorMessage,_that.warningMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageReminderFormState implements GarageReminderFormState {
  const _GarageReminderFormState({this.mode = GarageReminderFormMode.add, this.reminderId = '', this.reminder, this.repeating = false, this.repeatFrequency = ReminderRepeatFrequency.daily, this.isLoading = true, this.isSubmitting = false, final  Map<String, String> fieldErrors = const {}, this.errorMessage, this.warningMessage}): _fieldErrors = fieldErrors;
  

@override@JsonKey() final  GarageReminderFormMode mode;
@override@JsonKey() final  String reminderId;
@override final  Reminder? reminder;
@override@JsonKey() final  bool repeating;
@override@JsonKey() final  ReminderRepeatFrequency repeatFrequency;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
 final  Map<String, String> _fieldErrors;
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

@override final  String? errorMessage;
@override final  String? warningMessage;

/// Create a copy of GarageReminderFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageReminderFormStateCopyWith<_GarageReminderFormState> get copyWith => __$GarageReminderFormStateCopyWithImpl<_GarageReminderFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageReminderFormState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.reminderId, reminderId) || other.reminderId == reminderId)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.repeating, repeating) || other.repeating == repeating)&&(identical(other.repeatFrequency, repeatFrequency) || other.repeatFrequency == repeatFrequency)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.warningMessage, warningMessage) || other.warningMessage == warningMessage));
}


@override
int get hashCode => Object.hash(runtimeType,mode,reminderId,reminder,repeating,repeatFrequency,isLoading,isSubmitting,const DeepCollectionEquality().hash(_fieldErrors),errorMessage,warningMessage);

@override
String toString() {
  return 'GarageReminderFormState(mode: $mode, reminderId: $reminderId, reminder: $reminder, repeating: $repeating, repeatFrequency: $repeatFrequency, isLoading: $isLoading, isSubmitting: $isSubmitting, fieldErrors: $fieldErrors, errorMessage: $errorMessage, warningMessage: $warningMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageReminderFormStateCopyWith<$Res> implements $GarageReminderFormStateCopyWith<$Res> {
  factory _$GarageReminderFormStateCopyWith(_GarageReminderFormState value, $Res Function(_GarageReminderFormState) _then) = __$GarageReminderFormStateCopyWithImpl;
@override @useResult
$Res call({
 GarageReminderFormMode mode, String reminderId, Reminder? reminder, bool repeating, ReminderRepeatFrequency repeatFrequency, bool isLoading, bool isSubmitting, Map<String, String> fieldErrors, String? errorMessage, String? warningMessage
});




}
/// @nodoc
class __$GarageReminderFormStateCopyWithImpl<$Res>
    implements _$GarageReminderFormStateCopyWith<$Res> {
  __$GarageReminderFormStateCopyWithImpl(this._self, this._then);

  final _GarageReminderFormState _self;
  final $Res Function(_GarageReminderFormState) _then;

/// Create a copy of GarageReminderFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? reminderId = null,Object? reminder = freezed,Object? repeating = null,Object? repeatFrequency = null,Object? isLoading = null,Object? isSubmitting = null,Object? fieldErrors = null,Object? errorMessage = freezed,Object? warningMessage = freezed,}) {
  return _then(_GarageReminderFormState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as GarageReminderFormMode,reminderId: null == reminderId ? _self.reminderId : reminderId // ignore: cast_nullable_to_non_nullable
as String,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as Reminder?,repeating: null == repeating ? _self.repeating : repeating // ignore: cast_nullable_to_non_nullable
as bool,repeatFrequency: null == repeatFrequency ? _self.repeatFrequency : repeatFrequency // ignore: cast_nullable_to_non_nullable
as ReminderRepeatFrequency,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,warningMessage: freezed == warningMessage ? _self.warningMessage : warningMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
