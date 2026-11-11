import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_video_favorites_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_box_image.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';

/// One favorited video row on the home favorites tab.
class HomeVideoFavoriteListTile extends StatelessWidget {
  /// Creates a [HomeVideoFavoriteListTile].
  const HomeVideoFavoriteListTile({
    required this.video,
    this.serieId,
    this.isUnfavoriting = false,
    super.key,
  });

  /// Favorited video.
  final Video video;

  /// Parent series id when known (needed for [VideoRoute]).
  final int? serieId;

  /// Whether an unfavorite request is in flight for this video.
  final bool isUnfavoriting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final name = video.nameForLocale(locale).trim();
    const imageSize = AppDimensions.tileListImageSize;
    final duration = video.durationHhMmSs ?? '--:--:--';
    final title = name.isEmpty ? '—' : name;
    final videoId = video.id;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.p24,
        vertical: AppDimensions.p8,
      ),
      leading: SizedBox(
        width: imageSize,
        height: imageSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.halfBorderRadius,
          ),
          child: HomeSerieListBoxImage(
            width: imageSize,
            height: imageSize,
            imageUrl: video.displayImageUrl,
          ),
        ),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        duration,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall,
      ),
      trailing: isUnfavoriting
          ? const AppLoadingIndicator(size: AppLoadingSize.small)
          : Tooltip(
              message: 'favorite'.tr(),
              child: AppButton(
                variant: AppButtonVariant.icon,
                iconWidget: const SvgIcon(asset: AppIcons.arrowClose),
                onPressed: videoId == null
                    ? null
                    : () => context.read<HomeVideoFavoritesBloc>().add(
                        HomeVideoFavoritesEvent.unfavoriteRequested(
                          videoId: videoId,
                        ),
                      ),
              ),
            ),
      onTap: videoId == null || serieId == null
          ? null
          : () => unawaited(
              context.router.root.push(
                VideoRoute(videoId: videoId, serieId: serieId!),
              ),
            ),
    );
  }
}
