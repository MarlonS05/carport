// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_vehicle_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddVehicleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddVehicleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddVehicleEvent()';
}


}

/// @nodoc
class $AddVehicleEventCopyWith<$Res>  {
$AddVehicleEventCopyWith(AddVehicleEvent _, $Res Function(AddVehicleEvent) __);
}


/// Adds pattern-matching-related methods to [AddVehicleEvent].
extension AddVehicleEventPatterns on AddVehicleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _Submitted value)?  submitted,TResult Function( _NameChanged value)?  nameChanged,TResult Function( _DescriptionChanged value)?  descriptionChanged,TResult Function( _MileageChanged value)?  mileageChanged,TResult Function( _Link1Changed value)?  link1Changed,TResult Function( _Link2Changed value)?  link2Changed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _Submitted() when submitted != null:
return submitted(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that);case _Link1Changed() when link1Changed != null:
return link1Changed(_that);case _Link2Changed() when link2Changed != null:
return link2Changed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _Submitted value)  submitted,required TResult Function( _NameChanged value)  nameChanged,required TResult Function( _DescriptionChanged value)  descriptionChanged,required TResult Function( _MileageChanged value)  mileageChanged,required TResult Function( _Link1Changed value)  link1Changed,required TResult Function( _Link2Changed value)  link2Changed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _Submitted():
return submitted(_that);case _NameChanged():
return nameChanged(_that);case _DescriptionChanged():
return descriptionChanged(_that);case _MileageChanged():
return mileageChanged(_that);case _Link1Changed():
return link1Changed(_that);case _Link2Changed():
return link2Changed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _Submitted value)?  submitted,TResult? Function( _NameChanged value)?  nameChanged,TResult? Function( _DescriptionChanged value)?  descriptionChanged,TResult? Function( _MileageChanged value)?  mileageChanged,TResult? Function( _Link1Changed value)?  link1Changed,TResult? Function( _Link2Changed value)?  link2Changed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _Submitted() when submitted != null:
return submitted(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that);case _Link1Changed() when link1Changed != null:
return link1Changed(_that);case _Link2Changed() when link2Changed != null:
return link2Changed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  backTapped,TResult Function()?  submitted,TResult Function( String value)?  nameChanged,TResult Function( String value)?  descriptionChanged,TResult Function( String value)?  mileageChanged,TResult Function( String value)?  link1Changed,TResult Function( String value)?  link2Changed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BackTapped() when backTapped != null:
return backTapped();case _Submitted() when submitted != null:
return submitted();case _NameChanged() when nameChanged != null:
return nameChanged(_that.value);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.value);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that.value);case _Link1Changed() when link1Changed != null:
return link1Changed(_that.value);case _Link2Changed() when link2Changed != null:
return link2Changed(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  backTapped,required TResult Function()  submitted,required TResult Function( String value)  nameChanged,required TResult Function( String value)  descriptionChanged,required TResult Function( String value)  mileageChanged,required TResult Function( String value)  link1Changed,required TResult Function( String value)  link2Changed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BackTapped():
return backTapped();case _Submitted():
return submitted();case _NameChanged():
return nameChanged(_that.value);case _DescriptionChanged():
return descriptionChanged(_that.value);case _MileageChanged():
return mileageChanged(_that.value);case _Link1Changed():
return link1Changed(_that.value);case _Link2Changed():
return link2Changed(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  backTapped,TResult? Function()?  submitted,TResult? Function( String value)?  nameChanged,TResult? Function( String value)?  descriptionChanged,TResult? Function( String value)?  mileageChanged,TResult? Function( String value)?  link1Changed,TResult? Function( String value)?  link2Changed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BackTapped() when backTapped != null:
return backTapped();case _Submitted() when submitted != null:
return submitted();case _NameChanged() when nameChanged != null:
return nameChanged(_that.value);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.value);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that.value);case _Link1Changed() when link1Changed != null:
return link1Changed(_that.value);case _Link2Changed() when link2Changed != null:
return link2Changed(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AddVehicleEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddVehicleEvent.started()';
}


}




/// @nodoc


