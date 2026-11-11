import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/presentation/bloc/live_sessions_bloc.dart';

/// Month grid for picking which day of live sessions to load.
class LiveSessionsMonthCalendar extends StatelessWidget {
  /// Creates a [LiveSessionsMonthCalendar].
  const LiveSessionsMonthCalendar({
    required this.focusedMonth,
    required this.selectedDate,
    super.key,
  });

  /// Visible month (year + month).
  final DateTime focusedMonth;

  /// Currently selected day.
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MonthHeader(focusedMonth: focusedMonth),
        const SizedBox(height: AppDimensions.p16),
        const _WeekdayLabels(),
        const SizedBox(height: AppDimensions.p8),
        _MonthGrid(
          focusedMonth: focusedMonth,
          selectedDate: selectedDate,
        ),
      ],
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
              context.read<LiveSessionsBloc>().add(
                    LiveSessionsEvent.monthChanged(
                      year: prev.year,
                      month: prev.month,
                    ),
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
              context.read<LiveSessionsBloc>().add(
                    LiveSessionsEvent.monthChanged(
                      year: next.year,
                      month: next.month,
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}

class _WeekdayLabels extends StatelessWidget {
  const _WeekdayLabels();

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
    required this.selectedDate,
  });

  final DateTime focusedMonth;
  final DateTime selectedDate;

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
    final selectedKey = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

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
                      selectedKey: selectedKey,
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
    required DateTime selectedKey,
  }) {
    final dayNumber = cellIndex - leading + 1;
    if (dayNumber < 1 || dayNumber > daysInMonth) {
      return const SizedBox(height: 40);
    }

    final date = DateTime(focusedMonth.year, focusedMonth.month, dayNumber);
    final isToday = date == todayKey;
    final isSelected = date == selectedKey;
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 40,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              context.read<LiveSessionsBloc>().add(
                    LiveSessionsEvent.dateSelected(
                      year: date.year,
                      month: date.month,
                      day: date.day,
                    ),
                  );
            },
            child: Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? scheme.primary
                    : isToday
                        ? scheme.surfaceContainer
                        : null,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$dayNumber',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? scheme.onPrimary
                          : isToday
                              ? scheme.primary
                              : scheme.onSurface,
                      fontWeight: isSelected || isToday
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
