// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_agreements_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingAgreementsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAgreementsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingAgreementsEvent()';
}


}

/// @nodoc
class $OnboardingAgreementsEventCopyWith<$Res>  {
$OnboardingAgreementsEventCopyWith(OnboardingAgreementsEvent _, $Res Function(OnboardingAgreementsEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingAgreementsEvent].
extension OnboardingAgreementsEventPatterns on OnboardingAgreementsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventKvkkAgreed value)?  kvkkAgreed,TResult Function( _EventConsentAgreed value)?  consentAgreed,TResult Function( _EventCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventKvkkAgreed() when kvkkAgreed != null:
return kvkkAgreed(_that);case _EventConsentAgreed() when consentAgreed != null:
return consentAgreed(_that);case _EventCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventKvkkAgreed value)  kvkkAgreed,required TResult Function( _EventConsentAgreed value)  consentAgreed,required TResult Function( _EventCompleted value)  completed,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventKvkkAgreed():
return kvkkAgreed(_that);case _EventConsentAgreed():
return consentAgreed(_that);case _EventCompleted():
return completed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventKvkkAgreed value)?  kvkkAgreed,TResult? Function( _EventConsentAgreed value)?  consentAgreed,TResult? Function( _EventCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventKvkkAgreed() when kvkkAgreed != null:
return kvkkAgreed(_that);case _EventConsentAgreed() when consentAgreed != null:
return consentAgreed(_that);case _EventCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult Function( bool agreed)?  kvkkAgreed,TResult Function( bool agreed)?  consentAgreed,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventKvkkAgreed() when kvkkAgreed != null:
return kvkkAgreed(_that.agreed);case _EventConsentAgreed() when consentAgreed != null:
return consentAgreed(_that.agreed);case _EventCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserYogaSalaPlus userYogaSalaPlus)  fetched,required TResult Function( bool agreed)  kvkkAgreed,required TResult Function( bool agreed)  consentAgreed,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.userYogaSalaPlus);case _EventKvkkAgreed():
return kvkkAgreed(_that.agreed);case _EventConsentAgreed():
return consentAgreed(_that.agreed);case _EventCompleted():
return completed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult? Function( bool agreed)?  kvkkAgreed,TResult? Function( bool agreed)?  consentAgreed,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventKvkkAgreed() when kvkkAgreed != null:
return kvkkAgreed(_that.agreed);case _EventConsentAgreed() when consentAgreed != null:
return consentAgreed(_that.agreed);case _EventCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched implements OnboardingAgreementsEvent {
  const _EventFetched(this.userYogaSalaPlus);
  

 final  UserYogaSalaPlus userYogaSalaPlus;

/// Create a copy of OnboardingAgreementsEvent
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
  return 'OnboardingAgreementsEvent.fetched(userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $OnboardingAgreementsEventCopyWith<$Res> {
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

/// Create a copy of OnboardingAgreementsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,}) {
  return _then(_EventFetched(
null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,
  ));
}


}

/// @nodoc


class _EventKvkkAgreed implements OnboardingAgreementsEvent {
  const _EventKvkkAgreed({required this.agreed});
  

 final  bool agreed;

/// Create a copy of OnboardingAgreementsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventKvkkAgreedCopyWith<_EventKvkkAgreed> get copyWith => __$EventKvkkAgreedCopyWithImpl<_EventKvkkAgreed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventKvkkAgreed&&(identical(other.agreed, agreed) || other.agreed == agreed));
}


@override
int get hashCode => Object.hash(runtimeType,agreed);

@override
String toString() {
  return 'OnboardingAgreementsEvent.kvkkAgreed(agreed: $agreed)';
}


}

