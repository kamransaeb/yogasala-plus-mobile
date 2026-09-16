import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// Custom Elevated Button
class CustomElevatedButton extends StatelessWidget {
  /// Custom Elevated Button
  const CustomElevatedButton({
    required this.onPressed,
    required this.child,
    this.elevatedButtonKey,
    this.color,
    this.minimumSize,
    this.outlineColor,
    super.key,
  });

  /// Constructor
  final VoidCallback? onPressed;

  /// Child
  final Widget child;

  /// Elevated Button Key
  final Key? elevatedButtonKey;

  /// Color
  final Color? color;

  /// Minimum Size
  final bool? minimumSize;

  /// Outline Color
  final Color? outlineColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: elevatedButtonKey,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.pagePadding,
        ),
        disabledBackgroundColor: AppColors.grey3,
        backgroundColor: color ?? AppColors.white,
        overlayColor: color ?? AppColors.white,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
        foregroundColor: color ?? AppColors.white,
        shadowColor: Colors.transparent,
        minimumSize: (minimumSize == null || minimumSize == true)
            ? const Size(AppDimensions.buttonWidth, AppDimensions.buttonHeight)
            : null,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
