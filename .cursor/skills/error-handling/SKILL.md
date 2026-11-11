---
name: error-handling
description: >-
  Show failures and react to backend error codes in YogaSala Plus mobile using
  ErrorMapper, FailureView, AppFlushbar, BackendErrorCodes, and
  failure.code. Use when rendering error/retry states,
  showing failure or success Flushbars, branching on a backend `code`
  (e.g. subscription_required), adding a new error code or failure message, or
  editing anything under lib/errors/.
---

# Error handling

## Layout

| Need | Use | Path |
|------|-----|------|
| Localized message for a `Failure` | `ErrorMapper.toUserMessage(failure)` | `lib/errors/error_mapper.dart` |
| Full-screen error + retry | `FailureView(failure:, onRetry:)` | `lib/core/widgets/feedback/failure_view.dart` |
| Top banner | `AppFlushbar.showFailure / showError / showSuccess` | `lib/core/widgets/feedback/app_flushbar.dart` |
| Backend `code` of a failure | `failure.code` (set by `ErrorHandler` from the RFC 7807 body) | `enterprise_core` |
| Codes the app branches on | `BackendErrorCodes.*` | `lib/errors/backend_error_codes.dart` |
| Firebase codes the app handles specially | `FirebaseErrorCodes.*` | `lib/errors/firebase_error_codes.dart` |
| Purchases / RevenueCat app sentinels | `PurchasesErrorCodes.*` | `lib/errors/purchases_error_codes.dart` |
| Failure-type → message mapping | one mapper per category | `lib/errors/messages/*_failure_messages.dart` |

`toUserMessage` order: backend `code` (only when a same-named i18n key exists)
→ Firebase → network → data → device → business → `unknown_error`. Each
category mapper returns `null` when the failure isn't its kind.

Firebase SDK errors: each data-source method wraps its SDK calls in
`try` / `on FirebaseAuthException` (see `AuthRemoteDataSourceImpl`) so a
`firebase_auth` exception becomes
`enterprise_core`'s `FirebaseAuthException(firebaseErrorCode: e.code)` →
`FirebaseFailure`. `firebase_failure_messages.dart` then looks the code up as a
kebab-case key (`email-already-in-use`), with overrides for technical codes
(`invalid-credential` → `invalid_credentials_error`). `network-request-failed`
becomes `NoInternetConnectionException` instead.

For API / HTTP failures, `ErrorHandler` sets `failure.code` to the body's
`code`, or to a generic client code (`HTTP_STATUS_ERROR`, `BAD_REQUEST`, …) when
the body has none. The backend sends `code` on every 4xx/5xx, so don't parse
`responseData` yourself.

Never show the backend `detail` to users — it's for debugging (network logs).
An untranslated code falls back to generic copy by HTTP status
(`permission_denied_error`, `client_error`, `server_error`, …).

## UI patterns

```dart
// Listener feedback — never build Flushbar<void>(...) directly
listener: (context, state) {
  final failure = state.failureOrNull ?? state.actionFailureOrNull;
  if (failure == null) return;
  AppFlushbar.showFailure(context, failure);
},

// Builder failure state
if (state.isFailure) {
  return FailureView(
    failure: state.failureOrNull!,
    onRetry: () => context.read<XBloc>().add(const XEvent.fetched()),
  );
}

// Swap the retry button (e.g. paywall CTA); messageColor for dark surfaces
FailureView(
  failure: failure,
  messageColor: scheme.surface,
  onRetry: retry,
  action: ErrorMapper.requiresSubscription(failure)
      ? AppButton(label: 'subscribe'.tr(), onPressed: openPaywall)
      : null,
);
```

Already-localized copy: `AppFlushbar.showError(context, 'live_join_url_invalid'.tr())`,
`AppFlushbar.showSuccess(context, 'purchase_success'.tr())`.

`enterprise_ui` also exports an `AppErrorView` with a different design — don't use it.

## Branching on a backend code

```dart
// ✅ named helper for access gates
if (ErrorMapper.requiresLiveAccess(failure)) { ... }

// ✅ suppress store cancel toast
if (!ErrorMapper.isPurchaseCancelled(failure)) {
  AppFlushbar.showFailure(context, failure);
}

// ✅ constants + failure.code elsewhere (blocs included)
final code = failure.code;
if (code == BackendErrorCodes.quizAttemptNotCompleted) { ... }

// ❌ raw strings / hand-rolled parsing
if (failure.code == 'subscription_required') { ... }
if (failure.message == 'purchase_cancelled') { ... }
String? _backendCode(Failure f) { /* reads f.responseData['code'] */ }
```

After an access-gate paywall returns, refresh state:
`await router.push(PaywallRoute(...))`, then (if mounted)
`EntitlementsBloc.add(EntitlementsEvent.fetched())` and re-fetch the gated bloc.

## Adding a new backend code

1. Add a `static const String` with a `///` doc to `BackendErrorCodes` (value = backend contract, snake_case).
2. Add the same key to `assets/lang/en.json` and `tr.json` — `toUserMessage` picks it up automatically.
3. Only if the UI must *act* on it (navigate, swap a button, reload): add an `ErrorMapper.requiresX` helper for access gates, or compare `failure.code` to the constant.

## Adding a purchases sentinel

1. Add a `static const String` to `PurchasesErrorCodes` (snake_case, same as i18n key).
2. Add the key to `en.json` / `tr.json`.
3. Emit `BusinessFailure` / `UnknownFailure` with `code:` set in `PurchasesRepositoryImpl` (do not use `OperationNotAllowedFailure` / `NotFoundFailure` for purchases sentinels — they hardcode `OPERATION_NOT_ALLOWED` / `NOT_FOUND`).
4. List the code in `purchases_failure_messages.dart`; add an `ErrorMapper` helper only when the UI branches (e.g. `isPurchaseCancelled`).

## Adding a failure-type message

Add a `switch` case to the matching `lib/errors/messages/*_failure_messages.dart`
(network / data / device / business). Put subtypes **before** their base type
(e.g. `FormValidationFailure()` before `ValidationFailure()`). Keep `_ => null`
last so other mappers get a chance. Shared helpers (`translatedOr`,
`formatByteSize`) live in `messages/message_utils.dart`.

## Checklist

- [ ] No `Flushbar<void>(` or `another_flushbar` import in features
- [ ] No hand-built message + retry `Column` for failure states
- [ ] No raw backend-code string literals or `responseData['code']` in features
- [ ] New codes in `BackendErrorCodes` + both i18n files
- [ ] `ErrorMapper` stays a thin facade; mapping logic goes in `messages/`
