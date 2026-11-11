import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/features/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:yogasala_plus_mobile/features/leaderboard/presentation/widgets/leaderboard_list_tile.dart';

/// Paginated leaderboard list with infinite scroll.
class LeaderboardForm extends StatefulWidget {
  /// Creates a [LeaderboardForm].
  const LeaderboardForm({super.key});

  @override
  State<LeaderboardForm> createState() => _LeaderboardFormState();
}

class _LeaderboardFormState extends State<LeaderboardForm> {
  late final ScrollController _scrollController;
  late LeaderboardBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = context.read<LeaderboardBloc>();
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

    _bloc.add(const LeaderboardEvent.nextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocConsumer<LeaderboardBloc, LeaderboardState>(
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
            onRetry: () => context.read<LeaderboardBloc>().add(
              const LeaderboardEvent.fetched(),
            ),
          );
        }

        final entries = state.entriesOrEmpty;
        final bottomInset = MediaQuery.paddingOf(context).bottom;
        final loadingMore = state.isLoadingMore;

        if (entries.isEmpty) {
          return Center(child: Text('leaderboard_empty'.tr()));
        }

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            bottom: bottomInset > 0
                ? bottomInset + AppDimensions.p12
                : AppDimensions.p16 + kBottomNavigationBarHeight,
          ),
          itemCount: entries.length + (loadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= entries.length) {
              return const Padding(
                padding: EdgeInsets.all(AppDimensions.p24),
                child: Center(child: AppLoadingIndicator()),
              );
            }
            return LeaderboardListTile(
              entry: entries[index],
              rank: index + 1,
              badgeLevelOne: state.badgeLevelOneOrNull,
              badgeLevelTwo: state.badgeLevelTwoOrNull,
              badgeLevelThree: state.badgeLevelThreeOrNull,
            );
          },
        );
      },
    );
  }
}
