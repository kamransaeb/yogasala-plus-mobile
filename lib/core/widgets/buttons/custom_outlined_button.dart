import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// Custom Outlined Button
class CustomOutlinedButton extends StatelessWidget {
  /// Constructor
  const CustomOutlinedButton({
    required this.onPressed,
    required this.child,
    this.outlinedButtonKey,
    this.color,
    this.minimumSize,
    this.outlineColor,
    super.key,
  });

  /// Custom Outlined Button
  final VoidCallback? onPressed;

  /// Child
  final Widget child;

  /// Outlined Button Key
  final Key? outlinedButtonKey;

  /// Color
  final Color? color;

  /// Minimum Size
  final bool? minimumSize;

  /// Outline Color
  final Color? outlineColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: outlinedButtonKey,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.pagePadding,
        ),
        side: BorderSide(
          color: outlineColor ?? Colors.transparent,
          width: AppDimensions.borderLineWidth,
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
