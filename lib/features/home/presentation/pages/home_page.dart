import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_videos_list_horizontal_box.dart';

/// Authenticated home feed: video categories with horizontal lists.
@RoutePage()
class HomePage extends StatelessWidget {
  /// Creates a [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(const HomeEvent.fetched()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_videos'.tr()),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              final status = themeState.currentThemeStatus;
              return IconButton(
                tooltip: status.displayName,
                icon: Icon(status.icon),
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
              context.read<AuthBloc>().add(
                    const AuthEvent.logoutRequested(),
                  );
            },
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.isFailure != current.isFailure,
        listener: (context, state) {
          final failure = state.failureOrNull;
          if (failure == null) return;
          unawaited(
            Flushbar<void>(
              duration: const Duration(seconds: 3),
              title: 'failure'.tr(),
              message: ErrorMapper.toUserMessage(failure),
              flushbarPosition: FlushbarPosition.TOP,
            ).show(context),
          );
        },
        builder: (context, state) {
          final showLoading = state.maybeMap(
            initial: (_) => true,
            loading: (_) => true,
            orElse: () => false,
          );
          if (showLoading) {
            return const Center(child: AppLoadingIndicator());
          }
          if (state.isFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.pagePadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ErrorMapper.toUserMessage(state.failureOrNull!),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimensions.pagePadding),
                    FilledButton(
                      onPressed: () => context.read<HomeBloc>().add(
                            const HomeEvent.fetched(),
                          ),
                      child: Text('retry'.tr()),
                    ),
                  ],
                ),
              ),
            );
          }

          final sections = state.sectionsOrEmpty;
          if (sections.isEmpty) {
            return Center(child: Text('home_videos'.tr()));
          }

          return ListView.builder(
            padding: EdgeInsets.only(
              bottom: Platform.isIOS ? 0 : AppDimensions.pagePadding * 3,
            ),
            physics: const ClampingScrollPhysics(),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return HomeVideosListHorizontalBox(section: sections[index]);
            },
          );
        },
      ),
    );
  }
}
