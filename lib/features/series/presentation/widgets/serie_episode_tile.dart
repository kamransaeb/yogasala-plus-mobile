import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_box_image.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';

/// One episode row on the series page.
class SerieEpisodeTile extends StatelessWidget {
  /// Creates a [SerieEpisodeTile].
  const SerieEpisodeTile({
    required this.video,
    required this.episodeNumber,
    required this.serieId,
    super.key,
  });

  /// Episode video.
  final Video video;

  /// 1-based episode index.
  final int episodeNumber;

  /// Parent series id (playback access context).
  final int serieId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final name = video.nameForLocale(locale).trim();
    // final description = video.descriptionForLocale(locale).trim();
    const imageSize = AppDimensions.tileListImageSize;
    final duration = video.durationHhMmSs ?? '--:--:--';
    final subtitle =
        '${'episode_number'.tr(args: ['$episodeNumber'])} - $duration';
    final title = name.isEmpty ? '' : name;
    return ListTile(
      trailing: const Icon(
        Icons.more_horiz_sharp,
      ),
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
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall,
      ),

      onTap: video.id == null
          ? null
          : () => unawaited(
              context.router.push(
                VideoRoute(videoId: video.id!, serieId: serieId),
              ),
            ),
    );
  }
}
