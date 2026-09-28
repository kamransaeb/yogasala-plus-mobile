import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// Thumbnail for a home video card.
class HomeVideosListBoxImage extends StatelessWidget {
  /// Creates a [HomeVideosListBoxImage].
  const HomeVideosListBoxImage({
    required this.width,
    required this.height,
    this.imageUrl,
    super.key,
  });

  /// Image width.
  final double width;

  /// Image height.
  final double height;

  /// Remote image URL; null shows a placeholder.
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const radius = Radius.circular(AppDimensions.borderRadius / 2);

    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: radius, topRight: radius),
      child: SizedBox(
        width: width,
        height: height,
        child: imageUrl == null || imageUrl!.isEmpty
            ? ColoredBox(
                color: theme.colorScheme.surface,
                child: Center(
                  child: SvgPicture.asset(
                    AppAssetsIcons.image,
                    width: AppDimensions.iconSizeExtraExtraLarge,
                    height: AppDimensions.iconSizeExtraExtraLarge,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.outlineVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                width: width,
                height: height,
                errorBuilder: (_, error, stackTrace) => ColoredBox(
                  color: theme.colorScheme.surface,
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssetsIcons.image,
                      width: AppDimensions.iconSizeExtraExtraLarge,
                      height: AppDimensions.iconSizeExtraExtraLarge,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.outlineVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
