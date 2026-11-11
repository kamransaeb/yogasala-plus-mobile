import 'package:flutter/material.dart';

/// A badge with a border radius and padding.
class ContentBadgeBackground extends StatelessWidget {
  /// Creates a [ContentBadgeBackground].
  const ContentBadgeBackground({
    required this.child,
    required this.padding,
    required this.borderRadius,
    super.key,
  });

  /// The child of the badge.
  final Widget child;

  /// The padding of the badge.
  final double padding;

  /// The border radius of the badge.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: child,
    );
  }
}
