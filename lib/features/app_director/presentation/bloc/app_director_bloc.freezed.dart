// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_director_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppDirectorEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDirectorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDirectorEvent()';
}


}

/// @nodoc
class $AppDirectorEventCopyWith<$Res>  {
$AppDirectorEventCopyWith(AppDirectorEvent _, $Res Function(AppDirectorEvent) __);
}


/// Adds pattern-matching-related methods to [AppDirectorEvent].
extension AppDirectorEventPatterns on AppDirectorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventLoaded value)?  loaded,TResult Function( _EventFirstLaunchDisabled value)?  firstLaunchDisabled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded(_that);case _EventFirstLaunchDisabled() when firstLaunchDisabled != null:
return firstLaunchDisabled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventLoaded value)  loaded,required TResult Function( _EventFirstLaunchDisabled value)  firstLaunchDisabled,}){
final _that = this;
switch (_that) {
case _EventLoaded():
return loaded(_that);case _EventFirstLaunchDisabled():
return firstLaunchDisabled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventLoaded value)?  loaded,TResult? Function( _EventFirstLaunchDisabled value)?  firstLaunchDisabled,}){
final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded(_that);case _EventFirstLaunchDisabled() when firstLaunchDisabled != null:
return firstLaunchDisabled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loaded,TResult Function()?  firstLaunchDisabled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded();case _EventFirstLaunchDisabled() when firstLaunchDisabled != null:
return firstLaunchDisabled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loaded,required TResult Function()  firstLaunchDisabled,}) {final _that = this;
switch (_that) {
case _EventLoaded():
return loaded();case _EventFirstLaunchDisabled():
return firstLaunchDisabled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loaded,TResult? Function()?  firstLaunchDisabled,}) {final _that = this;
switch (_that) {
case _EventLoaded() when loaded != null:
return loaded();case _EventFirstLaunchDisabled() when firstLaunchDisabled != null:
return firstLaunchDisabled();case _:
  return null;

}
}

}

/// @nodoc


class _EventLoaded extends AppDirectorEvent {
  const _EventLoaded(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDirectorEvent.loaded()';
}


}




/// @nodoc


class _EventFirstLaunchDisabled extends AppDirectorEvent {
  const _EventFirstLaunchDisabled(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFirstLaunchDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDirectorEvent.firstLaunchDisabled()';
}


}




/// @nodoc
mixin _$AppDirectorState {

 bool get isFirstLaunch; String get storeUrlEn; String get storeUrlTr;
/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDirectorStateCopyWith<AppDirectorState> get copyWith => _$AppDirectorStateCopyWithImpl<AppDirectorState>(this as AppDirectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDirectorState&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.storeUrlEn, storeUrlEn) || other.storeUrlEn == storeUrlEn)&&(identical(other.storeUrlTr, storeUrlTr) || other.storeUrlTr == storeUrlTr));
}


@override
int get hashCode => Object.hash(runtimeType,isFirstLaunch,storeUrlEn,storeUrlTr);

@override
String toString() {
  return 'AppDirectorState(isFirstLaunch: $isFirstLaunch, storeUrlEn: $storeUrlEn, storeUrlTr: $storeUrlTr)';
}


}

