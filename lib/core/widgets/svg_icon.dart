import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// A widget that displays an SVG icon.
///
/// When [color] is null, uses [IconTheme] (so [ListTile] trailing/leading
/// follow light/dark) then [ColorScheme.onSurface].
class SvgIcon extends StatelessWidget {
  /// Creates a [SvgIcon].
  const SvgIcon({
    required this.asset,
    this.size = AppDimensions.iconSizeMedium,
    this.color,
    super.key,
  });

  /// The size of the icon.
  final double size;

  /// The asset path of the icon.
  final String asset;

  /// Optional tint. Null → theme / [IconTheme] color.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final resolved =
        color ??
        IconTheme.of(context).color ??
        Theme.of(context).colorScheme.onSurface;

    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(resolved, BlendMode.srcIn),
    );
  }
}
