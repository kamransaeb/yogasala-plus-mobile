import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_videos_list_box_image.dart';

/// Single video card in the home horizontal list.
class HomeVideosListBox extends StatelessWidget {
  /// Creates a [HomeVideosListBox].
  const HomeVideosListBox({required this.video, super.key});

  /// Video to display.
  final Video video;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final width = MediaQuery.sizeOf(context).width;
    const padding = AppDimensions.pagePadding;
    final cardWidth = width / 2;
    final name = video.nameForLocale(locale);

    return GestureDetector(
      onTap: () {
        // Video player feature not ported yet.
      },
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius / 2),
          color: theme.colorScheme.surfaceContainerHigh,
        ),
        margin: const EdgeInsets.all(padding / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                HomeVideosListBoxImage(
                  width: cardWidth,
                  height: cardWidth,
                  imageUrl: video.imageUrl,
                ),
                SizedBox(
                  width: cardWidth,
                  height: cardWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!video.free)
                        Padding(
                          padding: const EdgeInsets.all(padding / 4),
                          child: _Badge(
                            child: SvgPicture.asset(
                              AppAssetsIcons.lock,
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
                          padding: const EdgeInsets.all(padding / 4),
                          child: _Badge(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${video.minutes ?? '--'} m',
                                  style: theme.textTheme.titleSmall,
                                ),
                                const SizedBox(width: 4),
                                SvgPicture.asset(
                                  AppAssetsIcons.time,
                                  width: AppDimensions.iconSizeMedium,
                                  height: AppDimensions.iconSizeMedium,
                                  colorFilter: ColorFilter.mode(
                                    theme.colorScheme.onSurface,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: padding / 4,
                left: padding / 4,
                right: padding / 4,
              ),
              child: Text(
                name.trim(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppDimensions.pagePadding / 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius * 10),
      ),
      child: child,
    );
  }
}
