import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/presentation/widgets/serie_box_image.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

/// Serie hero image + localized title, teacher, and description.
class SerieHeader extends StatelessWidget {
  /// Creates a [SerieHeader].
  const SerieHeader({
    required this.serie,
    this.teacher,
    super.key,
  });

  /// Serie to display.
  final Serie serie;

  /// Teacher for this serie, if known.
  final Teacher? teacher;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final width = MediaQuery.sizeOf(context).width;
    final name = serie.nameForLocale(locale);
    final description = serie.descriptionForLocale(locale);
    final teacherName = teacher?.fullName.trim() ?? '';
    final teacherImageUrl = teacher?.imageUrl?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerieBoxImage(
          width: width,
          height: width / AppDimensions.homeSerieCardAspectRatio,
          imageUrl: serie.imageUrl,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.p24,
            AppDimensions.p16,
            AppDimensions.p24,
            AppDimensions.p8,
          ),
          child: Text(
            name.trim(),
            style: theme.textTheme.titleLarge,
          ),
        ),
        if (teacher != null && teacherName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.p24,
              0,
              AppDimensions.p24,
              AppDimensions.p8,
            ),
            child: GestureDetector(
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
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.p24,
            0,
            AppDimensions.p24,
            AppDimensions.p16,
          ),
          child: Text(
            description.trim(),
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
