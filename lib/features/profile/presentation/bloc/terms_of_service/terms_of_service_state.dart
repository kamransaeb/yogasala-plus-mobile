part of 'terms_of_service_bloc.dart';

/// States for [TermsOfServiceBloc].
@freezed
abstract class TermsOfServiceState with _$TermsOfServiceState {
  const TermsOfServiceState._();

  /// Before first fetch.
  const factory TermsOfServiceState.initial() = _StateInitial;

  /// Fetch in progress.
  const factory TermsOfServiceState.loading() = _StateLoading;

  /// Cached EN/TR terms / consent texts.
  const factory TermsOfServiceState.success({
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
