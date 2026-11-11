import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/enums/mux_status.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/presentation/bloc/video_bloc.dart';
import 'package:yogasala_plus_mobile/features/videos/presentation/widgets/video_box_image.dart';

class VideoContent extends StatelessWidget {
  const VideoContent({
    required this.video,
    required this.serieId,
    this.teacher,
    this.previousVideo,
    this.nextVideo,
    this.serieFree = false,
    this.hasQuiz = false,
    this.isFavoriteBusy = false,
  });

  final Video video;
  final int serieId;
  final Teacher? teacher;
  final Video? previousVideo;
  final Video? nextVideo;
  final bool serieFree;
  final bool hasQuiz;
  final bool isFavoriteBusy;

  Future<void> _openPlayer(BuildContext context, {required String title}) async {
    final entitlements = context.read<EntitlementsBloc>().state.entitlementsOrEmpty;
    final allowed = entitlements.canPlayPaidVideo(serieFree: serieFree);
    if (!allowed) {
      await context.router.push(
        PaywallRoute(
          highlightPlan: '${SubscriptionPlan.standard.wireValue}',
        ),
      );
      return;
    }
    await context.router.push(
      VideoPlayerRoute(
        videoId: video.id!,
        serieId: serieId,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final width = MediaQuery.sizeOf(context).width;
    final name = video.nameForLocale(locale).trim();
    final description = video.descriptionForLocale(locale).trim();
    final canPlay = video.id != null && video.muxStatus == MuxStatus.ready;
    final teacherName = teacher?.fullName.trim() ?? '';
    final teacherImageUrl = teacher?.imageUrl?.trim() ?? '';
    final previousId = previousVideo?.id;
    final nextId = nextVideo?.id;

    final duration = video.durationHhMmSs ?? '--:--:--';
    // final subtitle =
    //     '${'episode_number'.tr(args: ['$episodeNumber'])} - $duration';

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + AppDimensions.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: canPlay
                ? () => unawaited(_openPlayer(context, title: name))
                : null,
            child: Stack(
              children: [
                VideoBoxImage(
                  width: width,
                  height: width / AppDimensions.homeSerieCardAspectRatio,
                  imageUrl: video.displayImageUrl,
                ),
                if (canPlay)
                  const Positioned.fill(
                    child: Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(AppDimensions.p16),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: AppDimensions.iconSizeExtraLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.p24,
              AppDimensions.p16,
              AppDimensions.p24,
              AppDimensions.p8,
            ),
            child: Text(
              name,
              style: theme.textTheme.titleLarge,
            ),
          ),
          if (teacher != null && teacherName.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.p24,
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: AppDimensions.profileAvatarSizeSmall / 2,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage: teacherImageUrl.isNotEmpty
                        ? NetworkImage(teacherImageUrl)
                        : null,
                    child: teacherImageUrl.isEmpty
                        ? Icon(
                            Icons.image_not_supported_outlined,
                            size: AppDimensions.iconSizeMedium,
                            color: theme.colorScheme.onSurfaceVariant,
                          )
                        : null,
                  ),
                  const SizedBox(width: AppDimensions.p8),
                  Expanded(
                    child: Text(
                      teacherName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(AppDimensions.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _PlaybackControlButton(
                  asset: AppIcons.playPrevious,
                  enabled: previousId != null,
                  onTap: previousId == null
                      ? null
                      : () => unawaited(
                          context.router.root.replace(
                            VideoRoute(
                              videoId: previousId,
                              serieId: serieId,
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: AppDimensions.p48),
                _PlaybackControlButton(
                  asset: AppIcons.playCurrent,
                  enabled: canPlay,
                  onTap: canPlay
                      ? () => unawaited(_openPlayer(context, title: name))
                      : null,
                ),
                const SizedBox(width: AppDimensions.p48),
                _PlaybackControlButton(
                  asset: AppIcons.playNext,
                  enabled: nextId != null,
                  onTap: nextId == null
                      ? null
                      : () => unawaited(
                          context.router.root.replace(
                            VideoRoute(
                              videoId: nextId,
                              serieId: serieId,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.p24,
              vertical: AppDimensions.p16,
            ),

            child: Row(
              children: [
                if (hasQuiz && video.id != null) ...[
                  Expanded(
                    child: AppButton(
                      expanded: true,
                      boxColor: theme.colorScheme.onSurface,
                      size: AppButtonSize.small,
                      iconWidget: SvgIcon(
                        asset: AppIcons.quiz,
                        color: theme.colorScheme.surface,
                      ),
                      label: 'quiz'.tr(),
                      labelStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                      onPressed: () => unawaited(
                        context.router.root.push(
                          QuizRoute(videoId: video.id!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.p16),
                ],
                Expanded(
                  child: AppButton(
                    expanded: true,
                    boxColor: theme.colorScheme.onSurface,
                    size: AppButtonSize.small,
                    iconWidget: SvgIcon(
                      asset: AppIcons.sendSocial,
                      color: theme.colorScheme.surface,
                    ),
                    label: 'share'.tr(),
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                    onPressed: () => print('share'.tr()),
                  ),
                ),
                const SizedBox(width: AppDimensions.p16),
                Expanded(
                  child: AppButton(
                    expanded: true,
                    boxColor: theme.colorScheme.onSurface,
                    size: AppButtonSize.small,
                    iconWidget: SvgIcon(
                      asset: video.favorited
                          ? AppIcons.favoriteFilled
                          : AppIcons.favorite,
                      color: video.favorited
                          ? AppColors.red
                          : theme.colorScheme.surface,
                    ),
                    label: 'favorite'.tr(),
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                    onPressed: video.id == null || isFavoriteBusy
                        ? null
                        : () => context.read<VideoBloc>().add(
                            const VideoEvent.favoriteToggled(),
                          ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.p24,
              0,
              AppDimensions.p24,
              AppDimensions.p16,
            ),
            child: Text(
              description,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

/// Opaque hit target for sparse SVG playback icons.
class _PlaybackControlButton extends StatelessWidget {
  const _PlaybackControlButton({
    required this.asset,
    required this.enabled,
    this.onTap,
  });

  final String asset;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = enabled
        ? theme.colorScheme.onSurface
        : theme.colorScheme.surfaceContainerHigh;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: AppDimensions.iconSizeExtraLarge + AppDimensions.p16,
        height: AppDimensions.iconSizeExtraLarge + AppDimensions.p16,
        child: Center(
          child: SvgIcon(
            asset: asset,
            color: color,
            size: AppDimensions.iconSizeExtraLarge,
          ),
        ),
      ),
    );
  }
}
