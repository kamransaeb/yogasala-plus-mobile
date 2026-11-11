import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_day.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_streak.dart';
import 'package:yogasala_plus_mobile/features/calendar/presentation/bloc/calendar_bloc.dart';

/// Month grid with video / live activity markers.
class CalendarForm extends StatelessWidget {
  /// Creates a [CalendarForm].
  const CalendarForm({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocConsumer<CalendarBloc, CalendarState>(
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
                context.read<CalendarBloc>().add(const CalendarEvent.fetched()),
          );
        }

        final focused = state.focusedMonthOrNull ?? DateTime.now();
        final daysByDate = state.daysByDateOrEmpty;
        final streak = state.streakOrNull;
        final bottomInset = MediaQuery.paddingOf(context).bottom;

        return Stack(
          children: [
            ListView(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.p24,
                AppDimensions.p8,
                AppDimensions.p24,
                bottomInset > 0
                    ? bottomInset + AppDimensions.p12
                    : AppDimensions.p16 + kBottomNavigationBarHeight,
              ),
              children: [
                if (streak != null) ...[
                  _StreakBanner(streak: streak),
                  const SizedBox(height: AppDimensions.p16),
                ],
                _MonthHeader(focusedMonth: focused),
                const SizedBox(height: AppDimensions.p16),
                _WeekdayLabels(),
                const SizedBox(height: AppDimensions.p8),
                _MonthGrid(
                  focusedMonth: focused,
                  daysByDate: daysByDate,
                ),
                const SizedBox(height: AppDimensions.p24),
                const _ActivityLegend(),
              ],
            ),
            if (state.isRefreshing)
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(minHeight: 2),
              ),
          ],
        );
      },
    );
  }
}

class _StreakBanner extends StatelessWidget {
  const _StreakBanner({required this.streak});

  final UserActivityStreak streak;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final locale = context.locale.toString();
    final count = streak.currentStreak;
    final best = streak.bestStreak;
    final last = streak.lastActivityDate;

    final streakLabel = count > 0
        ? 'calendar_streak'.tr(args: [count.toString()])
        : 'calendar_streak_zero'.tr();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.p16,
        vertical: AppDimensions.p12,
      ),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.circularBorderRadius),
          topRight: Radius.circular(AppDimensions.circularBorderRadius),
        ),
      ),
      child: Column(
        children: [
          Text(
            streakLabel,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: scheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.p4),
          Text(
            'calendar_best_streak'.tr(args: [best.toString()]),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
          if (last != null) ...[
            const SizedBox(height: AppDimensions.p4),
            Text(
              'calendar_last_activity'.tr(
                args: [DateFormat.yMMMd(locale).format(last)],
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MonthHeader extends StatelessWidget {
  const _MonthHeader({required this.focusedMonth});

  final DateTime focusedMonth;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final title = DateFormat.yMMMM(locale).format(focusedMonth);

    return Row(
      children: [
        Tooltip(
          message: MaterialLocalizations.of(context).previousMonthTooltip,
          child: AppButton(
            variant: AppButtonVariant.icon,
            iconWidget: const Icon(Icons.chevron_left),
            padding: const EdgeInsets.all(AppDimensions.p8),
            onPressed: () {
              final prev = DateTime(focusedMonth.year, focusedMonth.month - 1);
              context.read<CalendarBloc>().add(
                CalendarEvent.monthChanged(year: prev.year, month: prev.month),
              );
            },
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Tooltip(
          message: MaterialLocalizations.of(context).nextMonthTooltip,
          child: AppButton(
            variant: AppButtonVariant.icon,
            iconWidget: const Icon(Icons.chevron_right),
            padding: const EdgeInsets.all(AppDimensions.p8),
            onPressed: () {
              final next = DateTime(focusedMonth.year, focusedMonth.month + 1);
              context.read<CalendarBloc>().add(
                CalendarEvent.monthChanged(year: next.year, month: next.month),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WeekdayLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    // Monday-first week to match Material calendar default.
    final labels = List<String>.generate(7, (index) {
      final date = DateTime(2024, 1, 1 + index); // Mon–Sun
      return DateFormat.E(locale).format(date);
    });
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return Row(
      children: [
        for (final label in labels)
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: style,
            ),
          ),
      ],
    );
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({
    required this.focusedMonth,
    required this.daysByDate,
  });

  final DateTime focusedMonth;
  final Map<DateTime, UserActivityDay> daysByDate;

  @override
  Widget build(BuildContext context) {
    final firstOfMonth = DateTime(focusedMonth.year, focusedMonth.month);
    final daysInMonth = DateTime(
      focusedMonth.year,
      focusedMonth.month + 1,
      0,
    ).day;
    // DateTime.weekday: Mon=1 … Sun=7 → leading blanks for Mon-first grid.
    final leading = firstOfMonth.weekday - 1;
    final totalCells = leading + daysInMonth;
    final rows = (totalCells / 7).ceil();
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);

    return Column(
      children: [
        for (var row = 0; row < rows; row++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.p4),
            child: Row(
              children: [
                for (var col = 0; col < 7; col++)
                  Expanded(
                    child: _buildCell(
                      context: context,
                      cellIndex: row * 7 + col,
                      leading: leading,
                      daysInMonth: daysInMonth,
                      todayKey: todayKey,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildCell({
    required BuildContext context,
    required int cellIndex,
    required int leading,
    required int daysInMonth,
    required DateTime todayKey,
  }) {
    final dayNumber = cellIndex - leading + 1;
    if (dayNumber < 1 || dayNumber > daysInMonth) {
      return const SizedBox(height: 48);
    }

    final date = DateTime(focusedMonth.year, focusedMonth.month, dayNumber);
    final activity = daysByDate[date];
    final isToday = date == todayKey;
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: isToday
                ? BoxDecoration(
                    //                    color: scheme.primary.withValues(alpha: 0.12),
                    color: scheme.surfaceContainer,

                    shape: BoxShape.circle,
                  )
                : null,
            child: Text(
              '$dayNumber',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isToday ? scheme.primary : scheme.onSurface,
                fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 2),
          _ActivityDots(activity: activity),
        ],
      ),
    );
  }
}

class _ActivityDots extends StatelessWidget {
  const _ActivityDots({this.activity});

  final UserActivityDay? activity;

  @override
  Widget build(BuildContext context) {
    if (activity == null || activity!.types.isEmpty) {
      return const SizedBox(height: 6);
    }

    return SizedBox(
      height: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (activity!.hasVideo) ...[
            const _Dot(color: AppColors.primary),
            if (activity!.hasLive) const SizedBox(width: 3),
          ],
          if (activity!.hasLive) const _Dot(color: AppColors.blue),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ActivityLegend extends StatelessWidget {
  const _ActivityLegend();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _Dot(color: AppColors.primary),
        const SizedBox(width: 6),
        Text('calendar_activity_video'.tr(), style: style),
        const SizedBox(width: AppDimensions.p16),
        const _Dot(color: AppColors.blue),
        const SizedBox(width: 6),
        Text('calendar_activity_live'.tr(), style: style),
      ],
    );
  }
}
