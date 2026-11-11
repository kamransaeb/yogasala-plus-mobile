import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/category_section.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_video_favorites_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_video_favorite_list_tile.dart';

/// Home favorites tab: paginated favorited videos with unfavorite action.
class HomeVideoFavoritesTab extends StatefulWidget {
  /// Creates a [HomeVideoFavoritesTab].
  const HomeVideoFavoritesTab({super.key});

  @override
  State<HomeVideoFavoritesTab> createState() => _HomeVideoFavoritesTabState();
}

class _HomeVideoFavoritesTabState extends State<HomeVideoFavoritesTab> {
  late final ScrollController _scrollController;
  late HomeVideoFavoritesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = context.read<HomeVideoFavoritesBloc>();
    // First paint (e.g. swipe) before a tab-button press.
    if (_bloc.state.maybeMap(initial: (_) => true, orElse: () => false)) {
      _bloc.add(const HomeVideoFavoritesEvent.fetched());
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = _bloc.state;
    if (!state.isSuccess || state.isLoadingMore || !state.hasMore) return;

    _bloc.add(const HomeVideoFavoritesEvent.nextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeVideoFavoritesBloc, HomeVideoFavoritesState>(
      listenWhen: (previous, current) =>
          previous.failureOrNull != current.failureOrNull ||
          previous.actionFailureOrNull != current.actionFailureOrNull,
      listener: (context, state) {
        final failure = state.failureOrNull ?? state.actionFailureOrNull;
        if (failure == null) return;
        AppFlushbar.showFailure(context, failure);
      },
      builder: (context, state) {
        final showLoading = state.maybeMap(
          initial: (_) => true,
          loading: (_) => true,
          orElse: () => false,
        );
        if (showLoading) {
          return const Center(child: AppLoadingIndicator());
        }
        if (state.isFailure) {
          return FailureView(
            failure: state.failureOrNull!,
            onRetry: () => context.read<HomeVideoFavoritesBloc>().add(
              const HomeVideoFavoritesEvent.fetched(),
            ),
          );
        }

        final videos = state.videosOrEmpty;
        if (videos.isEmpty) {
          return Center(child: Text('favorites'.tr()));
        }

        final categorySections =
            context.watch<HomeBloc>().state.categorySectionsOrEmpty;
        final unfavoritingIds = state.unfavoritingIdsOrEmpty;
        final bottomInset = MediaQuery.paddingOf(context).bottom;
        final loadingMore = state.isLoadingMore;

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            bottom: bottomInset > 0
                ? bottomInset
                : AppDimensions.p16 + kBottomNavigationBarHeight,
          ),
          itemCount: videos.length + (loadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= videos.length) {
              return const Padding(
                padding: EdgeInsets.all(AppDimensions.p16),
                child: Center(child: AppLoadingIndicator()),
              );
            }
            final video = videos[index];
            final videoId = video.id;
            return HomeVideoFavoriteListTile(
              video: video,
              serieId: videoId == null
                  ? null
                  : _serieIdForVideo(categorySections, videoId),
              isUnfavoriting:
                  videoId != null && unfavoritingIds.contains(videoId),
            );
          },
        );
      },
    );
  }

  int? _serieIdForVideo(List<CategorySection> sections, int videoId) {
    for (final section in sections) {
      for (final serie in section.series) {
        if (serie.id != null && serie.videoIds.contains(videoId)) {
          return serie.id;
        }
      }
    }
    return null;
  }
}
