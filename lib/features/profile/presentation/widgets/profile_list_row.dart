import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';

/// Standard profile menu row: leading icon, label, and trailing action/value.
class ProfileListRow extends StatelessWidget {
  /// Creates a [ProfileListRow].
  const ProfileListRow({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
    super.key,
  });

  /// Leading SVG asset path.
  final String icon;

  /// Row title.
  final String label;

  /// Trailing widget; defaults to a chevron when null.
  final Widget? trailing;

  /// Optional tap handler.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final row = Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.p24),
      child: Row(
        children: [
          SvgIcon(
            asset: icon,
            size: AppDimensions.iconSizeLarge,
          ),
          AppSpacing.horizontalSpacing16,
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          AppSpacing.horizontalSpacing16,
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child:
                  trailing ??
                  const SvgIcon(
                    asset: AppIcons.arrowRight,
                    size: AppDimensions.iconSizeSmall,
                  ),
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return row;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: row,
    );
  }
}

/// Spacing + divider used between profile sections.
class ProfileSectionDivider extends StatelessWidget {
  /// Creates a [ProfileSectionDivider].
  const ProfileSectionDivider({super.key, this.topMargin, this.bottomMargin});

  /// Height of the divider.
  final double? topMargin;

  /// Bottom margin of the divider.
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: topMargin ?? AppDimensions.p8),
        const Divider(thickness: AppDimensions.dividerSizeSmall),
        SizedBox(height: bottomMargin ?? AppDimensions.p8),
      ],
    );
  }
}