/// @nodoc
abstract mixin class $AppDirectorStateCopyWith<$Res>  {
  factory $AppDirectorStateCopyWith(AppDirectorState value, $Res Function(AppDirectorState) _then) = _$AppDirectorStateCopyWithImpl;
@useResult
$Res call({
 bool isFirstLaunch, String storeUrlEn, String storeUrlTr
});




}
/// @nodoc
class _$AppDirectorStateCopyWithImpl<$Res>
    implements $AppDirectorStateCopyWith<$Res> {
  _$AppDirectorStateCopyWithImpl(this._self, this._then);

  final AppDirectorState _self;
  final $Res Function(AppDirectorState) _then;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFirstLaunch = null,Object? storeUrlEn = null,Object? storeUrlTr = null,}) {
  return _then(_self.copyWith(
isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,storeUrlEn: null == storeUrlEn ? _self.storeUrlEn : storeUrlEn // ignore: cast_nullable_to_non_nullable
as String,storeUrlTr: null == storeUrlTr ? _self.storeUrlTr : storeUrlTr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppDirectorState].
extension AppDirectorStatePatterns on AppDirectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StateInitial value)?  initial,TResult Function( _StateLoading value)?  loading,TResult Function( _StateUpdateRequired value)?  updateRequired,TResult Function( _StateSuccess value)?  success,TResult Function( _StateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateUpdateRequired() when updateRequired != null:
return updateRequired(_that);case _StateSuccess() when success != null:
return success(_that);case _StateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StateInitial value)  initial,required TResult Function( _StateLoading value)  loading,required TResult Function( _StateUpdateRequired value)  updateRequired,required TResult Function( _StateSuccess value)  success,required TResult Function( _StateFailure value)  failure,}){
final _that = this;
switch (_that) {
case _StateInitial():
return initial(_that);case _StateLoading():
return loading(_that);case _StateUpdateRequired():
return updateRequired(_that);case _StateSuccess():
return success(_that);case _StateFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StateInitial value)?  initial,TResult? Function( _StateLoading value)?  loading,TResult? Function( _StateUpdateRequired value)?  updateRequired,TResult? Function( _StateSuccess value)?  success,TResult? Function( _StateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateUpdateRequired() when updateRequired != null:
return updateRequired(_that);case _StateSuccess() when success != null:
return success(_that);case _StateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr)?  initial,TResult Function( bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr,  UserYogaSalaPlus? userYogaSalaPlus)?  loading,TResult Function( bool isFirstLaunch,  String storeUrlEn,  String storeUrlTr)?  updateRequired,TResult Function( UserYogaSalaPlus userYogaSalaPlus,  bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr)?  success,TResult Function( Failure failure,  bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr,  UserYogaSalaPlus? userYogaSalaPlus)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr);case _StateLoading() when loading != null:
return loading(_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr,_that.userYogaSalaPlus);case _StateUpdateRequired() when updateRequired != null:
return updateRequired(_that.isFirstLaunch,_that.storeUrlEn,_that.storeUrlTr);case _StateSuccess() when success != null:
return success(_that.userYogaSalaPlus,_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr);case _StateFailure() when failure != null:
return failure(_that.failure,_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr,_that.userYogaSalaPlus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr)  initial,required TResult Function( bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr,  UserYogaSalaPlus? userYogaSalaPlus)  loading,required TResult Function( bool isFirstLaunch,  String storeUrlEn,  String storeUrlTr)  updateRequired,required TResult Function( UserYogaSalaPlus userYogaSalaPlus,  bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr)  success,required TResult Function( Failure failure,  bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr,  UserYogaSalaPlus? userYogaSalaPlus)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial(_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr);case _StateLoading():
return loading(_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr,_that.userYogaSalaPlus);case _StateUpdateRequired():
return updateRequired(_that.isFirstLaunch,_that.storeUrlEn,_that.storeUrlTr);case _StateSuccess():
return success(_that.userYogaSalaPlus,_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr);case _StateFailure():
return failure(_that.failure,_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr,_that.userYogaSalaPlus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr)?  initial,TResult? Function( bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr,  UserYogaSalaPlus? userYogaSalaPlus)?  loading,TResult? Function( bool isFirstLaunch,  String storeUrlEn,  String storeUrlTr)?  updateRequired,TResult? Function( UserYogaSalaPlus userYogaSalaPlus,  bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr)?  success,TResult? Function( Failure failure,  bool isFirstLaunch,  bool isAppUpdate,  String storeUrlEn,  String storeUrlTr,  UserYogaSalaPlus? userYogaSalaPlus)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr);case _StateLoading() when loading != null:
return loading(_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr,_that.userYogaSalaPlus);case _StateUpdateRequired() when updateRequired != null:
return updateRequired(_that.isFirstLaunch,_that.storeUrlEn,_that.storeUrlTr);case _StateSuccess() when success != null:
return success(_that.userYogaSalaPlus,_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr);case _StateFailure() when failure != null:
return failure(_that.failure,_that.isFirstLaunch,_that.isAppUpdate,_that.storeUrlEn,_that.storeUrlTr,_that.userYogaSalaPlus);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends AppDirectorState {
  const _StateInitial({this.isFirstLaunch = true, this.isAppUpdate = true, this.storeUrlEn = '', this.storeUrlTr = ''}): super._();
  

@override@JsonKey() final  bool isFirstLaunch;
@JsonKey() final  bool isAppUpdate;
@override@JsonKey() final  String storeUrlEn;
@override@JsonKey() final  String storeUrlTr;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateInitialCopyWith<_StateInitial> get copyWith => __$StateInitialCopyWithImpl<_StateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.isAppUpdate, isAppUpdate) || other.isAppUpdate == isAppUpdate)&&(identical(other.storeUrlEn, storeUrlEn) || other.storeUrlEn == storeUrlEn)&&(identical(other.storeUrlTr, storeUrlTr) || other.storeUrlTr == storeUrlTr));
}


