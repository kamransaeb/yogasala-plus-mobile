import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/widgets/quiz_question_view.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/widgets/quiz_results_view.dart';

/// Video quiz: one question per page, or read-only results when completed.
@RoutePage()
class QuizPage extends StatelessWidget {
  /// Creates a [QuizPage] for [videoId].
  const QuizPage({
    @PathParam('videoId') required this.videoId,
    super.key,
  });

  /// Video whose quiz is shown.
  final int videoId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<QuizBloc>(param1: videoId)..add(const QuizEvent.fetched()),
      child: const _QuizView(),
    );
  }
}

class _QuizView extends StatelessWidget {
  const _QuizView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('quiz'.tr()),
        actions: const [],
      ),
      body: BlocConsumer<QuizBloc, QuizState>(
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
              onRetry: () =>
                  context.read<QuizBloc>().add(const QuizEvent.fetched()),
            );
          }
          if (state.isEmpty) {
            return Center(child: Text('quiz_empty'.tr()));
          }

          final quiz = state.quizOrNull;
          if (quiz == null) return const SizedBox.shrink();

          if (state.showingResults) {
            return QuizResultsView(
              quiz: quiz,
              pointsAwarded: state.pointsAwardedOrNull,
              pointsBalance: state.pointsBalanceOrNull,
            );
          }

          return _QuizQuestionPager(state: state);
        },
      ),
    );
  }
}

/// PageView of questions; jumps to [QuizState.currentQuestionIndexOrZero].
class _QuizQuestionPager extends StatefulWidget {
  const _QuizQuestionPager({required this.state});

  final QuizState state;

  @override
  State<_QuizQuestionPager> createState() => _QuizQuestionPagerState();
}

class _QuizQuestionPagerState extends State<_QuizQuestionPager> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.state.currentQuestionIndexOrZero,
    );
  }

  @override
  void didUpdateWidget(covariant _QuizQuestionPager oldWidget) {
    super.didUpdateWidget(oldWidget);
    final nextIndex = widget.state.currentQuestionIndexOrZero;
    if (nextIndex == oldWidget.state.currentQuestionIndexOrZero) return;
    if (!_pageController.hasClients) return;
    unawaited(
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = widget.state.quizOrNull!;
    final currentIndex = widget.state.currentQuestionIndexOrZero;

    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quiz.questions.length,
      itemBuilder: (context, index) {
        final question = quiz.questions[index];
        return QuizQuestionView(
          quiz: quiz,
          question: question,
          questionIndex: index,
          isSubmitting: widget.state.isSubmitting && index == currentIndex,
          lastAnswerCorrect: question.isAnswered
              ? (index == currentIndex
                    ? widget.state.lastAnswerCorrectOrNull ??
                          (question.selectedAnswerId ==
                              question.correctAnswerId)
                    : question.selectedAnswerId == question.correctAnswerId)
              : null,
        );
      },
    );
  }
}
