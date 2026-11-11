import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_series_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_teachers_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_video_favorites_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/pages/home_categories_tab.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/pages/home_series_tab.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/pages/home_teachers_tab.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/pages/home_video_favorites_tab.dart';

/// Authenticated home: tabbed categories / series / teachers / favorites.
@RoutePage()
class HomePage extends StatelessWidget {
  /// Creates a [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tab uses maintainState: false — recreated on each visit and refetches.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<HomeBloc>()..add(const HomeEvent.fetched()),
        ),
        BlocProvider(create: (_) => getIt<HomeSeriesBloc>()),
        BlocProvider(create: (_) => getIt<HomeTeachersBloc>()),
        BlocProvider(create: (_) => getIt<HomeVideoFavoritesBloc>()),
      ],
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  static const _tabCount = 4;

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: _tabCount,
      child: _HomeScaffold(),
    );
  }
}

class _HomeScaffold extends StatelessWidget {
  const _HomeScaffold();

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.p24,
                0,
                AppDimensions.p24,
                AppDimensions.p16,
              ),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) => _HomeTabBar(controller: controller),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  HomeCategoriesTab(),
                  HomeSeriesTab(),
                  HomeTeachersTab(),
                  HomeVideoFavoritesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabBar extends StatelessWidget {
  const _HomeTabBar({required this.controller});

  final TabController controller;

  void _onTabPressed(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<HomeBloc>().add(const HomeEvent.fetched());
      case 1:
        context.read<HomeSeriesBloc>().add(const HomeSeriesEvent.fetched());
      case 2:
        context.read<HomeTeachersBloc>().add(const HomeTeachersEvent.fetched());
      case 3:
        context.read<HomeVideoFavoritesBloc>().add(
          const HomeVideoFavoritesEvent.fetched(),
        );
    }
    controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedIndex = controller.index;
    final labels = [
      'categories'.tr(),
      'series'.tr(),
      'teachers'.tr(),
      'favorites'.tr(),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < labels.length; i++) ...[
          if (i > 0) const SizedBox(width: AppDimensions.p8),
          Expanded(
            flex: labels[i].length.clamp(1, 100),
            child: _HomeTabButton(
              label: labels[i],
              selected: selectedIndex == i,
              onPressed: () => _onTabPressed(context, i),
              theme: theme,
            ),
          ),
        ],
      ],
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.label,
    required this.selected,
    required this.onPressed,
    required this.theme,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final onSurface = theme.colorScheme.onSurface;
    final surface = theme.colorScheme.surface;

    return AppButton(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.p8),
      expanded: true,
      variant: selected ? AppButtonVariant.filled : AppButtonVariant.outlined,
      boxColor: selected ? onSurface : null,
      borderColor: onSurface,
      size: AppButtonSize.small,
      label: label,
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: selected ? surface : onSurface,
      ),
      onPressed: onPressed,
    );
  }
}
