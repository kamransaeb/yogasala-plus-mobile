import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// Custom Round Icon Button
class CustomRoundIconButton extends StatelessWidget {
  /// Constructor
  const CustomRoundIconButton({
    required this.onPressed,
    required this.icon,
    required this.paddingSize,
    this.iconButtonKey,
    this.border = true,
    this.borderColor = AppColors.icon,
    this.boxColor = AppColors.white,
    super.key,
  });

  /// On Pressed Void Callback
  final VoidCallback? onPressed;

  /// Icon
  final Widget icon;

  /// Icon Button Key
  final Key? iconButtonKey;

  /// Border
  final bool border;

  /// Border Color
  final Color borderColor;

  /// Box Color
  final Color boxColor;

  /// Padding Size
  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed == null ? null : () => onPressed!(),
        child: Container(
          padding: EdgeInsets.all(paddingSize),
          decoration: BoxDecoration(
            border: Border.all(
              color: border ? borderColor : boxColor,
              width: border ? AppDimensions.borderLineWidth : 0.0,
            ),
            shape: BoxShape.circle,
            color: boxColor,
          ),
          child: icon,
        ),
      ),
    );
  }
}
