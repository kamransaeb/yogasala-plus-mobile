import 'package:flutter/material.dart';

/// Flat clamp scrolling with no overscroll glow/stretch animation.
class SimpleScrollBehavior extends MaterialScrollBehavior {
  /// Creates a [SimpleScrollBehavior].
  const SimpleScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
