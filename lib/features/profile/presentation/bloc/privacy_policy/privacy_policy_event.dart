part of 'privacy_policy_bloc.dart';

/// Events for [PrivacyPolicyBloc].
@freezed
abstract class PrivacyPolicyEvent with _$PrivacyPolicyEvent {
  const PrivacyPolicyEvent._();

  /// Load cached privacy policy texts.
  const factory PrivacyPolicyEvent.fetched() = _EventFetched;
}
