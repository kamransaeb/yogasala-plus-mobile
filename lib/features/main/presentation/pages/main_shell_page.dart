import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';

/// Authenticated tab shell: Home, Live, Calendar, Leaderboard, Profile.
@RoutePage()
class MainShellPage extends StatelessWidget {
  /// Creates a [MainShellPage].
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return AutoTabsScaffold(
      extendBody: true, // body draws under the floating bar
      routes: const [
        HomeRoute(),
        LiveVideosRoute(),
        CalendarRoute(),
        LeaderboardRoute(),
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
          padding: EdgeInsets.fromLTRB(
            AppDimensions.p12,
            0,
            AppDimensions.p12,
            bottomInset > 0 ? AppDimensions.p12 : 0,
          ),
          snakeViewColor: scheme.primary,
          backgroundColor: scheme.surfaceBright,
          selectedItemColor: AppColors.white,
          unselectedItemColor: scheme.onSurfaceVariant,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: SvgIcon(
                asset: AppIcons.bottomNavigationPlay,
                size: AppDimensions.iconSizeLarge,
              ),
              activeIcon: SvgIcon(
                asset: AppIcons.bottomNavigationPlayFilled,
                size: AppDimensions.iconSizeLarge,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgIcon(
                asset: AppIcons.bottomNavigationLive,
                size: AppDimensions.iconSizeLarge,
              ),
              activeIcon: SvgIcon(
                asset: AppIcons.bottomNavigationLiveFilled,
                size: AppDimensions.iconSizeLarge,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgIcon(
                asset: AppIcons.bottomNavigationCalendar,
                size: AppDimensions.iconSizeLarge,
              ),
              activeIcon: SvgIcon(
                asset: AppIcons.bottomNavigationCalendarFilled,
                size: AppDimensions.iconSizeLarge,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgIcon(
                asset: AppIcons.bottomNavigationCup,
                size: AppDimensions.iconSizeLarge,
              ),
              activeIcon: SvgIcon(
                asset: AppIcons.bottomNavigationCupFilled,
                size: AppDimensions.iconSizeLarge,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgIcon(
                asset: AppIcons.bottomNavigationProfile,
                size: AppDimensions.iconSizeLarge,
              ),
              activeIcon: SvgIcon(
                asset: AppIcons.bottomNavigationProfileFilled,
                size: AppDimensions.iconSizeLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