@override
int get hashCode => Object.hash(runtimeType,isFirstLaunch,isAppUpdate,storeUrlEn,storeUrlTr);

@override
String toString() {
  return 'AppDirectorState.initial(isFirstLaunch: $isFirstLaunch, isAppUpdate: $isAppUpdate, storeUrlEn: $storeUrlEn, storeUrlTr: $storeUrlTr)';
}


}

/// @nodoc
abstract mixin class _$StateInitialCopyWith<$Res> implements $AppDirectorStateCopyWith<$Res> {
  factory _$StateInitialCopyWith(_StateInitial value, $Res Function(_StateInitial) _then) = __$StateInitialCopyWithImpl;
@override @useResult
$Res call({
 bool isFirstLaunch, bool isAppUpdate, String storeUrlEn, String storeUrlTr
});




}
/// @nodoc
class __$StateInitialCopyWithImpl<$Res>
    implements _$StateInitialCopyWith<$Res> {
  __$StateInitialCopyWithImpl(this._self, this._then);

  final _StateInitial _self;
  final $Res Function(_StateInitial) _then;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFirstLaunch = null,Object? isAppUpdate = null,Object? storeUrlEn = null,Object? storeUrlTr = null,}) {
  return _then(_StateInitial(
isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,isAppUpdate: null == isAppUpdate ? _self.isAppUpdate : isAppUpdate // ignore: cast_nullable_to_non_nullable
as bool,storeUrlEn: null == storeUrlEn ? _self.storeUrlEn : storeUrlEn // ignore: cast_nullable_to_non_nullable
as String,storeUrlTr: null == storeUrlTr ? _self.storeUrlTr : storeUrlTr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StateLoading extends AppDirectorState {
  const _StateLoading({this.isFirstLaunch = true, this.isAppUpdate = true, this.storeUrlEn = '', this.storeUrlTr = '', this.userYogaSalaPlus}): super._();
  

@override@JsonKey() final  bool isFirstLaunch;
@JsonKey() final  bool isAppUpdate;
@override@JsonKey() final  String storeUrlEn;
@override@JsonKey() final  String storeUrlTr;
 final  UserYogaSalaPlus? userYogaSalaPlus;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateLoadingCopyWith<_StateLoading> get copyWith => __$StateLoadingCopyWithImpl<_StateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.isAppUpdate, isAppUpdate) || other.isAppUpdate == isAppUpdate)&&(identical(other.storeUrlEn, storeUrlEn) || other.storeUrlEn == storeUrlEn)&&(identical(other.storeUrlTr, storeUrlTr) || other.storeUrlTr == storeUrlTr)&&(identical(other.userYogaSalaPlus, userYogaSalaPlus) || other.userYogaSalaPlus == userYogaSalaPlus));
}


@override
int get hashCode => Object.hash(runtimeType,isFirstLaunch,isAppUpdate,storeUrlEn,storeUrlTr,userYogaSalaPlus);

