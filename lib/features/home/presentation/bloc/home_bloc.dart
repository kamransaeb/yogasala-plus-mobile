import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category_section.dart';
import 'package:yogasala_plus_mobile/features/home/domain/usecases/get_videos_category_list_enabled_use_case.dart';
import 'package:yogasala_plus_mobile/features/home/domain/usecases/get_videos_list_enabled_by_category_ids_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

/// Owns the authenticated home video feed.
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Creates a [HomeBloc].
  HomeBloc(
    this._getVideosCategoryListEnabled,
    this._getVideosListEnabledByCategoryIds,
  ) : super(const HomeState.initial()) {
    on<_EventFetched>(_onFetched);
  }

  final GetVideosCategoryListEnabledUseCase _getVideosCategoryListEnabled;
  final GetVideosListEnabledByCategoryIdsUseCase
  _getVideosListEnabledByCategoryIds;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());

    final categoriesResult = await _getVideosCategoryListEnabled(
      const NoParams(),
    );

    await categoriesResult.fold(
      (failure) async => emit(HomeState.failure(failure: failure)),
      (categories) async {
        if (categories.isEmpty) {
          emit(const HomeState.success());
          return;
        }

        final categoryIds = categories
            .map((c) => c.id)
            .whereType<int>()
            .toList();

        if (categoryIds.isEmpty) {
          emit(const HomeState.success());
          return;
        }

        final videosResult = await _getVideosListEnabledByCategoryIds(
          GetVideosListEnabledByCategoryIdsParams(
            videosCategoryIdList: categoryIds,
          ),
        );

        videosResult.fold(
          (failure) => emit(HomeState.failure(failure: failure)),
          (videos) {
            final sections = <VideoCategorySection>[];
            for (final category in categories) {
              final id = category.id;
              if (id == null) continue;
              final categoryVideos = videos
                  .where((v) => v.videosCategoryId == id)
                  .toList();
              if (categoryVideos.isEmpty) continue;
              sections.add(
                VideoCategorySection(
                  category: category,
                  videos: categoryVideos,
                ),
              );
            }
            emit(HomeState.success(sections: sections));
          },
        );
      },
    );
  }
}
