import 'package:flutter/material.dart';

/// Custom Icon Button
class CustomIconButton extends StatelessWidget {
  /// Constructor
  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    this.iconButtonKey,
    super.key,
  });

  /// On Pressed
  final VoidCallback? onPressed;

  /// Icon
  final Widget icon;

  /// Icon Button Key
  final Key? iconButtonKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: iconButtonKey,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
      ),
      onPressed: onPressed == null ? null : () => onPressed!(),
      icon: icon,
    );
  }
}
