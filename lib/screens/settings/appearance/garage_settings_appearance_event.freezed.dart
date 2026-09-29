// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_appearance_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsAppearanceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsAppearanceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsAppearanceEvent()';
}


}

/// @nodoc
class $GarageSettingsAppearanceEventCopyWith<$Res>  {
$GarageSettingsAppearanceEventCopyWith(GarageSettingsAppearanceEvent _, $Res Function(GarageSettingsAppearanceEvent) __);
}


/// Adds pattern-matching-related methods to [GarageSettingsAppearanceEvent].
extension GarageSettingsAppearanceEventPatterns on GarageSettingsAppearanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PresetSelected value)?  presetSelected,TResult Function( _SaveTapped value)?  saveTapped,TResult Function( _BackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PresetSelected() when presetSelected != null:
return presetSelected(_that);case _SaveTapped() when saveTapped != null:
return saveTapped(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PresetSelected value)  presetSelected,required TResult Function( _SaveTapped value)  saveTapped,required TResult Function( _BackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PresetSelected():
return presetSelected(_that);case _SaveTapped():
return saveTapped(_that);case _BackTapped():
return backTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PresetSelected value)?  presetSelected,TResult? Function( _SaveTapped value)?  saveTapped,TResult? Function( _BackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PresetSelected() when presetSelected != null:
return presetSelected(_that);case _SaveTapped() when saveTapped != null:
return saveTapped(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ColorThemePreset preset)?  presetSelected,TResult Function()?  saveTapped,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PresetSelected() when presetSelected != null:
return presetSelected(_that.preset);case _SaveTapped() when saveTapped != null:
return saveTapped();case _BackTapped() when backTapped != null:
return backTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ColorThemePreset preset)  presetSelected,required TResult Function()  saveTapped,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PresetSelected():
return presetSelected(_that.preset);case _SaveTapped():
return saveTapped();case _BackTapped():
return backTapped();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ColorThemePreset preset)?  presetSelected,TResult? Function()?  saveTapped,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PresetSelected() when presetSelected != null:
return presetSelected(_that.preset);case _SaveTapped() when saveTapped != null:
return saveTapped();case _BackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageSettingsAppearanceEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsAppearanceEvent.started()';
}


}




/// @nodoc


class _PresetSelected implements GarageSettingsAppearanceEvent {
  const _PresetSelected(this.preset);
  

 final  ColorThemePreset preset;

/// Create a copy of GarageSettingsAppearanceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetSelectedCopyWith<_PresetSelected> get copyWith => __$PresetSelectedCopyWithImpl<_PresetSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetSelected&&(identical(other.preset, preset) || other.preset == preset));
}


@override
int get hashCode => Object.hash(runtimeType,preset);

@override
String toString() {
  return 'GarageSettingsAppearanceEvent.presetSelected(preset: $preset)';
}


}

/// @nodoc
abstract mixin class _$PresetSelectedCopyWith<$Res> implements $GarageSettingsAppearanceEventCopyWith<$Res> {
  factory _$PresetSelectedCopyWith(_PresetSelected value, $Res Function(_PresetSelected) _then) = __$PresetSelectedCopyWithImpl;
@useResult
$Res call({
 ColorThemePreset preset
});




}
/// @nodoc
class __$PresetSelectedCopyWithImpl<$Res>
    implements _$PresetSelectedCopyWith<$Res> {
  __$PresetSelectedCopyWithImpl(this._self, this._then);

  final _PresetSelected _self;
  final $Res Function(_PresetSelected) _then;

/// Create a copy of GarageSettingsAppearanceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preset = null,}) {
  return _then(_PresetSelected(
null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,
  ));
}


}

/// @nodoc


class _SaveTapped implements GarageSettingsAppearanceEvent {
  const _SaveTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsAppearanceEvent.saveTapped()';
}


}




/// @nodoc


class _BackTapped implements GarageSettingsAppearanceEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsAppearanceEvent.backTapped()';
}


}




// dart format on
