import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_series_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_tile.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_series_search_field.dart';

/// Home series tab: paginated series list with name search.
class HomeSeriesTab extends StatefulWidget {
  /// Creates a [HomeSeriesTab].
  const HomeSeriesTab({super.key});

  @override
  State<HomeSeriesTab> createState() => _HomeSeriesTabState();
}

class _HomeSeriesTabState extends State<HomeSeriesTab> {
  late final ScrollController _scrollController;
  late HomeSeriesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = context.read<HomeSeriesBloc>();
    // First paint (e.g. swipe) before a tab-button press.
    if (_bloc.state.maybeMap(initial: (_) => true, orElse: () => false)) {
      _bloc.add(const HomeSeriesEvent.fetched());
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

    _bloc.add(const HomeSeriesEvent.nextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.p24,
            0,
            AppDimensions.p24,
            AppDimensions.p8,
          ),
          child: HomeSeriesSearchField(),
        ),
        Expanded(
          child: BlocConsumer<HomeSeriesBloc, HomeSeriesState>(
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
                  onRetry: () => context.read<HomeSeriesBloc>().add(
                    const HomeSeriesEvent.fetched(),
                  ),
                );
              }

              final series = state.seriesOrEmpty;
              final teachersById = context
                  .watch<HomeBloc>()
                  .state
                  .teachersByIdOrEmpty;
              final bottomInset = MediaQuery.paddingOf(context).bottom;
              final loadingMore = state.isLoadingMore;

              if (series.isEmpty) {
                return Center(
                  child: Text(
                    state.queryOrEmpty.trim().isEmpty
                        ? 'series'.tr()
                        : 'search_series_empty'.tr(),
                  ),
                );
              }

              return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(
                  bottom: bottomInset > 0
                      ? bottomInset
                      : AppDimensions.p16 + kBottomNavigationBarHeight,
                ),
                itemCount: series.length + (loadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= series.length) {
                    return const Padding(
                      padding: EdgeInsets.all(AppDimensions.p16),
                      child: Center(child: AppLoadingIndicator()),
                    );
                  }
                  final serie = series[index];
                  return HomeSerieListTile(
                    series: serie,
                    teacher: teachersById[serie.teacherId],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
