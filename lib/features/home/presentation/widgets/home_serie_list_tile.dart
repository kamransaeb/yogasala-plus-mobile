import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_box_image.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

/// One series row in the home series list.
class HomeSerieListTile extends StatelessWidget {
  /// Creates a [HomeSerieListTile].
  const HomeSerieListTile({
    required this.series,
    this.teacher,
    super.key,
  });

  /// Serie to display.
  final Serie series;

  /// Teacher for this series, if known.
  final Teacher? teacher;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final name = series.nameForLocale(locale);
    const imageSize = AppDimensions.tileListImageSize;
    final teacherName = teacher?.fullName.trim() ?? '';
    final teacherImageUrl = teacher?.imageUrl?.trim() ?? '';

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.p24,
        vertical: AppDimensions.p8,
      ),
      trailing: const Icon(Icons.more_horiz_outlined),
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
            imageUrl: series.imageUrl,
          ),
        ),
      ),
      title: Text(
        name.trim(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: teacher != null && teacherName.isNotEmpty
          ? GestureDetector(
              onTap: () {
                final id = teacher?.id ?? series.teacherId;
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
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage: teacherImageUrl.isNotEmpty
                        ? NetworkImage(teacherImageUrl)
                        : null,
                    child: teacherImageUrl.isEmpty
                        ? Icon(
                            Icons.person,
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
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            )
          : null,
      onTap: () {
        final id = series.id;
        if (id == null) return;
        unawaited(context.router.root.push(SerieRoute(serieId: id)));
      },
    );
  }
}
