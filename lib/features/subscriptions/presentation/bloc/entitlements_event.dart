part of 'entitlements_bloc.dart';

/// Events for [EntitlementsBloc].
@freezed
abstract class EntitlementsEvent with _$EntitlementsEvent {
  const EntitlementsEvent._();

  /// Refresh entitlements from the backend.
  const factory EntitlementsEvent.fetched() = _EventFetched;

  /// Clear cached entitlements (logout).
  const factory EntitlementsEvent.cleared() = _EventCleared;
}
