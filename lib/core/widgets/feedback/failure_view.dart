import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';

/// Centered failure message with a retry button (or a custom [action]).
class FailureView extends StatelessWidget {
  /// Creates a [FailureView] for [failure].
  const FailureView({
    required this.failure,
    this.onRetry,
    this.action,
    this.messageColor,
    super.key,
  });

  /// Failure to describe via [ErrorMapper.toUserMessage].
  final Failure failure;

  /// Called by the default retry button; no button when null and no [action].
  final VoidCallback? onRetry;

  /// Replaces the default retry button (e.g. a subscribe button).
  final Widget? action;

  /// Message text color; defaults to the theme's body color.
  final Color? messageColor;

  @override
  Widget build(BuildContext context) {
    final retry = onRetry;
    final button =
        action ??
        (retry == null
            ? null
            : AppButton(label: 'retry'.tr(), onPressed: retry));

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.p24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ErrorMapper.toUserMessage(failure),
              textAlign: TextAlign.center,
              style: messageColor == null
                  ? null
                  : TextStyle(color: messageColor),
            ),
            if (button != null) ...[
              const SizedBox(height: AppDimensions.p24),
              button,
            ],
          ],
        ),
      ),
    );
  }
}
