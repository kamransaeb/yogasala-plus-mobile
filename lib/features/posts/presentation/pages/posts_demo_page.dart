import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/posts/presentation/bloc/posts_bloc.dart';

/// The posts demo page widget.
@RoutePage()
class PostsDemoPage extends StatelessWidget {
  /// The constructor for the posts demo page widget.
  const PostsDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostsBloc>()..add(const PostsEvent.loadPost()),
      child: const _PostsDemoView(),
    );
  }
}

class _PostsDemoView extends StatelessWidget {
  const _PostsDemoView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous != current &&
          current.maybeWhen(
            unauthenticated: () => true,
            orElse: () => false,
          ),
      listener: (context, state) {
        unawaited(context.router.replace(LoginRoute()));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('posts_demo'.tr()),
          actions: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return IconButton(
                  icon: Icon(themeState.currentThemeStatus.icon),
                  onPressed: () => context.read<ThemeBloc>().add(
                    const ThemeEvent.toggleRequested(),
                  ),
                );
              },
            ),
            IconButton(
              tooltip: 'logout'.tr(),
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
              },
            ),
          ],
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: AppLoadingIndicator()),
              loaded: (post, posts) {
                if (post == null && posts.isEmpty) {
                  return AppEmptyView(
                    title: 'no_posts_found'.tr(),
                    message: 'tap_download_to_fetch_post'.tr(),
                    actionLabel: 'load_post'.tr(),
                    onAction: () => context.read<PostsBloc>().add(
                      const PostsEvent.loadPost(),
                    ),
                  );
                }
                return ListView(
                  padding: const EdgeInsets.all(AppDimensions.contentPadding),
                  children: [
                    if (post != null)
                      Text(
                        '${post.id} - ${post.title}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ...posts.map(
                      (p) => ListTile(
                        dense: true,
                        title: Text(p.title),
                        subtitle: Text('post_id'.tr(args: ['${p.id}'])),
                      ),
                    ),
                  ],
                );
              },
              error: (failure) => AppErrorView(
                title: 'something_went_wrong'.tr(),
                message: ErrorMapper.toUserMessage(failure),
                retryLabel: 'retry'.tr(),
                onRetry: () =>
                    context.read<PostsBloc>().add(const PostsEvent.loadPost()),
              ),
            );
          },
        ),
        floatingActionButton: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            final loading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppButton(
                  label: 'load_post'.tr(),
                  icon: Icons.cloud_download,
                  onPressed: () => context.read<PostsBloc>().add(
                    const PostsEvent.loadPost(),
                  ),
                ),
                AppSpacing.verticalSpacing8,
                AppButton(
                  label: 'refresh'.tr(),
                  icon: Icons.refresh,
                  variant: AppButtonVariant.tonal,
                  onPressed: () => context.read<PostsBloc>().add(
                    const PostsEvent.loadPost(forceRefresh: true),
                  ),
                ),
                AppSpacing.verticalSpacing8,
                AppButton(
                  label: 'load_posts'.tr(),
                  icon: Icons.list,
                  variant: AppButtonVariant.outlined,
                  onPressed: () => context.read<PostsBloc>().add(
                    const PostsEvent.loadPosts(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
