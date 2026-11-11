import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/presentation/bloc/profile_bloc.dart';

/// Profile header: avatar, full name, and email.
class ProfileUserTile extends StatelessWidget {
  /// Creates a [ProfileUserTile].
  const ProfileUserTile({required this.user, super.key});

  /// User to display.
  final UserYogaSalaPlus user;

  Future<void> _openProfileInfo(BuildContext context) async {
    final updated = await context.router.push<bool>(
      ProfileInfoRoute(userYogaSalaPlus: user),
    );
    if (updated == true && context.mounted) {
      context.read<ProfileBloc>().add(const ProfileEvent.fetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = user.profileImageUrl?.trim() ?? '';
    final fullName = [
      user.name?.trim() ?? '',
      user.surname?.trim() ?? '',
    ].where((part) => part.isNotEmpty).join(' ');
    //const avatarSize = AppDimensions.profileAvatarSizeSmall;

    return Row(
      children: [
        GestureDetector(
          onTap: () => _openProfileInfo(context),
          child: CircleAvatar(
            radius: AppDimensions.profileAvatarSizeSmall,
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
        ),
        AppSpacing.horizontalSpacing16,
        GestureDetector(
          onTap: () => _openProfileInfo(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName.isEmpty ? '—' : fullName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge,
              ),
              Text(
                user.email.trim().isEmpty ? '—' : user.email.trim(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
