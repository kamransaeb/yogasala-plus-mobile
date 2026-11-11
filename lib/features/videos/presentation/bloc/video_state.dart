part of 'video_bloc.dart';

/// States for [VideoBloc].
@freezed
abstract class VideoState with _$VideoState {
  const VideoState._();

  /// Before first fetch.
  const factory VideoState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory VideoState.loading() = _StateLoading;

  /// Current episode, ordered serie list, and optional teacher.
  const factory VideoState.success({
    required Video video,
    @Default(<Video>[]) List<Video> videos,
    @Default(0) int currentIndex,
    Teacher? teacher,
    @Default(false) bool serieFree,
    @Default(false) bool hasQuiz,
    @Default(false) bool isFavoriteBusy,
    Failure? favoriteFailure,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory VideoState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Whether a favorite request is in flight.
  bool get isFavoriteBusy => maybeMap(
    success: (s) => s.isFavoriteBusy,
    orElse: () => false,
  );

  /// Whether this video has a quiz with questions.
  bool get hasQuiz => maybeMap(
    success: (s) => s.hasQuiz,
    orElse: () => false,
  );

  /// Whether the parent series is free (no VIDEO entitlement required).
  bool get serieFree => maybeMap(
    success: (s) => s.serieFree,
    orElse: () => false,
  );

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
    failure: (s) => s.failure,
    orElse: () => null,
  );

  /// Favorite action failure when success (for flushbar).
  Failure? get favoriteFailureOrNull => maybeMap(
    success: (s) => s.favoriteFailure,
    orElse: () => null,
  );

  /// Current video when success.
  Video? get videoOrNull => maybeMap(
    success: (s) => s.video,
    orElse: () => null,
  );

  /// Teacher when success (may be null).
  Teacher? get teacherOrNull => maybeMap(
    success: (s) => s.teacher,
    orElse: () => null,
  );

  /// Ordered episodes when success.
  List<Video> get videosOrEmpty => maybeMap(
    success: (s) => s.videos,
    orElse: () => const [],
  );

  /// Index of the current episode when success.
  int? get currentIndexOrNull => maybeMap(
    success: (s) => s.currentIndex,
    orElse: () => null,
  );

  /// Previous episode in the serie, if any.
  Video? get previousVideoOrNull => maybeMap(
    success: (s) {
      if (s.currentIndex <= 0) return null;
      return s.videos[s.currentIndex - 1];
    },
    orElse: () => null,
  );

  /// Next episode in the serie, if any.
  Video? get nextVideoOrNull => maybeMap(
    success: (s) {
      if (s.currentIndex >= s.videos.length - 1) return null;
      return s.videos[s.currentIndex + 1];
    },
    orElse: () => null,
  );
}