@override
String toString() {
  return 'AppDirectorState.loading(isFirstLaunch: $isFirstLaunch, isAppUpdate: $isAppUpdate, storeUrlEn: $storeUrlEn, storeUrlTr: $storeUrlTr, userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$StateLoadingCopyWith<$Res> implements $AppDirectorStateCopyWith<$Res> {
  factory _$StateLoadingCopyWith(_StateLoading value, $Res Function(_StateLoading) _then) = __$StateLoadingCopyWithImpl;
@override @useResult
$Res call({
 bool isFirstLaunch, bool isAppUpdate, String storeUrlEn, String storeUrlTr, UserYogaSalaPlus? userYogaSalaPlus
});




}
/// @nodoc
class __$StateLoadingCopyWithImpl<$Res>
    implements _$StateLoadingCopyWith<$Res> {
  __$StateLoadingCopyWithImpl(this._self, this._then);

  final _StateLoading _self;
  final $Res Function(_StateLoading) _then;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFirstLaunch = null,Object? isAppUpdate = null,Object? storeUrlEn = null,Object? storeUrlTr = null,Object? userYogaSalaPlus = freezed,}) {
  return _then(_StateLoading(
isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,isAppUpdate: null == isAppUpdate ? _self.isAppUpdate : isAppUpdate // ignore: cast_nullable_to_non_nullable
as bool,storeUrlEn: null == storeUrlEn ? _self.storeUrlEn : storeUrlEn // ignore: cast_nullable_to_non_nullable
as String,storeUrlTr: null == storeUrlTr ? _self.storeUrlTr : storeUrlTr // ignore: cast_nullable_to_non_nullable
as String,userYogaSalaPlus: freezed == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,
  ));
}


}

/// @nodoc


class _StateUpdateRequired extends AppDirectorState {
  const _StateUpdateRequired({this.isFirstLaunch = true, this.storeUrlEn = '', this.storeUrlTr = ''}): super._();
  

@override@JsonKey() final  bool isFirstLaunch;
@override@JsonKey() final  String storeUrlEn;
@override@JsonKey() final  String storeUrlTr;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateUpdateRequiredCopyWith<_StateUpdateRequired> get copyWith => __$StateUpdateRequiredCopyWithImpl<_StateUpdateRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateUpdateRequired&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.storeUrlEn, storeUrlEn) || other.storeUrlEn == storeUrlEn)&&(identical(other.storeUrlTr, storeUrlTr) || other.storeUrlTr == storeUrlTr));
}


@override
int get hashCode => Object.hash(runtimeType,isFirstLaunch,storeUrlEn,storeUrlTr);

@override
String toString() {
  return 'AppDirectorState.updateRequired(isFirstLaunch: $isFirstLaunch, storeUrlEn: $storeUrlEn, storeUrlTr: $storeUrlTr)';
}


}

/// @nodoc
abstract mixin class _$StateUpdateRequiredCopyWith<$Res> implements $AppDirectorStateCopyWith<$Res> {
  factory _$StateUpdateRequiredCopyWith(_StateUpdateRequired value, $Res Function(_StateUpdateRequired) _then) = __$StateUpdateRequiredCopyWithImpl;
@override @useResult
$Res call({
 bool isFirstLaunch, String storeUrlEn, String storeUrlTr
});




}
/// @nodoc
class __$StateUpdateRequiredCopyWithImpl<$Res>
    implements _$StateUpdateRequiredCopyWith<$Res> {
  __$StateUpdateRequiredCopyWithImpl(this._self, this._then);

  final _StateUpdateRequired _self;
  final $Res Function(_StateUpdateRequired) _then;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFirstLaunch = null,Object? storeUrlEn = null,Object? storeUrlTr = null,}) {
  return _then(_StateUpdateRequired(
isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,storeUrlEn: null == storeUrlEn ? _self.storeUrlEn : storeUrlEn // ignore: cast_nullable_to_non_nullable
as String,storeUrlTr: null == storeUrlTr ? _self.storeUrlTr : storeUrlTr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StateSuccess extends AppDirectorState {
  const _StateSuccess({required this.userYogaSalaPlus, this.isFirstLaunch = true, this.isAppUpdate = true, this.storeUrlEn = '', this.storeUrlTr = ''}): super._();
  

 final  UserYogaSalaPlus userYogaSalaPlus;
@override@JsonKey() final  bool isFirstLaunch;
@JsonKey() final  bool isAppUpdate;
@override@JsonKey() final  String storeUrlEn;
@override@JsonKey() final  String storeUrlTr;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&(identical(other.userYogaSalaPlus, userYogaSalaPlus) || other.userYogaSalaPlus == userYogaSalaPlus)&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.isAppUpdate, isAppUpdate) || other.isAppUpdate == isAppUpdate)&&(identical(other.storeUrlEn, storeUrlEn) || other.storeUrlEn == storeUrlEn)&&(identical(other.storeUrlTr, storeUrlTr) || other.storeUrlTr == storeUrlTr));
}


