import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';

/// Message for connectivity, HTTP, API and server failures, or null when
/// [failure] is none of these.
String? networkFailureMessage(Failure failure) => switch (failure) {
  // Network subtypes must precede the NetworkFailure fallbacks.
  NoInternetConnectionFailure() => 'no_internet_error'.tr(),
  ConnectionTimeoutFailure() => 'connection_timeout_error'.tr(),
  DnsResolutionFailure() => 'dns_resolution_error'.tr(),
  SslFailure() => 'ssl_error'.tr(),
  HttpStatusFailure(:final statusCode) => _statusMessage(statusCode),
  RequestCancelledFailure() => 'request_cancelled_error'.tr(),
  ResponseParsingFailure() => 'response_parsing_error'.tr(),
  RateLimitExceededFailure() => 'rate_limit_error'.tr(),
  WebSocketFailure() => 'web_socket_error'.tr(),
  NetworkFailure(timeout: true) => 'connection_timeout_error'.tr(),
  NetworkFailure() => 'network_error'.tr(),

  ApiFailure(:final statusCode) => _statusMessage(statusCode),

  final ServerFailure f => _serverMessage(f),
  _ => null,
};

/// Generic copy for an HTTP status whose backend `code` has no translation.
///
/// The backend `detail` is for debugging (it is in the network logs), so it
/// is never shown to users.
String _statusMessage(int? status) => switch (status) {
  401 => 'unauthorized_error'.tr(),
  403 => 'permission_denied_error'.tr(),
  404 => 'resource_not_found_error'.tr(),
  429 => 'rate_limit_error'.tr(),
  final s? when s >= 500 => 'server_error'.tr(),
  final s? when s >= 400 => 'client_error'.tr(),
  _ => 'unknown_error'.tr(),
};

String _serverMessage(ServerFailure f) => switch (f) {
  _ when f.isRateLimited => 'rate_limit_error'.tr(),
  _ when f.isTimeout => 'timeout_error'.tr(),
  _ when f.isClientError => 'client_error'.tr(),
  _ when f.isServerError => 'server_error'.tr(),
  _ => f.message,
};
