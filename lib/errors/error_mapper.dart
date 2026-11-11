import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/errors/backend_error_codes.dart';
import 'package:yogasala_plus_mobile/errors/messages/backend_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/messages/business_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/messages/data_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/messages/device_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/messages/firebase_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/messages/message_utils.dart';
import 'package:yogasala_plus_mobile/errors/messages/network_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/messages/purchases_failure_messages.dart';
import 'package:yogasala_plus_mobile/errors/purchases_error_codes.dart';

/// Maps failures to localized, user-facing messages and access checks.
abstract final class ErrorMapper {
  const ErrorMapper._();

  /// Localized message for [failure].
  ///
  /// A backend problem `code` wins; otherwise the message is chosen by
  /// failure type, falling back to `unknown_error`.
  static String toUserMessage(Failure failure) =>
      backendFailureMessage(failure) ??
      firebaseFailureMessage(failure) ??
      purchasesFailureMessage(failure) ??
      networkFailureMessage(failure) ??
      dataFailureMessage(failure) ??
      deviceFailureMessage(failure) ??
      businessFailureMessage(failure) ??
      _unknownMessage(failure);

  /// Whether [failure] means the user needs a VIDEO subscription.
  static bool requiresSubscription(Failure failure) =>
      _hasCode(failure, BackendErrorCodes.subscriptionRequired);

  /// Whether [failure] means the user needs a LIVE (Premium) subscription.
  static bool requiresLiveAccess(Failure failure) =>
      _hasCode(failure, BackendErrorCodes.liveAccessRequired);

  /// Whether [failure] is a user-dismissed store purchase sheet.
  static bool isPurchaseCancelled(Failure failure) =>
      _hasCode(failure, PurchasesErrorCodes.purchaseCancelled);

  static bool _hasCode(Failure failure, String code) =>
      failure.code?.toLowerCase() == code;

  static String _unknownMessage(Failure failure) => failure is UnknownFailure
      ? translatedOr(failure.message, 'unknown_error')
      : 'unknown_error'.tr();
}
