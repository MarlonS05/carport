// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_qr_scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsQrScannerState {

 bool get isLoading; PortalScanPhase get scanPhase; String? get portalBaseUrl; bool get isProcessing; String? get errorMessage;
/// Create a copy of GarageSettingsQrScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsQrScannerStateCopyWith<GarageSettingsQrScannerState> get copyWith => _$GarageSettingsQrScannerStateCopyWithImpl<GarageSettingsQrScannerState>(this as GarageSettingsQrScannerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsQrScannerState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.scanPhase, scanPhase) || other.scanPhase == scanPhase)&&(identical(other.portalBaseUrl, portalBaseUrl) || other.portalBaseUrl == portalBaseUrl)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,scanPhase,portalBaseUrl,isProcessing,errorMessage);

@override
String toString() {
  return 'GarageSettingsQrScannerState(isLoading: $isLoading, scanPhase: $scanPhase, portalBaseUrl: $portalBaseUrl, isProcessing: $isProcessing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsQrScannerStateCopyWith<$Res>  {
  factory $GarageSettingsQrScannerStateCopyWith(GarageSettingsQrScannerState value, $Res Function(GarageSettingsQrScannerState) _then) = _$GarageSettingsQrScannerStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, PortalScanPhase scanPhase, String? portalBaseUrl, bool isProcessing, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsQrScannerStateCopyWithImpl<$Res>
    implements $GarageSettingsQrScannerStateCopyWith<$Res> {
  _$GarageSettingsQrScannerStateCopyWithImpl(this._self, this._then);

  final GarageSettingsQrScannerState _self;
  final $Res Function(GarageSettingsQrScannerState) _then;

/// Create a copy of GarageSettingsQrScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? scanPhase = null,Object? portalBaseUrl = freezed,Object? isProcessing = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,scanPhase: null == scanPhase ? _self.scanPhase : scanPhase // ignore: cast_nullable_to_non_nullable
as PortalScanPhase,portalBaseUrl: freezed == portalBaseUrl ? _self.portalBaseUrl : portalBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsQrScannerState].
extension GarageSettingsQrScannerStatePatterns on GarageSettingsQrScannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsQrScannerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsQrScannerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsQrScannerState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsQrScannerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsQrScannerState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsQrScannerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  PortalScanPhase scanPhase,  String? portalBaseUrl,  bool isProcessing,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsQrScannerState() when $default != null:
return $default(_that.isLoading,_that.scanPhase,_that.portalBaseUrl,_that.isProcessing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  PortalScanPhase scanPhase,  String? portalBaseUrl,  bool isProcessing,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsQrScannerState():
return $default(_that.isLoading,_that.scanPhase,_that.portalBaseUrl,_that.isProcessing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  PortalScanPhase scanPhase,  String? portalBaseUrl,  bool isProcessing,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsQrScannerState() when $default != null:
return $default(_that.isLoading,_that.scanPhase,_that.portalBaseUrl,_that.isProcessing,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsQrScannerState implements GarageSettingsQrScannerState {
  const _GarageSettingsQrScannerState({this.isLoading = true, this.scanPhase = PortalScanPhase.scanning, this.portalBaseUrl, this.isProcessing = false, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  PortalScanPhase scanPhase;
@override final  String? portalBaseUrl;
@override@JsonKey() final  bool isProcessing;
@override final  String? errorMessage;

/// Create a copy of GarageSettingsQrScannerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsQrScannerStateCopyWith<_GarageSettingsQrScannerState> get copyWith => __$GarageSettingsQrScannerStateCopyWithImpl<_GarageSettingsQrScannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsQrScannerState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.scanPhase, scanPhase) || other.scanPhase == scanPhase)&&(identical(other.portalBaseUrl, portalBaseUrl) || other.portalBaseUrl == portalBaseUrl)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,scanPhase,portalBaseUrl,isProcessing,errorMessage);

@override
String toString() {
  return 'GarageSettingsQrScannerState(isLoading: $isLoading, scanPhase: $scanPhase, portalBaseUrl: $portalBaseUrl, isProcessing: $isProcessing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsQrScannerStateCopyWith<$Res> implements $GarageSettingsQrScannerStateCopyWith<$Res> {
  factory _$GarageSettingsQrScannerStateCopyWith(_GarageSettingsQrScannerState value, $Res Function(_GarageSettingsQrScannerState) _then) = __$GarageSettingsQrScannerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, PortalScanPhase scanPhase, String? portalBaseUrl, bool isProcessing, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsQrScannerStateCopyWithImpl<$Res>
    implements _$GarageSettingsQrScannerStateCopyWith<$Res> {
  __$GarageSettingsQrScannerStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsQrScannerState _self;
  final $Res Function(_GarageSettingsQrScannerState) _then;

/// Create a copy of GarageSettingsQrScannerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? scanPhase = null,Object? portalBaseUrl = freezed,Object? isProcessing = null,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsQrScannerState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,scanPhase: null == scanPhase ? _self.scanPhase : scanPhase // ignore: cast_nullable_to_non_nullable
as PortalScanPhase,portalBaseUrl: freezed == portalBaseUrl ? _self.portalBaseUrl : portalBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
