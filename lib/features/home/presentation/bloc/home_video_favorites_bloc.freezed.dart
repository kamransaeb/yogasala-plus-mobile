// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_video_favorites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeVideoFavoritesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeVideoFavoritesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeVideoFavoritesEvent()';
}


}

/// @nodoc
class $HomeVideoFavoritesEventCopyWith<$Res>  {
$HomeVideoFavoritesEventCopyWith(HomeVideoFavoritesEvent _, $Res Function(HomeVideoFavoritesEvent) __);
}


/// Adds pattern-matching-related methods to [HomeVideoFavoritesEvent].
extension HomeVideoFavoritesEventPatterns on HomeVideoFavoritesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventNextPageRequested value)?  nextPageRequested,TResult Function( _EventUnfavoriteRequested value)?  unfavoriteRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case _EventUnfavoriteRequested() when unfavoriteRequested != null:
return unfavoriteRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventNextPageRequested value)  nextPageRequested,required TResult Function( _EventUnfavoriteRequested value)  unfavoriteRequested,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventNextPageRequested():
return nextPageRequested(_that);case _EventUnfavoriteRequested():
return unfavoriteRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventNextPageRequested value)?  nextPageRequested,TResult? Function( _EventUnfavoriteRequested value)?  unfavoriteRequested,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case _EventUnfavoriteRequested() when unfavoriteRequested != null:
return unfavoriteRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetched,TResult Function()?  nextPageRequested,TResult Function( int videoId)?  unfavoriteRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case _EventUnfavoriteRequested() when unfavoriteRequested != null:
return unfavoriteRequested(_that.videoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetched,required TResult Function()  nextPageRequested,required TResult Function( int videoId)  unfavoriteRequested,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched();case _EventNextPageRequested():
return nextPageRequested();case _EventUnfavoriteRequested():
return unfavoriteRequested(_that.videoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetched,TResult? Function()?  nextPageRequested,TResult? Function( int videoId)?  unfavoriteRequested,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case _EventUnfavoriteRequested() when unfavoriteRequested != null:
return unfavoriteRequested(_that.videoId);case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched extends HomeVideoFavoritesEvent {
  const _EventFetched(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeVideoFavoritesEvent.fetched()';
}


}




/// @nodoc


class _EventNextPageRequested extends HomeVideoFavoritesEvent {
  const _EventNextPageRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeVideoFavoritesEvent.nextPageRequested()';
}


}




/// @nodoc


class _EventUnfavoriteRequested extends HomeVideoFavoritesEvent {
  const _EventUnfavoriteRequested({required this.videoId}): super._();
  

 final  int videoId;

/// Create a copy of HomeVideoFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventUnfavoriteRequestedCopyWith<_EventUnfavoriteRequested> get copyWith => __$EventUnfavoriteRequestedCopyWithImpl<_EventUnfavoriteRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventUnfavoriteRequested&&(identical(other.videoId, videoId) || other.videoId == videoId));
}


@override
int get hashCode => Object.hash(runtimeType,videoId);

@override
String toString() {
  return 'HomeVideoFavoritesEvent.unfavoriteRequested(videoId: $videoId)';
}


}

