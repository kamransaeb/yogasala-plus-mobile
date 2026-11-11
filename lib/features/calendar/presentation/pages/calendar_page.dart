import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:yogasala_plus_mobile/features/calendar/presentation/pages/calendar_form.dart';

/// Activity calendar tab.
@RoutePage()
class CalendarPage extends StatelessWidget {
  /// Creates a [CalendarPage].
  const CalendarPage({super.key});

  Future<void> _showActivityInfo(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final theme = Theme.of(dialogContext);
        final width = MediaQuery.sizeOf(dialogContext).width;

        // Same full-width layout as profile badge dialog.
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: width, maxWidth: width),
          title: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'calendar'.tr(),
                  style: theme.textTheme.titleLarge,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    variant: AppButtonVariant.icon,
                    iconWidget: const SvgIcon(
                      asset: AppIcons.arrowClose,
                    ),
                    onPressed: () => Navigator.of(dialogContext).pop(),
                  ),
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(top: AppDimensions.p16),
              child: Text(
                '* ${'calendar_activity_info'.tr()}',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocProvider(
      create: (_) => getIt<CalendarBloc>()..add(const CalendarEvent.fetched()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('calendar'.tr()),
          actions: [
            Tooltip(
              message: 'calendar_activity_info'.tr(),
              child: AppButton(
                variant: AppButtonVariant.icon,
                iconWidget: const Icon(Icons.info_outline),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.p24,
                ),
                onPressed: () => unawaited(_showActivityInfo(context)),
              ),
            ),
          ],
        ),
        body: const CalendarForm(),
      ),
    );
  }
}
