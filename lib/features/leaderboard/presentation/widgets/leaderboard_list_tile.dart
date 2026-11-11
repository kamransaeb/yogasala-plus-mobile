import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_entry.dart';

/// One leaderboard row: rank, avatar, name, badges, points.
class LeaderboardListTile extends StatelessWidget {
  /// Creates a [LeaderboardListTile].
  const LeaderboardListTile({
    required this.entry,
    required this.rank,
    this.badgeLevelOne,
    this.badgeLevelTwo,
    this.badgeLevelThree,
    super.key,
  });

  /// Leaderboard entry to display.
  final UserPointsLeaderboardEntry entry;

  /// 1-based rank in the full list.
  final int rank;

  /// Points threshold for badge level one.
  final int? badgeLevelOne;

  /// Points threshold for badge level two.
  final int? badgeLevelTwo;

  /// Points threshold for badge level three.
  final int? badgeLevelThree;

  Color _badgeColor({
    required int points,
    required int? threshold,
    required ColorScheme scheme,
  }) {
    if (threshold != null && points > threshold) {
      return scheme.primary;
    }
    return scheme.surfaceContainerHighest;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final name = entry.fullName.trim();
    final imageUrl = entry.profileImageUrl?.trim() ?? '';
    const imageSize = AppDimensions.tileListImageSize / 2;
    final formattedBalance = NumberFormat.decimalPattern(
      context.locale.toString(),
    ).format(entry.balance);
    final badges = [
      (asset: AppIcons.badgeLevelOne, threshold: badgeLevelOne),
      (asset: AppIcons.badgeLevelTwo, threshold: badgeLevelTwo),
      (asset: AppIcons.badgeLevelThree, threshold: badgeLevelThree),
    ];

    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.p8,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              maxLines: 1,
              '$rank.',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.p8,
                vertical: AppDimensions.p8,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.circularBorderRadius),
                  bottomLeft: Radius.circular(
                    AppDimensions.circularBorderRadius,
                  ),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: imageSize,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage: imageUrl.isNotEmpty
                        ? NetworkImage(imageUrl)
                        : null,
                    child: imageUrl.isEmpty
                        ? Icon(
                            Icons.person,
                            size: AppDimensions.iconSizeLarge,
                            color: theme.colorScheme.onSurfaceVariant,
                          )
                        : null,
                  ),
                  const SizedBox(width: AppDimensions.p16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            for (final badge in badges) ...[
                              SvgIcon(
                                asset: badge.asset,
                                color: _badgeColor(
                                  points: entry.balance,
                                  threshold: badge.threshold,
                                  scheme: scheme,
                                ),
                              ),
                              const SizedBox(width: AppDimensions.p4),
                            ],
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  right: AppDimensions.p8,
                                ),
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  formattedBalance,
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppDimensions.p8),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            name.isEmpty ? '—' : name,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
