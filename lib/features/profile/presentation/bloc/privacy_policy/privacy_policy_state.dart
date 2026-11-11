part of 'privacy_policy_bloc.dart';

/// States for [PrivacyPolicyBloc].
@freezed
abstract class PrivacyPolicyState with _$PrivacyPolicyState {
  const PrivacyPolicyState._();

  /// Before first fetch.
  const factory PrivacyPolicyState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory PrivacyPolicyState.loading() = _StateLoading;

  /// Cached EN/TR privacy policy texts.
  const factory PrivacyPolicyState.success({
    required String textEn,
    required String textTr,
  }) = _StateSuccess;

  /// Whether a load is in progress.
  bool get isLoading => maybeMap(
    initial: (_) => true,
    loading: (_) => true,
    orElse: () => false,
  );

  /// Locale-specific body text.
  String textForLocale({required bool isTr}) => maybeMap(
    success: (s) => isTr ? s.textTr : s.textEn,
    orElse: () => '',
  );
}
