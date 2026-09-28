// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_gender_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingGenderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingGenderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingGenderEvent()';
}


}

/// @nodoc
class $OnboardingGenderEventCopyWith<$Res>  {
$OnboardingGenderEventCopyWith(OnboardingGenderEvent _, $Res Function(OnboardingGenderEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingGenderEvent].
extension OnboardingGenderEventPatterns on OnboardingGenderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventGenderChanged value)?  genderChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventGenderChanged value)  genderChanged,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventGenderChanged():
return genderChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventGenderChanged value)?  genderChanged,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult Function( int gender)?  genderChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserYogaSalaPlus userYogaSalaPlus)  fetched,required TResult Function( int gender)  genderChanged,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.userYogaSalaPlus);case _EventGenderChanged():
return genderChanged(_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult? Function( int gender)?  genderChanged,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that.gender);case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched implements OnboardingGenderEvent {
  const _EventFetched(this.userYogaSalaPlus);
  

 final  UserYogaSalaPlus userYogaSalaPlus;

/// Create a copy of OnboardingGenderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventFetchedCopyWith<_EventFetched> get copyWith => __$EventFetchedCopyWithImpl<_EventFetched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched&&(identical(other.userYogaSalaPlus, userYogaSalaPlus) || other.userYogaSalaPlus == userYogaSalaPlus));
}


@override
int get hashCode => Object.hash(runtimeType,userYogaSalaPlus);

@override
String toString() {
  return 'OnboardingGenderEvent.fetched(userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $OnboardingGenderEventCopyWith<$Res> {
  factory _$EventFetchedCopyWith(_EventFetched value, $Res Function(_EventFetched) _then) = __$EventFetchedCopyWithImpl;
@useResult
$Res call({
 UserYogaSalaPlus userYogaSalaPlus
});




}
/// @nodoc
class __$EventFetchedCopyWithImpl<$Res>
    implements _$EventFetchedCopyWith<$Res> {
  __$EventFetchedCopyWithImpl(this._self, this._then);

  final _EventFetched _self;
  final $Res Function(_EventFetched) _then;

/// Create a copy of OnboardingGenderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,}) {
  return _then(_EventFetched(
null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,
  ));
}


}

/// @nodoc


class _EventGenderChanged implements OnboardingGenderEvent {
  const _EventGenderChanged(this.gender);
  

 final  int gender;

/// Create a copy of OnboardingGenderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventGenderChangedCopyWith<_EventGenderChanged> get copyWith => __$EventGenderChangedCopyWithImpl<_EventGenderChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventGenderChanged&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,gender);

@override
String toString() {
  return 'OnboardingGenderEvent.genderChanged(gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$EventGenderChangedCopyWith<$Res> implements $OnboardingGenderEventCopyWith<$Res> {
  factory _$EventGenderChangedCopyWith(_EventGenderChanged value, $Res Function(_EventGenderChanged) _then) = __$EventGenderChangedCopyWithImpl;
@useResult
$Res call({
 int gender
});




}
/// @nodoc
class __$EventGenderChangedCopyWithImpl<$Res>
    implements _$EventGenderChangedCopyWith<$Res> {
  __$EventGenderChangedCopyWithImpl(this._self, this._then);

  final _EventGenderChanged _self;
  final $Res Function(_EventGenderChanged) _then;

/// Create a copy of OnboardingGenderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gender = null,}) {
  return _then(_EventGenderChanged(
null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$OnboardingGenderState {

 UserYogaSalaPlus? get user; int get gender;
/// Create a copy of OnboardingGenderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingGenderStateCopyWith<OnboardingGenderState> get copyWith => _$OnboardingGenderStateCopyWithImpl<OnboardingGenderState>(this as OnboardingGenderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingGenderState&&(identical(other.user, user) || other.user == user)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,user,gender);

@override
String toString() {
  return 'OnboardingGenderState(user: $user, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $OnboardingGenderStateCopyWith<$Res>  {
  factory $OnboardingGenderStateCopyWith(OnboardingGenderState value, $Res Function(OnboardingGenderState) _then) = _$OnboardingGenderStateCopyWithImpl;
@useResult
$Res call({
 UserYogaSalaPlus? user, int gender
});




}
/// @nodoc
class _$OnboardingGenderStateCopyWithImpl<$Res>
    implements $OnboardingGenderStateCopyWith<$Res> {
  _$OnboardingGenderStateCopyWithImpl(this._self, this._then);

  final OnboardingGenderState _self;
  final $Res Function(OnboardingGenderState) _then;

/// Create a copy of OnboardingGenderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? gender = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingGenderState].
extension OnboardingGenderStatePatterns on OnboardingGenderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingGenderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingGenderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingGenderState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingGenderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingGenderState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingGenderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  int gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingGenderState() when $default != null:
return $default(_that.user,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  int gender)  $default,) {final _that = this;
switch (_that) {
case _OnboardingGenderState():
return $default(_that.user,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserYogaSalaPlus? user,  int gender)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingGenderState() when $default != null:
return $default(_that.user,_that.gender);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingGenderState implements OnboardingGenderState {
  const _OnboardingGenderState({this.user, this.gender = -1});
  

@override final  UserYogaSalaPlus? user;
@override@JsonKey() final  int gender;

/// Create a copy of OnboardingGenderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingGenderStateCopyWith<_OnboardingGenderState> get copyWith => __$OnboardingGenderStateCopyWithImpl<_OnboardingGenderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingGenderState&&(identical(other.user, user) || other.user == user)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,user,gender);

@override
String toString() {
  return 'OnboardingGenderState(user: $user, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$OnboardingGenderStateCopyWith<$Res> implements $OnboardingGenderStateCopyWith<$Res> {
  factory _$OnboardingGenderStateCopyWith(_OnboardingGenderState value, $Res Function(_OnboardingGenderState) _then) = __$OnboardingGenderStateCopyWithImpl;
@override @useResult
$Res call({
 UserYogaSalaPlus? user, int gender
});




}
/// @nodoc
class __$OnboardingGenderStateCopyWithImpl<$Res>
    implements _$OnboardingGenderStateCopyWith<$Res> {
  __$OnboardingGenderStateCopyWithImpl(this._self, this._then);

  final _OnboardingGenderState _self;
  final $Res Function(_OnboardingGenderState) _then;

/// Create a copy of OnboardingGenderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? gender = null,}) {
  return _then(_OnboardingGenderState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
