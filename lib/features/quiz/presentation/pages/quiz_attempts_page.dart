import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/bloc/quiz_attempts_bloc.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/widgets/quiz_attempt_list_tile.dart';

/// Profile "My Quizzes": paginated completed attempts.
@RoutePage()
class QuizAttemptsPage extends StatefulWidget {
  /// Creates a [QuizAttemptsPage].
  const QuizAttemptsPage({super.key});

  @override
  State<QuizAttemptsPage> createState() => _QuizAttemptsPageState();
}

class _QuizAttemptsPageState extends State<QuizAttemptsPage> {
  late final QuizAttemptsBloc _bloc;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<QuizAttemptsBloc>()..add(const QuizAttemptsEvent.fetched());
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    unawaited(_bloc.close());
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = _bloc.state;
    if (!state.isSuccess || state.isLoadingMore || !state.hasMore) return;

    _bloc.add(const QuizAttemptsEvent.nextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          //title: Text('my_quizzes'.tr()),
          actions: const [],
        ),
        body: BlocConsumer<QuizAttemptsBloc, QuizAttemptsState>(
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
                onRetry: () => context.read<QuizAttemptsBloc>().add(
                  const QuizAttemptsEvent.fetched(),
                ),
              );
            }

            final attempts = state.attemptsOrEmpty;
            final loadingMore = state.isLoadingMore;
            final bottomInset = MediaQuery.paddingOf(context).bottom;

            if (attempts.isEmpty) {
              return Center(child: Text('my_quizzes_empty'.tr()));
            }

            return ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(
                bottom: bottomInset > 0 ? bottomInset : AppDimensions.p16,
              ),
              itemCount: attempts.length + (loadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= attempts.length) {
                  return const Padding(
                    padding: EdgeInsets.all(AppDimensions.p16),
                    child: Center(child: AppLoadingIndicator()),
                  );
                }
                return QuizAttemptListTile(attempt: attempts[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
