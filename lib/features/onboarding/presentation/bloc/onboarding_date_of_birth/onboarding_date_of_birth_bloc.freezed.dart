// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_date_of_birth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingDateOfBirthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingDateOfBirthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingDateOfBirthEvent()';
}


}

/// @nodoc
class $OnboardingDateOfBirthEventCopyWith<$Res>  {
$OnboardingDateOfBirthEventCopyWith(OnboardingDateOfBirthEvent _, $Res Function(OnboardingDateOfBirthEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingDateOfBirthEvent].
extension OnboardingDateOfBirthEventPatterns on OnboardingDateOfBirthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventDateOfBirthChanged value)?  dateOfBirthChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventDateOfBirthChanged value)  dateOfBirthChanged,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventDateOfBirthChanged():
return dateOfBirthChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventDateOfBirthChanged value)?  dateOfBirthChanged,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult Function( DateTime dateOfBirth)?  dateOfBirthChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserYogaSalaPlus userYogaSalaPlus)  fetched,required TResult Function( DateTime dateOfBirth)  dateOfBirthChanged,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.userYogaSalaPlus);case _EventDateOfBirthChanged():
return dateOfBirthChanged(_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult? Function( DateTime dateOfBirth)?  dateOfBirthChanged,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that.dateOfBirth);case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched implements OnboardingDateOfBirthEvent {
  const _EventFetched(this.userYogaSalaPlus);
  

 final  UserYogaSalaPlus userYogaSalaPlus;

/// Create a copy of OnboardingDateOfBirthEvent
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
  return 'OnboardingDateOfBirthEvent.fetched(userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $OnboardingDateOfBirthEventCopyWith<$Res> {
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

/// Create a copy of OnboardingDateOfBirthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,}) {
  return _then(_EventFetched(
null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,
  ));
}


}

/// @nodoc


class _EventDateOfBirthChanged implements OnboardingDateOfBirthEvent {
  const _EventDateOfBirthChanged(this.dateOfBirth);
  

 final  DateTime dateOfBirth;

/// Create a copy of OnboardingDateOfBirthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDateOfBirthChangedCopyWith<_EventDateOfBirthChanged> get copyWith => __$EventDateOfBirthChangedCopyWithImpl<_EventDateOfBirthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDateOfBirthChanged&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth);

@override
String toString() {
  return 'OnboardingDateOfBirthEvent.dateOfBirthChanged(dateOfBirth: $dateOfBirth)';
}


}

/// @nodoc
abstract mixin class _$EventDateOfBirthChangedCopyWith<$Res> implements $OnboardingDateOfBirthEventCopyWith<$Res> {
  factory _$EventDateOfBirthChangedCopyWith(_EventDateOfBirthChanged value, $Res Function(_EventDateOfBirthChanged) _then) = __$EventDateOfBirthChangedCopyWithImpl;
@useResult
$Res call({
 DateTime dateOfBirth
});




}
/// @nodoc
class __$EventDateOfBirthChangedCopyWithImpl<$Res>
    implements _$EventDateOfBirthChangedCopyWith<$Res> {
  __$EventDateOfBirthChangedCopyWithImpl(this._self, this._then);

  final _EventDateOfBirthChanged _self;
  final $Res Function(_EventDateOfBirthChanged) _then;

/// Create a copy of OnboardingDateOfBirthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dateOfBirth = null,}) {
  return _then(_EventDateOfBirthChanged(
null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$OnboardingDateOfBirthState {

 DateTime get dateOfBirth; UserYogaSalaPlus? get user;
/// Create a copy of OnboardingDateOfBirthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingDateOfBirthStateCopyWith<OnboardingDateOfBirthState> get copyWith => _$OnboardingDateOfBirthStateCopyWithImpl<OnboardingDateOfBirthState>(this as OnboardingDateOfBirthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingDateOfBirthState&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth,user);

@override
String toString() {
  return 'OnboardingDateOfBirthState(dateOfBirth: $dateOfBirth, user: $user)';
}


}

/// @nodoc
abstract mixin class $OnboardingDateOfBirthStateCopyWith<$Res>  {
  factory $OnboardingDateOfBirthStateCopyWith(OnboardingDateOfBirthState value, $Res Function(OnboardingDateOfBirthState) _then) = _$OnboardingDateOfBirthStateCopyWithImpl;
@useResult
$Res call({
 DateTime dateOfBirth, UserYogaSalaPlus? user
});




}
/// @nodoc
class _$OnboardingDateOfBirthStateCopyWithImpl<$Res>
    implements $OnboardingDateOfBirthStateCopyWith<$Res> {
  _$OnboardingDateOfBirthStateCopyWithImpl(this._self, this._then);

  final OnboardingDateOfBirthState _self;
  final $Res Function(OnboardingDateOfBirthState) _then;

/// Create a copy of OnboardingDateOfBirthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateOfBirth = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingDateOfBirthState].
extension OnboardingDateOfBirthStatePatterns on OnboardingDateOfBirthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingDateOfBirthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingDateOfBirthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingDateOfBirthState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingDateOfBirthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingDateOfBirthState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingDateOfBirthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime dateOfBirth,  UserYogaSalaPlus? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingDateOfBirthState() when $default != null:
return $default(_that.dateOfBirth,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime dateOfBirth,  UserYogaSalaPlus? user)  $default,) {final _that = this;
switch (_that) {
case _OnboardingDateOfBirthState():
return $default(_that.dateOfBirth,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime dateOfBirth,  UserYogaSalaPlus? user)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingDateOfBirthState() when $default != null:
return $default(_that.dateOfBirth,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingDateOfBirthState implements OnboardingDateOfBirthState {
  const _OnboardingDateOfBirthState({required this.dateOfBirth, this.user});
  

@override final  DateTime dateOfBirth;
@override final  UserYogaSalaPlus? user;

/// Create a copy of OnboardingDateOfBirthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingDateOfBirthStateCopyWith<_OnboardingDateOfBirthState> get copyWith => __$OnboardingDateOfBirthStateCopyWithImpl<_OnboardingDateOfBirthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingDateOfBirthState&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth,user);

@override
String toString() {
  return 'OnboardingDateOfBirthState(dateOfBirth: $dateOfBirth, user: $user)';
}


}

/// @nodoc
abstract mixin class _$OnboardingDateOfBirthStateCopyWith<$Res> implements $OnboardingDateOfBirthStateCopyWith<$Res> {
  factory _$OnboardingDateOfBirthStateCopyWith(_OnboardingDateOfBirthState value, $Res Function(_OnboardingDateOfBirthState) _then) = __$OnboardingDateOfBirthStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime dateOfBirth, UserYogaSalaPlus? user
});




}
/// @nodoc
class __$OnboardingDateOfBirthStateCopyWithImpl<$Res>
    implements _$OnboardingDateOfBirthStateCopyWith<$Res> {
  __$OnboardingDateOfBirthStateCopyWithImpl(this._self, this._then);

  final _OnboardingDateOfBirthState _self;
  final $Res Function(_OnboardingDateOfBirthState) _then;

/// Create a copy of OnboardingDateOfBirthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateOfBirth = null,Object? user = freezed,}) {
  return _then(_OnboardingDateOfBirthState(
dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,
  ));
}


}

// dart format on
