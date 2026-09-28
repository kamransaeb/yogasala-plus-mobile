// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent()';
}


}

/// @nodoc
class $AppEventCopyWith<$Res>  {
$AppEventCopyWith(AppEvent _, $Res Function(AppEvent) __);
}


/// Adds pattern-matching-related methods to [AppEvent].
extension AppEventPatterns on AppEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventLoaded value)?  loaded,TResult Function( _EventFirstUseDisabled value)?  firstUseDisabled,TResult Function( _EventLocaleChanged value)?  localeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded(_that);case _EventFirstUseDisabled() when firstUseDisabled != null:
return firstUseDisabled(_that);case _EventLocaleChanged() when localeChanged != null:
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventLoaded value)  loaded,required TResult Function( _EventFirstUseDisabled value)  firstUseDisabled,required TResult Function( _EventLocaleChanged value)  localeChanged,}){
final _that = this;
switch (_that) {
case _EventLoaded():
return loaded(_that);case _EventFirstUseDisabled():
return firstUseDisabled(_that);case _EventLocaleChanged():
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventLoaded value)?  loaded,TResult? Function( _EventFirstUseDisabled value)?  firstUseDisabled,TResult? Function( _EventLocaleChanged value)?  localeChanged,}){
final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded(_that);case _EventFirstUseDisabled() when firstUseDisabled != null:
return firstUseDisabled(_that);case _EventLocaleChanged() when localeChanged != null:
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loaded,TResult Function()?  firstUseDisabled,TResult Function( String locale)?  localeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded();case _EventFirstUseDisabled() when firstUseDisabled != null:
return firstUseDisabled();case _EventLocaleChanged() when localeChanged != null:
return localeChanged(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loaded,required TResult Function()  firstUseDisabled,required TResult Function( String locale)  localeChanged,}) {final _that = this;
switch (_that) {
case _EventLoaded():
return loaded();case _EventFirstUseDisabled():
return firstUseDisabled();case _EventLocaleChanged():
return localeChanged(_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loaded,TResult? Function()?  firstUseDisabled,TResult? Function( String locale)?  localeChanged,}) {final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded();case _EventFirstUseDisabled() when firstUseDisabled != null:
return firstUseDisabled();case _EventLocaleChanged() when localeChanged != null:
return localeChanged(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _EventLoaded implements AppEvent {
  const _EventLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.loaded()';
}


}




/// @nodoc


class _EventFirstUseDisabled implements AppEvent {
  const _EventFirstUseDisabled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFirstUseDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.firstUseDisabled()';
}


}




/// @nodoc


class _EventLocaleChanged implements AppEvent {
  const _EventLocaleChanged({required this.locale});
  

 final  String locale;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventLocaleChangedCopyWith<_EventLocaleChanged> get copyWith => __$EventLocaleChangedCopyWithImpl<_EventLocaleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLocaleChanged&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'AppEvent.localeChanged(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$EventLocaleChangedCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory _$EventLocaleChangedCopyWith(_EventLocaleChanged value, $Res Function(_EventLocaleChanged) _then) = __$EventLocaleChangedCopyWithImpl;
@useResult
$Res call({
 String locale
});




}
/// @nodoc
class __$EventLocaleChangedCopyWithImpl<$Res>
    implements _$EventLocaleChangedCopyWith<$Res> {
  __$EventLocaleChangedCopyWithImpl(this._self, this._then);

  final _EventLocaleChanged _self;
  final $Res Function(_EventLocaleChanged) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_EventLocaleChanged(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AppState {

 bool get isFirstUse; String get locale;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.isFirstUse, isFirstUse) || other.isFirstUse == isFirstUse)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,isFirstUse,locale);

@override
String toString() {
  return 'AppState(isFirstUse: $isFirstUse, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 bool isFirstUse, String locale
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFirstUse = null,Object? locale = null,}) {
  return _then(_self.copyWith(
isFirstUse: null == isFirstUse ? _self.isFirstUse : isFirstUse // ignore: cast_nullable_to_non_nullable
as bool,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isFirstUse,  String locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.isFirstUse,_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isFirstUse,  String locale)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.isFirstUse,_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isFirstUse,  String locale)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.isFirstUse,_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _AppState extends AppState {
  const _AppState({this.isFirstUse = true, this.locale = 'en'}): super._();
  

@override@JsonKey() final  bool isFirstUse;
@override@JsonKey() final  String locale;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.isFirstUse, isFirstUse) || other.isFirstUse == isFirstUse)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,isFirstUse,locale);

@override
String toString() {
  return 'AppState(isFirstUse: $isFirstUse, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 bool isFirstUse, String locale
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFirstUse = null,Object? locale = null,}) {
  return _then(_AppState(
isFirstUse: null == isFirstUse ? _self.isFirstUse : isFirstUse // ignore: cast_nullable_to_non_nullable
as bool,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