class _BackTapped implements AddVehicleEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddVehicleEvent.backTapped()';
}


}




/// @nodoc


class _Submitted implements AddVehicleEvent {
  const _Submitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddVehicleEvent.submitted()';
}


}




/// @nodoc


class _NameChanged implements AddVehicleEvent {
  const _NameChanged(this.value);
  

 final  String value;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameChangedCopyWith<_NameChanged> get copyWith => __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AddVehicleEvent.nameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$NameChangedCopyWith<$Res> implements $AddVehicleEventCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) _then) = __$NameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(this._self, this._then);

  final _NameChanged _self;
  final $Res Function(_NameChanged) _then;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_NameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChanged implements AddVehicleEvent {
  const _DescriptionChanged(this.value);
  

 final  String value;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionChangedCopyWith<_DescriptionChanged> get copyWith => __$DescriptionChangedCopyWithImpl<_DescriptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AddVehicleEvent.descriptionChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangedCopyWith<$Res> implements $AddVehicleEventCopyWith<$Res> {
  factory _$DescriptionChangedCopyWith(_DescriptionChanged value, $Res Function(_DescriptionChanged) _then) = __$DescriptionChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$DescriptionChangedCopyWithImpl<$Res>
    implements _$DescriptionChangedCopyWith<$Res> {
  __$DescriptionChangedCopyWithImpl(this._self, this._then);

  final _DescriptionChanged _self;
  final $Res Function(_DescriptionChanged) _then;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_DescriptionChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MileageChanged implements AddVehicleEvent {
  const _MileageChanged(this.value);
  

 final  String value;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MileageChangedCopyWith<_MileageChanged> get copyWith => __$MileageChangedCopyWithImpl<_MileageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MileageChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AddVehicleEvent.mileageChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$MileageChangedCopyWith<$Res> implements $AddVehicleEventCopyWith<$Res> {
  factory _$MileageChangedCopyWith(_MileageChanged value, $Res Function(_MileageChanged) _then) = __$MileageChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$MileageChangedCopyWithImpl<$Res>
    implements _$MileageChangedCopyWith<$Res> {
  __$MileageChangedCopyWithImpl(this._self, this._then);

  final _MileageChanged _self;
  final $Res Function(_MileageChanged) _then;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_MileageChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Link1Changed implements AddVehicleEvent {
  const _Link1Changed(this.value);
  

 final  String value;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Link1ChangedCopyWith<_Link1Changed> get copyWith => __$Link1ChangedCopyWithImpl<_Link1Changed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Link1Changed&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AddVehicleEvent.link1Changed(value: $value)';
}


}

/// @nodoc
abstract mixin class _$Link1ChangedCopyWith<$Res> implements $AddVehicleEventCopyWith<$Res> {
  factory _$Link1ChangedCopyWith(_Link1Changed value, $Res Function(_Link1Changed) _then) = __$Link1ChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$Link1ChangedCopyWithImpl<$Res>
    implements _$Link1ChangedCopyWith<$Res> {
  __$Link1ChangedCopyWithImpl(this._self, this._then);

  final _Link1Changed _self;
  final $Res Function(_Link1Changed) _then;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Link1Changed(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Link2Changed implements AddVehicleEvent {
  const _Link2Changed(this.value);
  

 final  String value;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Link2ChangedCopyWith<_Link2Changed> get copyWith => __$Link2ChangedCopyWithImpl<_Link2Changed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Link2Changed&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AddVehicleEvent.link2Changed(value: $value)';
}


}

/// @nodoc
abstract mixin class _$Link2ChangedCopyWith<$Res> implements $AddVehicleEventCopyWith<$Res> {
  factory _$Link2ChangedCopyWith(_Link2Changed value, $Res Function(_Link2Changed) _then) = __$Link2ChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$Link2ChangedCopyWithImpl<$Res>
    implements _$Link2ChangedCopyWith<$Res> {
  __$Link2ChangedCopyWithImpl(this._self, this._then);

  final _Link2Changed _self;
  final $Res Function(_Link2Changed) _then;

/// Create a copy of AddVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Link2Changed(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
