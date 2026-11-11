import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/use_cases/get_video_quiz_use_case.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/use_cases/get_serie_by_id_use_case.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/use_cases/get_teacher_by_id_use_case.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/add_video_favorite_use_case.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/get_video_favorite_use_case.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/get_videos_by_serie_use_case.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/remove_video_favorite_use_case.dart';

part 'video_event.dart';
part 'video_state.dart';
part 'video_bloc.freezed.dart';

/// Owns video detail: current episode, teacher, and serie episode list.
@injectable
class VideoBloc extends Bloc<VideoEvent, VideoState> {
  /// Creates a [VideoBloc] for [videoId] within [serieId].
  VideoBloc(
    this._getSerieById,
    this._getVideosBySerie,
    this._getTeacherById,
    this._getVideoFavorite,
    this._addVideoFavorite,
    this._removeVideoFavorite,
    this._getVideoQuiz,
    @factoryParam this.videoId,
    @factoryParam this.serieId,
  ) : super(const VideoState.initial()) {
    on<_EventFetched>(_onFetched);
    on<_EventFavoriteToggled>(_onFavoriteToggled);
  }

  /// Episode to show.
  final int videoId;

  /// Parent series (episode list + deep-link context).
  final int serieId;

  final GetSerieByIdUseCase _getSerieById;
  final GetVideosBySerieUseCase _getVideosBySerie;
  final GetTeacherByIdUseCase _getTeacherById;
  final GetVideoFavoriteUseCase _getVideoFavorite;
  final AddVideoFavoriteUseCase _addVideoFavorite;
  final RemoveVideoFavoriteUseCase _removeVideoFavorite;
  final GetVideoQuizUseCase _getVideoQuiz;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<VideoState> emit,
  ) async {
    emit(const VideoState.loading());

    final settled = await Future.wait([
      _getSerieById(GetSerieByIdParams(id: serieId)),
      _getVideosBySerie(GetVideosBySerieParams(serieId: serieId)),
      _getVideoFavorite(GetVideoFavoriteParams(id: videoId)),
      _getVideoQuiz(GetVideoQuizParams(videoId: videoId)),
    ]);

    final serieResult = settled[0] as Either<Failure, Serie>;
    final videosResult = settled[1] as Either<Failure, List<Video>>;
    final favoriteResult = settled[2] as Either<Failure, Video>;
    final quizResult = settled[3] as Either<Failure, VideoQuiz>;

    final serieFailure = serieResult.fold((f) => f, (_) => null);
    if (serieFailure != null) {
      emit(VideoState.failure(failure: serieFailure));
      return;
    }

    final videosFailure = videosResult.fold((f) => f, (_) => null);
    if (videosFailure != null) {
      emit(VideoState.failure(failure: videosFailure));
      return;
    }

    final serie = serieResult.getOrElse(() => throw StateError('serie'));
    final videos = videosResult.getOrElse(() => const <Video>[]);
    final ordered = _ordered(videos, serie.videoIds);
    final index = ordered.indexWhere((v) => v.id == videoId);
    if (index < 0) {
      emit(
        VideoState.failure(
          failure: NotFoundFailure(
            resourceType: 'Video',
            identifier: '$videoId',
          ),
        ),
      );
      return;
    }

    var video = ordered[index];
    final teacherId = video.teacherId ?? serie.teacherId;
    final teacherResult = teacherId == null
        ? null
        : await _getTeacherById(GetTeacherByIdParams(id: teacherId));

    // Teacher / favorite / quiz are optional; ignore fetch failures.
    final teacher = teacherResult?.fold((_) => null, (t) => t);
    video = favoriteResult.fold(
      (_) => video,
      (favoriteVideo) => video.copyWith(favorited: favoriteVideo.favorited),
    );
    final hasQuiz = quizResult.fold(
      (_) => false,
      (quiz) => quiz.hasQuestions,
    );

    final updatedVideos = List<Video>.of(ordered)..[index] = video;

    emit(
      VideoState.success(
        video: video,
        videos: updatedVideos,
        currentIndex: index,
        teacher: teacher,
        serieFree: serie.free,
        hasQuiz: hasQuiz,
      ),
    );
  }

  Future<void> _onFavoriteToggled(
    _EventFavoriteToggled event,
    Emitter<VideoState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isFavoriteBusy) return;

    final video = current.videoOrNull;
    final id = video?.id;
    if (video == null || id == null) return;

    final nextFavorited = !video.favorited;
    final previousVideos = current.videosOrEmpty;
    final previousIndex = current.currentIndexOrNull ?? 0;
    final previousTeacher = current.teacherOrNull;

    final optimisticVideo = video.copyWith(favorited: nextFavorited);
    final optimisticVideos = List<Video>.of(previousVideos);
    if (previousIndex >= 0 && previousIndex < optimisticVideos.length) {
      optimisticVideos[previousIndex] = optimisticVideo;
    }

    final previousHasQuiz = current.hasQuiz;
    final previousSerieFree = current.serieFree;

    emit(
      VideoState.success(
        video: optimisticVideo,
        videos: optimisticVideos,
        currentIndex: previousIndex,
        teacher: previousTeacher,
        serieFree: previousSerieFree,
        hasQuiz: previousHasQuiz,
        isFavoriteBusy: true,
      ),
    );

    final result = nextFavorited
        ? await _addVideoFavorite(AddVideoFavoriteParams(id: id))
        : await _removeVideoFavorite(RemoveVideoFavoriteParams(id: id));

    result.fold(
      (failure) {
        emit(
          VideoState.success(
            video: video,
            videos: previousVideos,
            currentIndex: previousIndex,
            teacher: previousTeacher,
            serieFree: previousSerieFree,
            hasQuiz: previousHasQuiz,
            favoriteFailure: failure,
          ),
        );
      },
      (_) {
        emit(
          VideoState.success(
            video: optimisticVideo,
            videos: optimisticVideos,
            currentIndex: previousIndex,
            teacher: previousTeacher,
            serieFree: previousSerieFree,
            hasQuiz: previousHasQuiz,
          ),
        );
      },
    );
  }

  /// Prefer [serieVideoIds] order for next/prev; fall back to sortOrder.
  List<Video> _ordered(List<Video> videos, List<int> serieVideoIds) {
    if (serieVideoIds.isNotEmpty) {
      final byId = <int, Video>{
        for (final video in videos)
          if (video.id != null) video.id!: video,
      };
      final ordered = <Video>[
        for (final id in serieVideoIds)
          if (byId.containsKey(id)) byId[id]!,
      ];
      if (ordered.isNotEmpty) return ordered;
    }

    return List<Video>.of(videos)
      ..sort((a, b) {
        final aOrder = a.sortOrder ?? 1 << 30;
        final bOrder = b.sortOrder ?? 1 << 30;
        final byOrder = aOrder.compareTo(bOrder);
        if (byOrder != 0) return byOrder;
        return (a.id ?? 0).compareTo(b.id ?? 0);
      });
  }
}
