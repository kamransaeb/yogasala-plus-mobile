import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';

/// Thumbnail for a video page.
class VideoBoxImage extends StatelessWidget {
  /// Creates a [VideoBoxImage].
  const VideoBoxImage({
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

    return ClipRRect(
      child: SizedBox(
        width: width,
        height: height,
        child: imageUrl == null || imageUrl!.isEmpty
            ? const Center(
                child: SvgIcon(
                  asset: AppIcons.image,
                  size: AppDimensions.iconSizeExtraExtraExtraLarge,
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
                      AppIcons.image,
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