@override
int get hashCode => Object.hash(runtimeType,userYogaSalaPlus,isFirstLaunch,isAppUpdate,storeUrlEn,storeUrlTr);

@override
String toString() {
  return 'AppDirectorState.success(userYogaSalaPlus: $userYogaSalaPlus, isFirstLaunch: $isFirstLaunch, isAppUpdate: $isAppUpdate, storeUrlEn: $storeUrlEn, storeUrlTr: $storeUrlTr)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $AppDirectorStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@override @useResult
$Res call({
 UserYogaSalaPlus userYogaSalaPlus, bool isFirstLaunch, bool isAppUpdate, String storeUrlEn, String storeUrlTr
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,Object? isFirstLaunch = null,Object? isAppUpdate = null,Object? storeUrlEn = null,Object? storeUrlTr = null,}) {
  return _then(_StateSuccess(
userYogaSalaPlus: null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,isAppUpdate: null == isAppUpdate ? _self.isAppUpdate : isAppUpdate // ignore: cast_nullable_to_non_nullable
as bool,storeUrlEn: null == storeUrlEn ? _self.storeUrlEn : storeUrlEn // ignore: cast_nullable_to_non_nullable
as String,storeUrlTr: null == storeUrlTr ? _self.storeUrlTr : storeUrlTr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StateFailure extends AppDirectorState {
  const _StateFailure({required this.failure, this.isFirstLaunch = true, this.isAppUpdate = true, this.storeUrlEn = '', this.storeUrlTr = '', this.userYogaSalaPlus}): super._();
  

 final  Failure failure;
@override@JsonKey() final  bool isFirstLaunch;
@JsonKey() final  bool isAppUpdate;
@override@JsonKey() final  String storeUrlEn;
@override@JsonKey() final  String storeUrlTr;
 final  UserYogaSalaPlus? userYogaSalaPlus;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateFailureCopyWith<_StateFailure> get copyWith => __$StateFailureCopyWithImpl<_StateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateFailure&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.isAppUpdate, isAppUpdate) || other.isAppUpdate == isAppUpdate)&&(identical(other.storeUrlEn, storeUrlEn) || other.storeUrlEn == storeUrlEn)&&(identical(other.storeUrlTr, storeUrlTr) || other.storeUrlTr == storeUrlTr)&&(identical(other.userYogaSalaPlus, userYogaSalaPlus) || other.userYogaSalaPlus == userYogaSalaPlus));
}


@override
int get hashCode => Object.hash(runtimeType,failure,isFirstLaunch,isAppUpdate,storeUrlEn,storeUrlTr,userYogaSalaPlus);

@override
String toString() {
  return 'AppDirectorState.failure(failure: $failure, isFirstLaunch: $isFirstLaunch, isAppUpdate: $isAppUpdate, storeUrlEn: $storeUrlEn, storeUrlTr: $storeUrlTr, userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $AppDirectorStateCopyWith<$Res> {
  factory _$StateFailureCopyWith(_StateFailure value, $Res Function(_StateFailure) _then) = __$StateFailureCopyWithImpl;
@override @useResult
$Res call({
 Failure failure, bool isFirstLaunch, bool isAppUpdate, String storeUrlEn, String storeUrlTr, UserYogaSalaPlus? userYogaSalaPlus
});




}
/// @nodoc
class __$StateFailureCopyWithImpl<$Res>
    implements _$StateFailureCopyWith<$Res> {
  __$StateFailureCopyWithImpl(this._self, this._then);

  final _StateFailure _self;
  final $Res Function(_StateFailure) _then;

/// Create a copy of AppDirectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? isFirstLaunch = null,Object? isAppUpdate = null,Object? storeUrlEn = null,Object? storeUrlTr = null,Object? userYogaSalaPlus = freezed,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,isAppUpdate: null == isAppUpdate ? _self.isAppUpdate : isAppUpdate // ignore: cast_nullable_to_non_nullable
as bool,storeUrlEn: null == storeUrlEn ? _self.storeUrlEn : storeUrlEn // ignore: cast_nullable_to_non_nullable
as String,storeUrlTr: null == storeUrlTr ? _self.storeUrlTr : storeUrlTr // ignore: cast_nullable_to_non_nullable
as String,userYogaSalaPlus: freezed == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,
  ));
}


}

// dart format on
