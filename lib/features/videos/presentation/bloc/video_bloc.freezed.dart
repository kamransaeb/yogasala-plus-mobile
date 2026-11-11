// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoEvent()';
}


}

/// @nodoc
class $VideoEventCopyWith<$Res>  {
$VideoEventCopyWith(VideoEvent _, $Res Function(VideoEvent) __);
}


/// Adds pattern-matching-related methods to [VideoEvent].
extension VideoEventPatterns on VideoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventFavoriteToggled value)?  favoriteToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventFavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventFavoriteToggled value)  favoriteToggled,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventFavoriteToggled():
return favoriteToggled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventFavoriteToggled value)?  favoriteToggled,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventFavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetched,TResult Function()?  favoriteToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventFavoriteToggled() when favoriteToggled != null:
return favoriteToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetched,required TResult Function()  favoriteToggled,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched();case _EventFavoriteToggled():
return favoriteToggled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetched,TResult? Function()?  favoriteToggled,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventFavoriteToggled() when favoriteToggled != null:
return favoriteToggled();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched extends VideoEvent {
  const _EventFetched(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoEvent.fetched()';
}


}




/// @nodoc


class _EventFavoriteToggled extends VideoEvent {
  const _EventFavoriteToggled(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFavoriteToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoEvent.favoriteToggled()';
}


}




/// @nodoc
mixin _$VideoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoState()';
}


}

/// @nodoc
class $VideoStateCopyWith<$Res>  {
$VideoStateCopyWith(VideoState _, $Res Function(VideoState) __);
}


/// Adds pattern-matching-related methods to [VideoState].
extension VideoStatePatterns on VideoState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Video video,  List<Video> videos,  int currentIndex,  Teacher? teacher,  bool serieFree,  bool hasQuiz,  bool isFavoriteBusy,  Failure? favoriteFailure)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.video,_that.videos,_that.currentIndex,_that.teacher,_that.serieFree,_that.hasQuiz,_that.isFavoriteBusy,_that.favoriteFailure);case _StateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Video video,  List<Video> videos,  int currentIndex,  Teacher? teacher,  bool serieFree,  bool hasQuiz,  bool isFavoriteBusy,  Failure? favoriteFailure)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateLoading():
return loading();case _StateSuccess():
return success(_that.video,_that.videos,_that.currentIndex,_that.teacher,_that.serieFree,_that.hasQuiz,_that.isFavoriteBusy,_that.favoriteFailure);case _StateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Video video,  List<Video> videos,  int currentIndex,  Teacher? teacher,  bool serieFree,  bool hasQuiz,  bool isFavoriteBusy,  Failure? favoriteFailure)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.video,_that.videos,_that.currentIndex,_that.teacher,_that.serieFree,_that.hasQuiz,_that.isFavoriteBusy,_that.favoriteFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends VideoState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoState.initial()';
}


}




/// @nodoc


class _StateLoading extends VideoState {
  const _StateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VideoState.loading()';
}


}




/// @nodoc


class _StateSuccess extends VideoState {
  const _StateSuccess({required this.video, final  List<Video> videos = const <Video>[], this.currentIndex = 0, this.teacher, this.serieFree = false, this.hasQuiz = false, this.isFavoriteBusy = false, this.favoriteFailure}): _videos = videos,super._();
  

 final  Video video;
 final  List<Video> _videos;
@JsonKey() List<Video> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

@JsonKey() final  int currentIndex;
 final  Teacher? teacher;
@JsonKey() final  bool serieFree;
@JsonKey() final  bool hasQuiz;
@JsonKey() final  bool isFavoriteBusy;
 final  Failure? favoriteFailure;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other._videos, _videos)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.serieFree, serieFree) || other.serieFree == serieFree)&&(identical(other.hasQuiz, hasQuiz) || other.hasQuiz == hasQuiz)&&(identical(other.isFavoriteBusy, isFavoriteBusy) || other.isFavoriteBusy == isFavoriteBusy)&&(identical(other.favoriteFailure, favoriteFailure) || other.favoriteFailure == favoriteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,video,const DeepCollectionEquality().hash(_videos),currentIndex,teacher,serieFree,hasQuiz,isFavoriteBusy,favoriteFailure);

@override
String toString() {
  return 'VideoState.success(video: $video, videos: $videos, currentIndex: $currentIndex, teacher: $teacher, serieFree: $serieFree, hasQuiz: $hasQuiz, isFavoriteBusy: $isFavoriteBusy, favoriteFailure: $favoriteFailure)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $VideoStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@useResult
$Res call({
 Video video, List<Video> videos, int currentIndex, Teacher? teacher, bool serieFree, bool hasQuiz, bool isFavoriteBusy, Failure? favoriteFailure
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? video = null,Object? videos = null,Object? currentIndex = null,Object? teacher = freezed,Object? serieFree = null,Object? hasQuiz = null,Object? isFavoriteBusy = null,Object? favoriteFailure = freezed,}) {
  return _then(_StateSuccess(
video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as Video,videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<Video>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,teacher: freezed == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as Teacher?,serieFree: null == serieFree ? _self.serieFree : serieFree // ignore: cast_nullable_to_non_nullable
as bool,hasQuiz: null == hasQuiz ? _self.hasQuiz : hasQuiz // ignore: cast_nullable_to_non_nullable
as bool,isFavoriteBusy: null == isFavoriteBusy ? _self.isFavoriteBusy : isFavoriteBusy // ignore: cast_nullable_to_non_nullable
as bool,favoriteFailure: freezed == favoriteFailure ? _self.favoriteFailure : favoriteFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _StateFailure extends VideoState {
  const _StateFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of VideoState
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
  return 'VideoState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $VideoStateCopyWith<$Res> {
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

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
