import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/content_badge_background/content_badge_background.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_box_image.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

/// Single series card in the home horizontal list.
class HomeSerieListBox extends StatelessWidget {
  /// Creates a [HomeSerieListBox].
  const HomeSerieListBox({
    required this.serie,
    this.teacher,
    super.key,
  });

  /// Serie to display.
  final Serie serie;

  /// Teacher display name (`name surname`), if known.
  final Teacher? teacher;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = width * AppDimensions.homeSerieCardWidthFactor;
    final name = serie.nameForLocale(locale);
    final teacherName = teacher?.fullName.trim() ?? '';
    final teacherImageUrl = teacher?.imageUrl ?? '';
    final subtitle = teacherName.isNotEmpty
        ? teacherName
        : serie.descriptionForLocale(locale).trim();

    return GestureDetector(
      onTap: () {
        final id = serie.id;
        if (id == null) return;
        unawaited(context.router.root.push(SerieRoute(serieId: id)));
      },
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.only(
          left: AppDimensions.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: AppDimensions.homeSerieCardAspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  HomeSerieListBoxImage(
                    width: cardWidth,
                    height: cardWidth / AppDimensions.homeSerieCardAspectRatio,
                    imageUrl: serie.imageUrl,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!serie.free)
                        Padding(
                          padding: const EdgeInsets.all(
                            AppDimensions.p16,
                          ),
                          child: ContentBadgeBackground(
                            padding: AppDimensions.p4,
                            borderRadius: AppDimensions.circularBorderRadius,
                            child: SvgPicture.asset(
                              AppIcons.lock,
                              width: AppDimensions.iconSizeMedium,
                              height: AppDimensions.iconSizeMedium,
                              colorFilter: ColorFilter.mode(
                                theme.colorScheme.onSurface,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            AppDimensions.p16,
                          ),
                          child: ContentBadgeBackground(
                            padding: AppDimensions.p4,
                            borderRadius: AppDimensions.halfBorderRadius,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  serie.totalDurationHhMmSs ?? '--:--:--',
                                  style: theme.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.p8,
              ),
              child: Text(
                name.trim(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium,
              ),
            ),
            if (teacherImageUrl.isNotEmpty)
              GestureDetector(
                onTap: () {
                  final id = teacher?.id ?? serie.teacherId;
                  if (id == null) return;
                  unawaited(
                    context.router.root.push(
                      TeacherRoute(teacherId: id),
                    ),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: AppDimensions.profileAvatarSizeSmall / 2,
                      backgroundImage: NetworkImage(teacherImageUrl),
                      backgroundColor: theme.colorScheme.surface,
                    ),
                    const SizedBox(
                      width: AppDimensions.p8,
                    ),
                    Text(
                      teacherName,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            else if (subtitle.isNotEmpty)
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
