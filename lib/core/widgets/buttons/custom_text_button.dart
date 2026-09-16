import 'package:flutter/material.dart';

/// Custom Text Button
class CustomTextButton extends StatelessWidget {
  /// Constructor
  const CustomTextButton({
    required this.onPressed,
    required this.child,
    this.textButtonKey,
    super.key,
  });

  /// On Pressed Void Callback
  final VoidCallback? onPressed;

  /// Child Widget
  final Widget child;

  /// Text Button Key
  final Key? textButtonKey;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: textButtonKey,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
      ),
      onPressed: onPressed == null ? null : () => onPressed!(),
      child: child,
    );
  }
}
