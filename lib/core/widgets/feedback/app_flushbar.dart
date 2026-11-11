import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';

/// Top-of-screen feedback banners shared across the app.
abstract final class AppFlushbar {
  const AppFlushbar._();

  /// Shows [failure] as a localized "failure" banner.
  static void showFailure(BuildContext context, Failure failure) =>
      showError(context, ErrorMapper.toUserMessage(failure));

  /// Shows an already-localized error [message].
  static void showError(BuildContext context, String message) =>
      _show(context, title: 'failure'.tr(), message: message);

  /// Shows an already-localized success [message].
  static void showSuccess(BuildContext context, String message) =>
      _show(context, title: 'success'.tr(), message: message);

  static void _show(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    unawaited(
      Flushbar<void>(
        duration: const Duration(seconds: 3),
        title: title,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context),
    );
  }
}
