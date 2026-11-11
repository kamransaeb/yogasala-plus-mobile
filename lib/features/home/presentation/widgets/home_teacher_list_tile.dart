import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

/// One teacher row in the home teachers list.
class HomeTeacherListTile extends StatelessWidget {
  /// Creates a [HomeTeacherListTile].
  const HomeTeacherListTile({required this.teacher, super.key});

  /// Teacher to display.
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = teacher.fullName.trim();
    final imageUrl = teacher.imageUrl?.trim() ?? '';
    const imageSize = AppDimensions.tileListImageSize / 2;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.p24,
        vertical: AppDimensions.p8,
      ),
      trailing: const Icon(Icons.more_horiz_outlined),
      leading: CircleAvatar(
        radius: imageSize,
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
        child: imageUrl.isEmpty
            ? Icon(
                Icons.person,
                size: AppDimensions.iconSizeLarge,
                color: theme.colorScheme.onSurfaceVariant,
              )
            : null,
      ),
      title: Text(
        name.isEmpty ? '—' : name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium,
      ),
      onTap: () {
        final id = teacher.id;
        if (id == null) return;
        unawaited(context.router.root.push(TeacherRoute(teacherId: id)));
      },
    );
  }
}
