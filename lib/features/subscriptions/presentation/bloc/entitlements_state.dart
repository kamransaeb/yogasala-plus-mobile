part of 'entitlements_bloc.dart';

/// States for [EntitlementsBloc].
@freezed
abstract class EntitlementsState with _$EntitlementsState {
  const EntitlementsState._();

  /// Before first fetch.
  const factory EntitlementsState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory EntitlementsState.loading() = _StateLoading;

  /// Entitlements loaded.
  const factory EntitlementsState.success({
    required UserEntitlements entitlements,
  }) = _StateSuccess;

  /// Fetch failed.
  const factory EntitlementsState.failure({
    required Failure failure,
  }) = _StateFailure;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(loading: (_) => true, orElse: () => false);

  /// Whether load succeeded.
  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  /// Whether load failed.
  bool get isFailure => maybeMap(failure: (_) => true, orElse: () => false);

  /// Failure when in failure state.
  Failure? get failureOrNull => maybeMap(
        failure: (s) => s.failure,
        orElse: () => null,
      );

  /// Entitlements when success.
  UserEntitlements? get entitlementsOrNull => maybeMap(
        success: (s) => s.entitlements,
        orElse: () => null,
      );

  /// Entitlements or empty when unknown.
  UserEntitlements get entitlementsOrEmpty =>
      entitlementsOrNull ?? UserEntitlements.empty;

  /// VIDEO entitlement granted.
  bool get hasVideo => entitlementsOrEmpty.hasVideo;

  /// LIVE entitlement granted.
  bool get hasLive => entitlementsOrEmpty.hasLive;
}