/// @nodoc
abstract mixin class _$EventUnfavoriteRequestedCopyWith<$Res> implements $HomeVideoFavoritesEventCopyWith<$Res> {
  factory _$EventUnfavoriteRequestedCopyWith(_EventUnfavoriteRequested value, $Res Function(_EventUnfavoriteRequested) _then) = __$EventUnfavoriteRequestedCopyWithImpl;
@useResult
$Res call({
 int videoId
});




}
/// @nodoc
class __$EventUnfavoriteRequestedCopyWithImpl<$Res>
    implements _$EventUnfavoriteRequestedCopyWith<$Res> {
  __$EventUnfavoriteRequestedCopyWithImpl(this._self, this._then);

  final _EventUnfavoriteRequested _self;
  final $Res Function(_EventUnfavoriteRequested) _then;

/// Create a copy of HomeVideoFavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videoId = null,}) {
  return _then(_EventUnfavoriteRequested(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$HomeVideoFavoritesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeVideoFavoritesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeVideoFavoritesState()';
}


}

/// @nodoc
class $HomeVideoFavoritesStateCopyWith<$Res>  {
$HomeVideoFavoritesStateCopyWith(HomeVideoFavoritesState _, $Res Function(HomeVideoFavoritesState) __);
}


/// Adds pattern-matching-related methods to [HomeVideoFavoritesState].
extension HomeVideoFavoritesStatePatterns on HomeVideoFavoritesState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Video> videos,  int page,  int totalPages,  bool isLoadingMore,  Set<int> unfavoritingIds,  Failure? actionFailure)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.videos,_that.page,_that.totalPages,_that.isLoadingMore,_that.unfavoritingIds,_that.actionFailure);case _StateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Video> videos,  int page,  int totalPages,  bool isLoadingMore,  Set<int> unfavoritingIds,  Failure? actionFailure)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateLoading():
return loading();case _StateSuccess():
return success(_that.videos,_that.page,_that.totalPages,_that.isLoadingMore,_that.unfavoritingIds,_that.actionFailure);case _StateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Video> videos,  int page,  int totalPages,  bool isLoadingMore,  Set<int> unfavoritingIds,  Failure? actionFailure)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.videos,_that.page,_that.totalPages,_that.isLoadingMore,_that.unfavoritingIds,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends HomeVideoFavoritesState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeVideoFavoritesState.initial()';
}


}




/// @nodoc


class _StateLoading extends HomeVideoFavoritesState {
  const _StateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeVideoFavoritesState.loading()';
}


}




/// @nodoc


class _StateSuccess extends HomeVideoFavoritesState {
  const _StateSuccess({final  List<Video> videos = const <Video>[], this.page = 0, this.totalPages = 0, this.isLoadingMore = false, final  Set<int> unfavoritingIds = const <int>{}, this.actionFailure}): _videos = videos,_unfavoritingIds = unfavoritingIds,super._();
  

 final  List<Video> _videos;
@JsonKey() List<Video> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

@JsonKey() final  int page;
@JsonKey() final  int totalPages;
@JsonKey() final  bool isLoadingMore;
 final  Set<int> _unfavoritingIds;
@JsonKey() Set<int> get unfavoritingIds {
  if (_unfavoritingIds is EqualUnmodifiableSetView) return _unfavoritingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unfavoritingIds);
}

 final  Failure? actionFailure;

/// Create a copy of HomeVideoFavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&const DeepCollectionEquality().equals(other._videos, _videos)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&const DeepCollectionEquality().equals(other._unfavoritingIds, _unfavoritingIds)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videos),page,totalPages,isLoadingMore,const DeepCollectionEquality().hash(_unfavoritingIds),actionFailure);

@override
String toString() {
  return 'HomeVideoFavoritesState.success(videos: $videos, page: $page, totalPages: $totalPages, isLoadingMore: $isLoadingMore, unfavoritingIds: $unfavoritingIds, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $HomeVideoFavoritesStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@useResult
$Res call({
 List<Video> videos, int page, int totalPages, bool isLoadingMore, Set<int> unfavoritingIds, Failure? actionFailure
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of HomeVideoFavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? videos = null,Object? page = null,Object? totalPages = null,Object? isLoadingMore = null,Object? unfavoritingIds = null,Object? actionFailure = freezed,}) {
  return _then(_StateSuccess(
videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<Video>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,unfavoritingIds: null == unfavoritingIds ? _self._unfavoritingIds : unfavoritingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _StateFailure extends HomeVideoFavoritesState {
  const _StateFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of HomeVideoFavoritesState
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
  return 'HomeVideoFavoritesState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $HomeVideoFavoritesStateCopyWith<$Res> {
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

/// Create a copy of HomeVideoFavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
