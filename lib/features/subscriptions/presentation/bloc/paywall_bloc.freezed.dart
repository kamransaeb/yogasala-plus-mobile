// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paywall_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaywallEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallEvent()';
}


}

/// @nodoc
class $PaywallEventCopyWith<$Res>  {
$PaywallEventCopyWith(PaywallEvent _, $Res Function(PaywallEvent) __);
}


/// Adds pattern-matching-related methods to [PaywallEvent].
extension PaywallEventPatterns on PaywallEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventPurchaseRequested value)?  purchaseRequested,TResult Function( _EventRestoreRequested value)?  restoreRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventPurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that);case _EventRestoreRequested() when restoreRequested != null:
return restoreRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventPurchaseRequested value)  purchaseRequested,required TResult Function( _EventRestoreRequested value)  restoreRequested,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventPurchaseRequested():
return purchaseRequested(_that);case _EventRestoreRequested():
return restoreRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventPurchaseRequested value)?  purchaseRequested,TResult? Function( _EventRestoreRequested value)?  restoreRequested,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventPurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that);case _EventRestoreRequested() when restoreRequested != null:
return restoreRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SubscriptionPlan? highlightPlan)?  fetched,TResult Function( String packageId)?  purchaseRequested,TResult Function()?  restoreRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.highlightPlan);case _EventPurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that.packageId);case _EventRestoreRequested() when restoreRequested != null:
return restoreRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SubscriptionPlan? highlightPlan)  fetched,required TResult Function( String packageId)  purchaseRequested,required TResult Function()  restoreRequested,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.highlightPlan);case _EventPurchaseRequested():
return purchaseRequested(_that.packageId);case _EventRestoreRequested():
return restoreRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SubscriptionPlan? highlightPlan)?  fetched,TResult? Function( String packageId)?  purchaseRequested,TResult? Function()?  restoreRequested,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.highlightPlan);case _EventPurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that.packageId);case _EventRestoreRequested() when restoreRequested != null:
return restoreRequested();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched extends PaywallEvent {
  const _EventFetched({this.highlightPlan}): super._();
  

 final  SubscriptionPlan? highlightPlan;

/// Create a copy of PaywallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventFetchedCopyWith<_EventFetched> get copyWith => __$EventFetchedCopyWithImpl<_EventFetched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched&&(identical(other.highlightPlan, highlightPlan) || other.highlightPlan == highlightPlan));
}


@override
int get hashCode => Object.hash(runtimeType,highlightPlan);

@override
String toString() {
  return 'PaywallEvent.fetched(highlightPlan: $highlightPlan)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $PaywallEventCopyWith<$Res> {
  factory _$EventFetchedCopyWith(_EventFetched value, $Res Function(_EventFetched) _then) = __$EventFetchedCopyWithImpl;
@useResult
$Res call({
 SubscriptionPlan? highlightPlan
});




}
/// @nodoc
class __$EventFetchedCopyWithImpl<$Res>
    implements _$EventFetchedCopyWith<$Res> {
  __$EventFetchedCopyWithImpl(this._self, this._then);

  final _EventFetched _self;
  final $Res Function(_EventFetched) _then;

/// Create a copy of PaywallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? highlightPlan = freezed,}) {
  return _then(_EventFetched(
highlightPlan: freezed == highlightPlan ? _self.highlightPlan : highlightPlan // ignore: cast_nullable_to_non_nullable
as SubscriptionPlan?,
  ));
}


}

/// @nodoc


class _EventPurchaseRequested extends PaywallEvent {
  const _EventPurchaseRequested({required this.packageId}): super._();
  

 final  String packageId;

/// Create a copy of PaywallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventPurchaseRequestedCopyWith<_EventPurchaseRequested> get copyWith => __$EventPurchaseRequestedCopyWithImpl<_EventPurchaseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventPurchaseRequested&&(identical(other.packageId, packageId) || other.packageId == packageId));
}


@override
int get hashCode => Object.hash(runtimeType,packageId);

@override
String toString() {
  return 'PaywallEvent.purchaseRequested(packageId: $packageId)';
}


}

/// @nodoc
abstract mixin class _$EventPurchaseRequestedCopyWith<$Res> implements $PaywallEventCopyWith<$Res> {
  factory _$EventPurchaseRequestedCopyWith(_EventPurchaseRequested value, $Res Function(_EventPurchaseRequested) _then) = __$EventPurchaseRequestedCopyWithImpl;
@useResult
$Res call({
 String packageId
});




}
/// @nodoc
class __$EventPurchaseRequestedCopyWithImpl<$Res>
    implements _$EventPurchaseRequestedCopyWith<$Res> {
  __$EventPurchaseRequestedCopyWithImpl(this._self, this._then);

  final _EventPurchaseRequested _self;
  final $Res Function(_EventPurchaseRequested) _then;

/// Create a copy of PaywallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageId = null,}) {
  return _then(_EventPurchaseRequested(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventRestoreRequested extends PaywallEvent {
  const _EventRestoreRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventRestoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallEvent.restoreRequested()';
}


}




/// @nodoc
mixin _$PaywallState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallState()';
}


}

/// @nodoc
class $PaywallStateCopyWith<$Res>  {
$PaywallStateCopyWith(PaywallState _, $Res Function(PaywallState) __);
}


