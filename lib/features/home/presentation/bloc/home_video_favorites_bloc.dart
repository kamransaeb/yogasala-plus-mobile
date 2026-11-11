import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/get_favorite_videos_use_case.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/remove_video_favorite_use_case.dart';

part 'home_video_favorites_event.dart';
part 'home_video_favorites_state.dart';
part 'home_video_favorites_bloc.freezed.dart';

/// Owns the home favorites tab: paginated list + unfavorite.
@injectable
class HomeVideoFavoritesBloc
    extends Bloc<HomeVideoFavoritesEvent, HomeVideoFavoritesState> {
  /// Creates a [HomeVideoFavoritesBloc].
  HomeVideoFavoritesBloc(
    this._getFavoriteVideos,
    this._removeVideoFavorite,
  ) : super(const HomeVideoFavoritesState.initial()) {
    on<_EventFetched>(
      _onFetched,
      transformer: restartable(),
    );
    on<_EventNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
    on<_EventUnfavoriteRequested>(_onUnfavoriteRequested);
  }

  final GetFavoriteVideosUseCase _getFavoriteVideos;
  final RemoveVideoFavoriteUseCase _removeVideoFavorite;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<HomeVideoFavoritesState> emit,
  ) async {
    await _loadPage(
      emit: emit,
      page: 0,
      append: false,
      showFullLoading: true,
    );
  }

  Future<void> _onNextPageRequested(
    _EventNextPageRequested event,
    Emitter<HomeVideoFavoritesState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isLoadingMore || !current.hasMore) {
      return;
    }

    await _loadPage(
      emit: emit,
      page: current.pageOrZero + 1,
      append: true,
      showFullLoading: false,
    );
  }

  Future<void> _loadPage({
    required Emitter<HomeVideoFavoritesState> emit,
    required int page,
    required bool append,
    required bool showFullLoading,
  }) async {
    final previousVideos = state.videosOrEmpty;
    final previousUnfavoritingIds = state.unfavoritingIdsOrEmpty;

    if (showFullLoading && !append) {
      emit(const HomeVideoFavoritesState.loading());
    } else if (append && state.isSuccess) {
      emit(
        HomeVideoFavoritesState.success(
          videos: previousVideos,
          page: state.pageOrZero,
          totalPages: state.totalPagesOrZero,
          isLoadingMore: true,
          unfavoritingIds: previousUnfavoritingIds,
        ),
      );
    }

    final result = await _getFavoriteVideos(
      GetFavoriteVideosParams(page: page),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (append && previousVideos.isNotEmpty) {
          emit(
            HomeVideoFavoritesState.success(
              videos: previousVideos,
              page: state.pageOrZero,
              totalPages: state.totalPagesOrZero,
              unfavoritingIds: previousUnfavoritingIds,
              actionFailure: failure,
            ),
          );
        } else {
          emit(HomeVideoFavoritesState.failure(failure: failure));
        }
      },
      (videoPage) {
        final videos = append
            ? [...previousVideos, ...videoPage.content]
            : videoPage.content;
        emit(
          HomeVideoFavoritesState.success(
            videos: videos,
            page: videoPage.page,
            totalPages: videoPage.totalPages,
            unfavoritingIds: previousUnfavoritingIds,
          ),
        );
      },
    );
  }

  Future<void> _onUnfavoriteRequested(
    _EventUnfavoriteRequested event,
    Emitter<HomeVideoFavoritesState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess) return;
    if (current.unfavoritingIdsOrEmpty.contains(event.videoId)) return;

    final previousVideos = current.videosOrEmpty;
    final previousPage = current.pageOrZero;
    final previousTotalPages = current.totalPagesOrZero;
    final optimisticVideos =
        previousVideos.where((v) => v.id != event.videoId).toList();
    final busyIds = {...current.unfavoritingIdsOrEmpty, event.videoId};

    emit(
      HomeVideoFavoritesState.success(
        videos: optimisticVideos,
        page: previousPage,
        totalPages: previousTotalPages,
        unfavoritingIds: busyIds,
      ),
    );

    final result = await _removeVideoFavorite(
      RemoveVideoFavoriteParams(id: event.videoId),
    );

    result.fold(
      (failure) {
        emit(
          HomeVideoFavoritesState.success(
            videos: previousVideos,
            page: previousPage,
            totalPages: previousTotalPages,
            unfavoritingIds: current.unfavoritingIdsOrEmpty,
            actionFailure: failure,
          ),
        );
      },
      (_) {
        final remainingBusy = {...busyIds}..remove(event.videoId);
        emit(
          HomeVideoFavoritesState.success(
            videos: optimisticVideos,
            page: previousPage,
            totalPages: previousTotalPages,
            unfavoritingIds: remainingBusy,
          ),
        );
      },
    );
  }
}
