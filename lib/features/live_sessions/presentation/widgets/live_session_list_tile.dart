import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_session.dart';

/// One upcoming live session row with Join / Upgrade / Opens-at CTA.
class LiveSessionListTile extends StatelessWidget {
  /// Creates a [LiveSessionListTile].
  const LiveSessionListTile({
    required this.session,
    required this.locale,
    required this.hasLiveEntitlement,
    required this.isJoining,
    required this.onJoin,
    required this.onUpgrade,
    super.key,
  });

  /// Session to display.
  final LiveSession session;

  /// App locale (`en` / `tr`).
  final String locale;

  /// Whether user has LIVE.
  final bool hasLiveEntitlement;

  /// Whether this row's join is in flight.
  final bool isJoining;

  /// Join tap (only when in window + has LIVE).
  final VoidCallback onJoin;

  /// Upgrade tap when missing LIVE.
  final VoidCallback onUpgrade;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final name = session.nameForLocale(locale);
    final teacher = session.teacherName?.trim() ?? '';
    final imageUrl = session.imageUrl?.trim() ?? '';
    final timeRange = _formatRange(context, session.startsAt, session.endsAt);
    final inWindow = session.isJoinWindowOpen;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.p16,
        vertical: AppDimensions.p8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.halfBorderRadius),
            child: SizedBox(
              width: AppDimensions.tileListImageSize,
              height: AppDimensions.tileListImageSize,
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => ColoredBox(
                        color: scheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.videocam_outlined,
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : ColoredBox(
                      color: scheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.videocam_outlined,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: AppDimensions.p12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
                if (teacher.isNotEmpty) ...[
                  const SizedBox(height: AppDimensions.p4),
                  Text(
                    teacher,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: AppDimensions.p4),
                Text(
                  timeRange,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: AppDimensions.p8),
                _buildCta(
                  context: context,
                  inWindow: inWindow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCta({
    required BuildContext context,
    required bool inWindow,
  }) {
    if (!hasLiveEntitlement) {
      return AppButton(
        variant: AppButtonVariant.outlined,
        size: AppButtonSize.small,
        label: 'upgrade_to_premium'.tr(),
        onPressed: onUpgrade,
      );
    }

    if (inWindow) {
      if (isJoining) {
        return const AppLoadingIndicator(size: AppLoadingSize.small);
      }
      return AppButton(
        size: AppButtonSize.small,
        label: 'join_live'.tr(),
        onPressed: onJoin,
      );
    }

    if (session.isBeforeJoinWindow) {
      final opensAt = DateFormat.MMMd(locale).add_Hm().format(
            session.startsAt.subtract(const Duration(minutes: 30)).toLocal(),
          );
      return Text(
        'live_opens_at'.tr(args: [opensAt]),
        style: Theme.of(context).textTheme.bodySmall,
      );
    }

    return Text(
      'live_join_closed'.tr(),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  String _formatRange(BuildContext context, DateTime start, DateTime end) {
    final localStart = start.toLocal();
    final localEnd = end.toLocal();
    final day = DateFormat.MMMd(locale).format(localStart);
    final from = DateFormat.Hm(locale).format(localStart);
    final to = DateFormat.Hm(locale).format(localEnd);
    return '$day · $from – $to';
  }
}