/// Adds pattern-matching-related methods to [PaywallState].
extension PaywallStatePatterns on PaywallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StateInitial value)?  initial,TResult Function( _StateLoading value)?  loading,TResult Function( _StateSuccess value)?  success,TResult Function( _StateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StateInitial value)  initial,required TResult Function( _StateLoading value)  loading,required TResult Function( _StateSuccess value)  success,required TResult Function( _StateFailure value)  failure,}){
final _that = this;
switch (_that) {
case _StateInitial():
return initial(_that);case _StateLoading():
return loading(_that);case _StateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StateInitial value)?  initial,TResult? Function( _StateLoading value)?  loading,TResult? Function( _StateSuccess value)?  success,TResult? Function( _StateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<SubscriptionPackage> packages,  SubscriptionPlan? highlightPlan,  bool isPurchasing,  bool isRestoring,  bool purchaseCompleted,  bool restoreCompleted,  Failure? actionFailure)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.packages,_that.highlightPlan,_that.isPurchasing,_that.isRestoring,_that.purchaseCompleted,_that.restoreCompleted,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<SubscriptionPackage> packages,  SubscriptionPlan? highlightPlan,  bool isPurchasing,  bool isRestoring,  bool purchaseCompleted,  bool restoreCompleted,  Failure? actionFailure)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateLoading():
return loading();case _StateSuccess():
return success(_that.packages,_that.highlightPlan,_that.isPurchasing,_that.isRestoring,_that.purchaseCompleted,_that.restoreCompleted,_that.actionFailure);case _StateFailure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<SubscriptionPackage> packages,  SubscriptionPlan? highlightPlan,  bool isPurchasing,  bool isRestoring,  bool purchaseCompleted,  bool restoreCompleted,  Failure? actionFailure)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.packages,_that.highlightPlan,_that.isPurchasing,_that.isRestoring,_that.purchaseCompleted,_that.restoreCompleted,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends PaywallState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallState.initial()';
}


}




/// @nodoc


class _StateLoading extends PaywallState {
  const _StateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallState.loading()';
}


}




/// @nodoc


class _StateSuccess extends PaywallState {
  const _StateSuccess({final  List<SubscriptionPackage> packages = const <SubscriptionPackage>[], this.highlightPlan, this.isPurchasing = false, this.isRestoring = false, this.purchaseCompleted = false, this.restoreCompleted = false, this.actionFailure}): _packages = packages,super._();
  

 final  List<SubscriptionPackage> _packages;
@JsonKey() List<SubscriptionPackage> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}

 final  SubscriptionPlan? highlightPlan;
@JsonKey() final  bool isPurchasing;
@JsonKey() final  bool isRestoring;
@JsonKey() final  bool purchaseCompleted;
@JsonKey() final  bool restoreCompleted;
 final  Failure? actionFailure;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&const DeepCollectionEquality().equals(other._packages, _packages)&&(identical(other.highlightPlan, highlightPlan) || other.highlightPlan == highlightPlan)&&(identical(other.isPurchasing, isPurchasing) || other.isPurchasing == isPurchasing)&&(identical(other.isRestoring, isRestoring) || other.isRestoring == isRestoring)&&(identical(other.purchaseCompleted, purchaseCompleted) || other.purchaseCompleted == purchaseCompleted)&&(identical(other.restoreCompleted, restoreCompleted) || other.restoreCompleted == restoreCompleted)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packages),highlightPlan,isPurchasing,isRestoring,purchaseCompleted,restoreCompleted,actionFailure);

@override
String toString() {
  return 'PaywallState.success(packages: $packages, highlightPlan: $highlightPlan, isPurchasing: $isPurchasing, isRestoring: $isRestoring, purchaseCompleted: $purchaseCompleted, restoreCompleted: $restoreCompleted, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $PaywallStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@useResult
$Res call({
 List<SubscriptionPackage> packages, SubscriptionPlan? highlightPlan, bool isPurchasing, bool isRestoring, bool purchaseCompleted, bool restoreCompleted, Failure? actionFailure
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packages = null,Object? highlightPlan = freezed,Object? isPurchasing = null,Object? isRestoring = null,Object? purchaseCompleted = null,Object? restoreCompleted = null,Object? actionFailure = freezed,}) {
  return _then(_StateSuccess(
packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPackage>,highlightPlan: freezed == highlightPlan ? _self.highlightPlan : highlightPlan // ignore: cast_nullable_to_non_nullable
as SubscriptionPlan?,isPurchasing: null == isPurchasing ? _self.isPurchasing : isPurchasing // ignore: cast_nullable_to_non_nullable
as bool,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,purchaseCompleted: null == purchaseCompleted ? _self.purchaseCompleted : purchaseCompleted // ignore: cast_nullable_to_non_nullable
as bool,restoreCompleted: null == restoreCompleted ? _self.restoreCompleted : restoreCompleted // ignore: cast_nullable_to_non_nullable
as bool,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _StateFailure extends PaywallState {
  const _StateFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateFailureCopyWith<_StateFailure> get copyWith => __$StateFailureCopyWithImpl<_StateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'PaywallState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $PaywallStateCopyWith<$Res> {
  factory _$StateFailureCopyWith(_StateFailure value, $Res Function(_StateFailure) _then) = __$StateFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$StateFailureCopyWithImpl<$Res>
    implements _$StateFailureCopyWith<$Res> {
  __$StateFailureCopyWithImpl(this._self, this._then);

  final _StateFailure _self;
  final $Res Function(_StateFailure) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
