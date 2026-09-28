import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';

/// Authenticated tab shell: Home feed + Profile with snake bottom navigation.
@RoutePage()
class MainShellPage extends StatelessWidget {
  /// Creates a [MainShellPage].
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.circularBorderRadius),
            ),
          ),
          elevation: 3,
          shadowColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.grey2
              : Colors.black,

          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.pagePadding,
          ),
          snakeViewColor: scheme.primary,
          backgroundColor: scheme.surfaceBright,
          selectedItemColor: AppColors.white, //scheme.primary,
          unselectedItemColor: scheme.onSurfaceVariant,
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          //height: AppDimensions.buttonHeight + AppDimensions.p8,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library),
              //label: 'home_videos'.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              //label: 'profile'.tr(),
            ),
          ],
        );
      },
    );
  }
}
