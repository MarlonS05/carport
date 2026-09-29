// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_qr_scanner_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsQrScannerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsQrScannerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsQrScannerEvent()';
}


}

/// @nodoc
class $GarageSettingsQrScannerEventCopyWith<$Res>  {
$GarageSettingsQrScannerEventCopyWith(GarageSettingsQrScannerEvent _, $Res Function(GarageSettingsQrScannerEvent) __);
}


/// Adds pattern-matching-related methods to [GarageSettingsQrScannerEvent].
extension GarageSettingsQrScannerEventPatterns on GarageSettingsQrScannerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CodeDetected value)?  codeDetected,TResult Function( _CameraDenied value)?  cameraDenied,TResult Function( _BackTapped value)?  backTapped,TResult Function( _ReRegisterTapped value)?  reRegisterTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CodeDetected() when codeDetected != null:
return codeDetected(_that);case _CameraDenied() when cameraDenied != null:
return cameraDenied(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _ReRegisterTapped() when reRegisterTapped != null:
return reRegisterTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CodeDetected value)  codeDetected,required TResult Function( _CameraDenied value)  cameraDenied,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _ReRegisterTapped value)  reRegisterTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CodeDetected():
return codeDetected(_that);case _CameraDenied():
return cameraDenied(_that);case _BackTapped():
return backTapped(_that);case _ReRegisterTapped():
return reRegisterTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CodeDetected value)?  codeDetected,TResult? Function( _CameraDenied value)?  cameraDenied,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _ReRegisterTapped value)?  reRegisterTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CodeDetected() when codeDetected != null:
return codeDetected(_that);case _CameraDenied() when cameraDenied != null:
return cameraDenied(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _ReRegisterTapped() when reRegisterTapped != null:
return reRegisterTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String raw)?  codeDetected,TResult Function()?  cameraDenied,TResult Function()?  backTapped,TResult Function()?  reRegisterTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CodeDetected() when codeDetected != null:
return codeDetected(_that.raw);case _CameraDenied() when cameraDenied != null:
return cameraDenied();case _BackTapped() when backTapped != null:
return backTapped();case _ReRegisterTapped() when reRegisterTapped != null:
return reRegisterTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String raw)  codeDetected,required TResult Function()  cameraDenied,required TResult Function()  backTapped,required TResult Function()  reRegisterTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CodeDetected():
return codeDetected(_that.raw);case _CameraDenied():
return cameraDenied();case _BackTapped():
return backTapped();case _ReRegisterTapped():
return reRegisterTapped();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String raw)?  codeDetected,TResult? Function()?  cameraDenied,TResult? Function()?  backTapped,TResult? Function()?  reRegisterTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CodeDetected() when codeDetected != null:
return codeDetected(_that.raw);case _CameraDenied() when cameraDenied != null:
return cameraDenied();case _BackTapped() when backTapped != null:
return backTapped();case _ReRegisterTapped() when reRegisterTapped != null:
return reRegisterTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageSettingsQrScannerEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsQrScannerEvent.started()';
}


}




/// @nodoc


class _CodeDetected implements GarageSettingsQrScannerEvent {
  const _CodeDetected(this.raw);
  

 final  String raw;

/// Create a copy of GarageSettingsQrScannerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CodeDetectedCopyWith<_CodeDetected> get copyWith => __$CodeDetectedCopyWithImpl<_CodeDetected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CodeDetected&&(identical(other.raw, raw) || other.raw == raw));
}


@override
int get hashCode => Object.hash(runtimeType,raw);

@override
String toString() {
  return 'GarageSettingsQrScannerEvent.codeDetected(raw: $raw)';
}


}

/// @nodoc
abstract mixin class _$CodeDetectedCopyWith<$Res> implements $GarageSettingsQrScannerEventCopyWith<$Res> {
  factory _$CodeDetectedCopyWith(_CodeDetected value, $Res Function(_CodeDetected) _then) = __$CodeDetectedCopyWithImpl;
@useResult
$Res call({
 String raw
});




}
/// @nodoc
class __$CodeDetectedCopyWithImpl<$Res>
    implements _$CodeDetectedCopyWith<$Res> {
  __$CodeDetectedCopyWithImpl(this._self, this._then);

  final _CodeDetected _self;
  final $Res Function(_CodeDetected) _then;

/// Create a copy of GarageSettingsQrScannerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? raw = null,}) {
  return _then(_CodeDetected(
null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CameraDenied implements GarageSettingsQrScannerEvent {
  const _CameraDenied();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraDenied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsQrScannerEvent.cameraDenied()';
}


}




/// @nodoc


class _BackTapped implements GarageSettingsQrScannerEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsQrScannerEvent.backTapped()';
}


}




/// @nodoc


class _ReRegisterTapped implements GarageSettingsQrScannerEvent {
  const _ReRegisterTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReRegisterTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsQrScannerEvent.reRegisterTapped()';
}


}




// dart format on
