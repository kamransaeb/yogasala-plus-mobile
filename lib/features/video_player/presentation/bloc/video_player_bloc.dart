import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/use_cases/mark_user_activity_use_case.dart';
import 'package:yogasala_plus_mobile/features/points/presentation/bloc/points_bloc.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/entities/playback.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/use_cases/get_playback_use_case.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';
part 'video_player_bloc.freezed.dart';

/// Loads signed Mux playback for [videoId].
@injectable
class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  /// Creates a [VideoPlayerBloc].
  VideoPlayerBloc(
    this._getPlayback,
    this._markUserActivity,
    this._pointsBloc,
    this._logger,
    @factoryParam this.videoId,
    @factoryParam this.serieId,
  ) : super(const VideoPlayerState.initial()) {
    on<_EventFetched>(_onFetched);
    on<_EventVideoCompleted>(
      _onVideoCompleted,
      transformer: droppable(),
    );
  }

  /// Video to play.
  final int videoId;

  /// Optional series context for access checks.
  final int? serieId;

  final GetPlaybackUseCase _getPlayback;
  final MarkUserActivityUseCase _markUserActivity;
  final PointsBloc _pointsBloc;
  final LoggerService _logger;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<VideoPlayerState> emit,
  ) async {
    emit(const VideoPlayerState.loading());

    final result = await _getPlayback(
      GetPlaybackParams(videoId: videoId, serieId: serieId),
    );

    result.fold(
      (failure) => emit(VideoPlayerState.failure(failure: failure)),
      (playback) => emit(VideoPlayerState.success(playback: playback)),
    );
  }

  Future<void> _onVideoCompleted(
    _EventVideoCompleted event,
    Emitter<VideoPlayerState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess ||
        current.activityMarked ||
        current.isMarkingActivity) {
      return;
    }

    final playback = current.playbackOrNull;
    if (playback == null) return;

    emit(
      VideoPlayerState.success(
        playback: playback,
        isMarkingActivity: true,
      ),
    );

    final result = await _markUserActivity(
      const MarkUserActivityParams(type: ActivityType.video),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        _logger.w(
          'VIDEO activity mark failed: ${failure.message}',
        );
        emit(VideoPlayerState.success(playback: playback));
      },
      (_) {
        emit(
          VideoPlayerState.success(
            playback: playback,
            activityMarked: true,
          ),
        );
        // Streak-day awards update balance server-side; refresh shared cache.
        _pointsBloc.add(const PointsEvent.fetched());
      },
    );
  }
}