/// @nodoc
abstract mixin class _$EventKvkkAgreedCopyWith<$Res> implements $OnboardingAgreementsEventCopyWith<$Res> {
  factory _$EventKvkkAgreedCopyWith(_EventKvkkAgreed value, $Res Function(_EventKvkkAgreed) _then) = __$EventKvkkAgreedCopyWithImpl;
@useResult
$Res call({
 bool agreed
});




}
/// @nodoc
class __$EventKvkkAgreedCopyWithImpl<$Res>
    implements _$EventKvkkAgreedCopyWith<$Res> {
  __$EventKvkkAgreedCopyWithImpl(this._self, this._then);

  final _EventKvkkAgreed _self;
  final $Res Function(_EventKvkkAgreed) _then;

/// Create a copy of OnboardingAgreementsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? agreed = null,}) {
  return _then(_EventKvkkAgreed(
agreed: null == agreed ? _self.agreed : agreed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _EventConsentAgreed implements OnboardingAgreementsEvent {
  const _EventConsentAgreed({required this.agreed});
  

 final  bool agreed;

/// Create a copy of OnboardingAgreementsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventConsentAgreedCopyWith<_EventConsentAgreed> get copyWith => __$EventConsentAgreedCopyWithImpl<_EventConsentAgreed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventConsentAgreed&&(identical(other.agreed, agreed) || other.agreed == agreed));
}


@override
int get hashCode => Object.hash(runtimeType,agreed);

@override
String toString() {
  return 'OnboardingAgreementsEvent.consentAgreed(agreed: $agreed)';
}


}

/// @nodoc
abstract mixin class _$EventConsentAgreedCopyWith<$Res> implements $OnboardingAgreementsEventCopyWith<$Res> {
  factory _$EventConsentAgreedCopyWith(_EventConsentAgreed value, $Res Function(_EventConsentAgreed) _then) = __$EventConsentAgreedCopyWithImpl;
@useResult
$Res call({
 bool agreed
});




}
/// @nodoc
class __$EventConsentAgreedCopyWithImpl<$Res>
    implements _$EventConsentAgreedCopyWith<$Res> {
  __$EventConsentAgreedCopyWithImpl(this._self, this._then);

  final _EventConsentAgreed _self;
  final $Res Function(_EventConsentAgreed) _then;

/// Create a copy of OnboardingAgreementsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? agreed = null,}) {
  return _then(_EventConsentAgreed(
agreed: null == agreed ? _self.agreed : agreed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _EventCompleted implements OnboardingAgreementsEvent {
  const _EventCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingAgreementsEvent.completed()';
}


}




/// @nodoc
mixin _$OnboardingAgreementsState {

 UserYogaSalaPlus? get user; String get kvkkText; String get consentText; bool get kvkkAgreed; bool get consentAgreed; FormzSubmissionStatus get status; Failure? get failure;
/// Create a copy of OnboardingAgreementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingAgreementsStateCopyWith<OnboardingAgreementsState> get copyWith => _$OnboardingAgreementsStateCopyWithImpl<OnboardingAgreementsState>(this as OnboardingAgreementsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAgreementsState&&(identical(other.user, user) || other.user == user)&&(identical(other.kvkkText, kvkkText) || other.kvkkText == kvkkText)&&(identical(other.consentText, consentText) || other.consentText == consentText)&&(identical(other.kvkkAgreed, kvkkAgreed) || other.kvkkAgreed == kvkkAgreed)&&(identical(other.consentAgreed, consentAgreed) || other.consentAgreed == consentAgreed)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,user,kvkkText,consentText,kvkkAgreed,consentAgreed,status,failure);

@override
String toString() {
  return 'OnboardingAgreementsState(user: $user, kvkkText: $kvkkText, consentText: $consentText, kvkkAgreed: $kvkkAgreed, consentAgreed: $consentAgreed, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $OnboardingAgreementsStateCopyWith<$Res>  {
  factory $OnboardingAgreementsStateCopyWith(OnboardingAgreementsState value, $Res Function(OnboardingAgreementsState) _then) = _$OnboardingAgreementsStateCopyWithImpl;
@useResult
$Res call({
 UserYogaSalaPlus? user, String kvkkText, String consentText, bool kvkkAgreed, bool consentAgreed, FormzSubmissionStatus status, Failure? failure
});




}
/// @nodoc
class _$OnboardingAgreementsStateCopyWithImpl<$Res>
    implements $OnboardingAgreementsStateCopyWith<$Res> {
  _$OnboardingAgreementsStateCopyWithImpl(this._self, this._then);

  final OnboardingAgreementsState _self;
  final $Res Function(OnboardingAgreementsState) _then;

/// Create a copy of OnboardingAgreementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? kvkkText = null,Object? consentText = null,Object? kvkkAgreed = null,Object? consentAgreed = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,kvkkText: null == kvkkText ? _self.kvkkText : kvkkText // ignore: cast_nullable_to_non_nullable
as String,consentText: null == consentText ? _self.consentText : consentText // ignore: cast_nullable_to_non_nullable
as String,kvkkAgreed: null == kvkkAgreed ? _self.kvkkAgreed : kvkkAgreed // ignore: cast_nullable_to_non_nullable
as bool,consentAgreed: null == consentAgreed ? _self.consentAgreed : consentAgreed // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingAgreementsState].
extension OnboardingAgreementsStatePatterns on OnboardingAgreementsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingAgreementsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingAgreementsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingAgreementsState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingAgreementsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingAgreementsState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingAgreementsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  String kvkkText,  String consentText,  bool kvkkAgreed,  bool consentAgreed,  FormzSubmissionStatus status,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingAgreementsState() when $default != null:
return $default(_that.user,_that.kvkkText,_that.consentText,_that.kvkkAgreed,_that.consentAgreed,_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  String kvkkText,  String consentText,  bool kvkkAgreed,  bool consentAgreed,  FormzSubmissionStatus status,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _OnboardingAgreementsState():
return $default(_that.user,_that.kvkkText,_that.consentText,_that.kvkkAgreed,_that.consentAgreed,_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserYogaSalaPlus? user,  String kvkkText,  String consentText,  bool kvkkAgreed,  bool consentAgreed,  FormzSubmissionStatus status,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingAgreementsState() when $default != null:
return $default(_that.user,_that.kvkkText,_that.consentText,_that.kvkkAgreed,_that.consentAgreed,_that.status,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingAgreementsState extends OnboardingAgreementsState {
  const _OnboardingAgreementsState({this.user, this.kvkkText = '', this.consentText = '', this.kvkkAgreed = false, this.consentAgreed = false, this.status = FormzSubmissionStatus.initial, this.failure}): super._();
  

@override final  UserYogaSalaPlus? user;
@override@JsonKey() final  String kvkkText;
@override@JsonKey() final  String consentText;
@override@JsonKey() final  bool kvkkAgreed;
@override@JsonKey() final  bool consentAgreed;
@override@JsonKey() final  FormzSubmissionStatus status;
@override final  Failure? failure;

/// Create a copy of OnboardingAgreementsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingAgreementsStateCopyWith<_OnboardingAgreementsState> get copyWith => __$OnboardingAgreementsStateCopyWithImpl<_OnboardingAgreementsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingAgreementsState&&(identical(other.user, user) || other.user == user)&&(identical(other.kvkkText, kvkkText) || other.kvkkText == kvkkText)&&(identical(other.consentText, consentText) || other.consentText == consentText)&&(identical(other.kvkkAgreed, kvkkAgreed) || other.kvkkAgreed == kvkkAgreed)&&(identical(other.consentAgreed, consentAgreed) || other.consentAgreed == consentAgreed)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,user,kvkkText,consentText,kvkkAgreed,consentAgreed,status,failure);

@override
String toString() {
  return 'OnboardingAgreementsState(user: $user, kvkkText: $kvkkText, consentText: $consentText, kvkkAgreed: $kvkkAgreed, consentAgreed: $consentAgreed, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$OnboardingAgreementsStateCopyWith<$Res> implements $OnboardingAgreementsStateCopyWith<$Res> {
  factory _$OnboardingAgreementsStateCopyWith(_OnboardingAgreementsState value, $Res Function(_OnboardingAgreementsState) _then) = __$OnboardingAgreementsStateCopyWithImpl;
@override @useResult
$Res call({
 UserYogaSalaPlus? user, String kvkkText, String consentText, bool kvkkAgreed, bool consentAgreed, FormzSubmissionStatus status, Failure? failure
});




}
/// @nodoc
class __$OnboardingAgreementsStateCopyWithImpl<$Res>
    implements _$OnboardingAgreementsStateCopyWith<$Res> {
  __$OnboardingAgreementsStateCopyWithImpl(this._self, this._then);

  final _OnboardingAgreementsState _self;
  final $Res Function(_OnboardingAgreementsState) _then;

/// Create a copy of OnboardingAgreementsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? kvkkText = null,Object? consentText = null,Object? kvkkAgreed = null,Object? consentAgreed = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_OnboardingAgreementsState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,kvkkText: null == kvkkText ? _self.kvkkText : kvkkText // ignore: cast_nullable_to_non_nullable
as String,consentText: null == consentText ? _self.consentText : consentText // ignore: cast_nullable_to_non_nullable
as String,kvkkAgreed: null == kvkkAgreed ? _self.kvkkAgreed : kvkkAgreed // ignore: cast_nullable_to_non_nullable
as bool,consentAgreed: null == consentAgreed ? _self.consentAgreed : consentAgreed // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
