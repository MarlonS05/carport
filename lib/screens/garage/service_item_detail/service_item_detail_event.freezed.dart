// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_item_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceItemDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceItemDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemDetailEvent()';
}


}

/// @nodoc
class $ServiceItemDetailEventCopyWith<$Res>  {
$ServiceItemDetailEventCopyWith(ServiceItemDetailEvent _, $Res Function(ServiceItemDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ServiceItemDetailEvent].
extension ServiceItemDetailEventPatterns on ServiceItemDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _EditToggled value)?  editToggled,TResult Function( _Saved value)?  saved,TResult Function( _TitleChanged value)?  titleChanged,TResult Function( _DescriptionChanged value)?  descriptionChanged,TResult Function( _DateChanged value)?  dateChanged,TResult Function( _MileageChanged value)?  mileageChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _EditToggled() when editToggled != null:
return editToggled(_that);case _Saved() when saved != null:
return saved(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _DateChanged() when dateChanged != null:
return dateChanged(_that);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _EditToggled value)  editToggled,required TResult Function( _Saved value)  saved,required TResult Function( _TitleChanged value)  titleChanged,required TResult Function( _DescriptionChanged value)  descriptionChanged,required TResult Function( _DateChanged value)  dateChanged,required TResult Function( _MileageChanged value)  mileageChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _EditToggled():
return editToggled(_that);case _Saved():
return saved(_that);case _TitleChanged():
return titleChanged(_that);case _DescriptionChanged():
return descriptionChanged(_that);case _DateChanged():
return dateChanged(_that);case _MileageChanged():
return mileageChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _EditToggled value)?  editToggled,TResult? Function( _Saved value)?  saved,TResult? Function( _TitleChanged value)?  titleChanged,TResult? Function( _DescriptionChanged value)?  descriptionChanged,TResult? Function( _DateChanged value)?  dateChanged,TResult? Function( _MileageChanged value)?  mileageChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _EditToggled() when editToggled != null:
return editToggled(_that);case _Saved() when saved != null:
return saved(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _DateChanged() when dateChanged != null:
return dateChanged(_that);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId,  String serviceItemId)?  started,TResult Function()?  backTapped,TResult Function()?  editToggled,TResult Function()?  saved,TResult Function( String value)?  titleChanged,TResult Function( String value)?  descriptionChanged,TResult Function( DateTime value)?  dateChanged,TResult Function( String value)?  mileageChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId,_that.serviceItemId);case _BackTapped() when backTapped != null:
return backTapped();case _EditToggled() when editToggled != null:
return editToggled();case _Saved() when saved != null:
return saved();case _TitleChanged() when titleChanged != null:
return titleChanged(_that.value);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.value);case _DateChanged() when dateChanged != null:
return dateChanged(_that.value);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId,  String serviceItemId)  started,required TResult Function()  backTapped,required TResult Function()  editToggled,required TResult Function()  saved,required TResult Function( String value)  titleChanged,required TResult Function( String value)  descriptionChanged,required TResult Function( DateTime value)  dateChanged,required TResult Function( String value)  mileageChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId,_that.serviceItemId);case _BackTapped():
return backTapped();case _EditToggled():
return editToggled();case _Saved():
return saved();case _TitleChanged():
return titleChanged(_that.value);case _DescriptionChanged():
return descriptionChanged(_that.value);case _DateChanged():
return dateChanged(_that.value);case _MileageChanged():
return mileageChanged(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId,  String serviceItemId)?  started,TResult? Function()?  backTapped,TResult? Function()?  editToggled,TResult? Function()?  saved,TResult? Function( String value)?  titleChanged,TResult? Function( String value)?  descriptionChanged,TResult? Function( DateTime value)?  dateChanged,TResult? Function( String value)?  mileageChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId,_that.serviceItemId);case _BackTapped() when backTapped != null:
return backTapped();case _EditToggled() when editToggled != null:
return editToggled();case _Saved() when saved != null:
return saved();case _TitleChanged() when titleChanged != null:
return titleChanged(_that.value);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.value);case _DateChanged() when dateChanged != null:
return dateChanged(_that.value);case _MileageChanged() when mileageChanged != null:
return mileageChanged(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ServiceItemDetailEvent {
  const _Started({required this.vehicleId, required this.serviceItemId});
  

 final  String vehicleId;
 final  String serviceItemId;

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.serviceItemId, serviceItemId) || other.serviceItemId == serviceItemId));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,serviceItemId);

@override
String toString() {
  return 'ServiceItemDetailEvent.started(vehicleId: $vehicleId, serviceItemId: $serviceItemId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ServiceItemDetailEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String vehicleId, String serviceItemId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,Object? serviceItemId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,serviceItemId: null == serviceItemId ? _self.serviceItemId : serviceItemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements ServiceItemDetailEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemDetailEvent.backTapped()';
}


}




/// @nodoc


class _EditToggled implements ServiceItemDetailEvent {
  const _EditToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemDetailEvent.editToggled()';
}


}




/// @nodoc


class _Saved implements ServiceItemDetailEvent {
  const _Saved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemDetailEvent.saved()';
}


}




/// @nodoc


class _TitleChanged implements ServiceItemDetailEvent {
  const _TitleChanged(this.value);
  

 final  String value;

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleChangedCopyWith<_TitleChanged> get copyWith => __$TitleChangedCopyWithImpl<_TitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ServiceItemDetailEvent.titleChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedCopyWith<$Res> implements $ServiceItemDetailEventCopyWith<$Res> {
  factory _$TitleChangedCopyWith(_TitleChanged value, $Res Function(_TitleChanged) _then) = __$TitleChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$TitleChangedCopyWithImpl<$Res>
    implements _$TitleChangedCopyWith<$Res> {
  __$TitleChangedCopyWithImpl(this._self, this._then);

  final _TitleChanged _self;
  final $Res Function(_TitleChanged) _then;

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_TitleChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChanged implements ServiceItemDetailEvent {
  const _DescriptionChanged(this.value);
  

 final  String value;

/// Create a copy of ServiceItemDetailEvent
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
  return 'ServiceItemDetailEvent.descriptionChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangedCopyWith<$Res> implements $ServiceItemDetailEventCopyWith<$Res> {
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

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_DescriptionChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DateChanged implements ServiceItemDetailEvent {
  const _DateChanged(this.value);
  

 final  DateTime value;

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateChangedCopyWith<_DateChanged> get copyWith => __$DateChangedCopyWithImpl<_DateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ServiceItemDetailEvent.dateChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$DateChangedCopyWith<$Res> implements $ServiceItemDetailEventCopyWith<$Res> {
  factory _$DateChangedCopyWith(_DateChanged value, $Res Function(_DateChanged) _then) = __$DateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime value
});




}
/// @nodoc
class __$DateChangedCopyWithImpl<$Res>
    implements _$DateChangedCopyWith<$Res> {
  __$DateChangedCopyWithImpl(this._self, this._then);

  final _DateChanged _self;
  final $Res Function(_DateChanged) _then;

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_DateChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _MileageChanged implements ServiceItemDetailEvent {
  const _MileageChanged(this.value);
  

 final  String value;

/// Create a copy of ServiceItemDetailEvent
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
  return 'ServiceItemDetailEvent.mileageChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$MileageChangedCopyWith<$Res> implements $ServiceItemDetailEventCopyWith<$Res> {
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

/// Create a copy of ServiceItemDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_MileageChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
