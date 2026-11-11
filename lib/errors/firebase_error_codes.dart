/// Firebase Auth error `code` values (`FirebaseAuthException.code` from
/// `firebase_auth`).
///
/// Each code's message lives under the same localization key with `-`
/// replaced by `_` (e.g. `invalid-credential` → `invalid_credential`).
abstract final class FirebaseErrorCodes {
  const FirebaseErrorCodes._();

  /// This operation is restricted to administrators only.
  static const String adminRestrictedOperation = 'admin-restricted-operation';

  /// Argument error
  static const String argumentError = 'argument-error';

  /// This app, identified by the domain where it's hosted, is not authorized to
  /// use Firebase Authentication with the provided API key. Review your key
  /// configuration in the Google API console.
  static const String appNotAuthorized = 'app-not-authorized';

  /// The requested mobile application corresponding to the identifier (Android
  /// package name or iOS bundle ID) provided is not installed on this device.
  static const String appNotInstalled = 'app-not-installed';

  /// The reCAPTCHA response token provided is either invalid, expired, already
  /// used or the domain associated with it does not match the list of
  /// whitelisted domains.
  static const String captchaCheckFailed = 'captcha-check-failed';

  /// The SMS code has expired. Please re-send the verification code to try
  /// again.
  static const String codeExpired = 'code-expired';

  /// Cordova framework is not ready.
  static const String cordovaNotReady = 'cordova-not-ready';

  /// This browser is not supported.
  static const String corsUnsupported = 'cors-unsupported';

  /// This credential is already associated with a different user account.
  static const String credentialAlreadyInUse = 'credential-already-in-use';

  /// The custom token corresponds to a different audience.
  static const String customTokenMismatch = 'custom-token-mismatch';

  /// This operation is sensitive and requires recent authentication. Log in
  /// again before retrying this request.
  static const String requiresRecentLogin = 'requires-recent-login';

  /// Please activate Dynamic Links in the Firebase Console and agree to the
  /// terms and conditions.
  static const String dynamicLinkNotActivated = 'dynamic-link-not-activated';

  /// Multi-factor users must always have a verified email.
  static const String emailChangeNeedsVerification =
      'email-change-needs-verification';

  /// The email address is already in use by another account.
  static const String emailAlreadyInUse = 'email-already-in-use';

  /// Please verify your email address before logging in. Check your inbox (and
  /// spam).
  static const String emailNotVerified = 'email-not-verified';

  /// The action code has expired.
  static const String expiredActionCode = 'expired-action-code';

  /// This operation has been cancelled due to another conflicting popup being
  /// opened.
  static const String cancelledPopupRequest = 'cancelled-popup-request';

  /// An internal error has occurred.
  static const String internalError = 'internal-error';

  /// The phone verification request contains an invalid application verifier.
  /// The reCAPTCHA token response is either invalid or expired.
  static const String invalidAppCredential = 'invalid-app-credential';

  /// The mobile app identifier is not registered for the current project.
  static const String invalidAppId = 'invalid-app-id';

  /// This user's credential isn't valid for this project. This can happen if
  /// the user's token has been tampered with, or if the user isn't for the
  /// project associated with this API key.
  static const String invalidUserToken = 'invalid-user-token';

  /// An internal error has occurred.
  static const String invalidAuthEvent = 'invalid-auth-event';

  /// The SMS verification code used to create the phone auth credential is
  /// invalid. Please resend the verification code sms and be sure use the
  /// verification code provided by the user.
  static const String invalidVerificationCode = 'invalid-verification-code';

  /// The continue URL provided in the request is invalid.
  static const String invalidContinueUri = 'invalid-continue-uri';

  /// The following Cordova plugins must be installed to enable OAuth sign-in:
  /// cordova-plugin-buildinfo, cordova-universal-links-plugin, cordova-plugin-
  /// browsertab, cordova-plugin-inappbrowser and cordova-plugin-
  /// customurlscheme.
  static const String invalidCordovaConfiguration =
      'invalid-cordova-configuration';

  /// The custom token format is incorrect. Please check the documentation.
  static const String invalidCustomToken = 'invalid-custom-token';

  /// The provided dynamic link domain is not configured or authorized for the
  /// current project.
  static const String invalidDynamicLinkDomain = 'invalid-dynamic-link-domain';

  /// The email address is badly formatted.
  static const String invalidEmail = 'invalid-email';

  /// Your API key is invalid, please check you have copied it correctly.
  static const String invalidApiKey = 'invalid-api-key';

  /// The SHA-1 certificate hash provided is invalid.
  static const String invalidCertHash = 'invalid-cert-hash';

  /// The supplied authentication credential is malformed or has expired.
  static const String invalidCredential = 'invalid-credential';

  /// The email template corresponding to this action contains invalid
  /// characters in its message. Please fix by going to the Auth email templates
  /// section in the Firebase Console.
  static const String invalidMessagePayload = 'invalid-message-payload';

  /// The request does not contain a valid proof of first factor successful
  /// sign-in.
  static const String invalidMultiFactorSession =
      'invalid-multi-factor-session';

  /// EmailAuthProvider is not supported for this operation. This operation only
  /// supports OAuth providers.
  static const String invalidOauthProvider = 'invalid-oauth-provider';

  /// The OAuth client ID provided is either invalid or does not match the
  /// specified API key.
  static const String invalidOauthClientId = 'invalid-oauth-client-id';

  /// This domain is not authorized for OAuth operations for your Firebase
  /// project. Edit the list of authorized domains from the Firebase console.
  static const String unauthorizedDomain = 'unauthorized-domain';

  /// The action code is invalid. This can happen if the code is malformed,
  /// expired, or has already been used.
  static const String invalidActionCode = 'invalid-action-code';

  /// The password is invalid or the user does not have a password.
  static const String wrongPassword = 'wrong-password';

  /// The specified persistence type is invalid. It can only be local, session
  /// or none.
  static const String invalidPersistenceType = 'invalid-persistence-type';

  /// The format of the phone number provided is incorrect. Please enter the
  /// phone number in a phone number in a format [+][country code][subscriber
  /// number including area code].
  static const String invalidPhoneNumber = 'invalid-phone-number';

  /// The specified provider ID is invalid.
  static const String invalidProviderId = 'invalid-provider-id';

  /// The email corresponding to this action failed to send as the provided
  /// recipient email address is invalid.
  static const String invalidRecipientEmail = 'invalid-recipient-email';

  /// The email template corresponding to this action contains an invalid sender
  /// email or name. Please fix by going to the Auth email templates section in
  /// the Firebase Console.
  static const String invalidSender = 'invalid-sender';

  /// The verification ID used to create the phone auth credential is invalid.
  static const String invalidVerificationId = 'invalid-verification-id';

  /// The Auth instance's tenant ID is invalid.
  static const String invalidTenantId = 'invalid-tenant-id';

  /// The user does not have a second factor matching the identifier provided.
  static const String multiFactorInfoNotFound = 'multi-factor-info-not-found';

  /// Proof of ownership of a second factor is required to complete sign-in.
  static const String multiFactorAuthRequired = 'multi-factor-auth-required';

  /// An Android Package Name must be provided if the Android App is required to
  /// be installed.
  static const String missingAndroidPkgName = 'missing-android-pkg-name';

  /// Be sure to include authDomain when calling firebase.initializeApp(), by
  /// following the instructions in the Firebase console.
  static const String authDomainConfigRequired = 'auth-domain-config-required';

  /// The phone verification request is missing an application verifier
  /// assertion. A reCAPTCHA response token needs to be provided.
  static const String missingAppCredential = 'missing-app-credential';

  /// The phone auth credential was created with an empty SMS verification code.
  static const String missingVerificationCode = 'missing-verification-code';

  /// A continue URL must be provided in the request.
  static const String missingContinueUri = 'missing-continue-uri';

  /// An internal error has occurred.
  static const String missingIframeStart = 'missing-iframe-start';

  /// An iOS Bundle ID must be provided if an App Store ID is provided.
  static const String missingIosBundleId = 'missing-ios-bundle-id';

  /// No second factor identifier is provided.
  static const String missingMultiFactorInfo = 'missing-multi-factor-info';

  /// The request is missing proof of first factor successful sign-in.
  static const String missingMultiFactorSession =
      'missing-multi-factor-session';

  /// The request does not contain a valid nonce. This can occur if the SHA-256
  /// hash of the provided raw nonce does not match the hashed nonce in the ID
  /// token payload.
  static const String missingOrInvalidNonce = 'missing-or-invalid-nonce';

  /// To send verification codes, provide a phone number for the recipient.
  static const String missingPhoneNumber = 'missing-phone-number';

  /// The phone auth credential was created with an empty verification ID.
  static const String missingVerificationId = 'missing-verification-id';

  /// This instance of FirebaseApp has been deleted.
  static const String appDeleted = 'app-deleted';

  /// An account already exists with the same email address but different sign-
  /// in credentials. Sign in using a provider associated with this email
  /// address.
  static const String accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';

  /// A network error (such as timeout, interrupted connection or unreachable
  /// host) has occurred.
  static const String networkRequestFailed = 'network-request-failed';

  /// An internal error has occurred.
  static const String noAuthEvent = 'no-auth-event';

  /// User was not linked to an account with the given provider.
  static const String noSuchProvider = 'no-such-provider';

  /// A null user object was provided as the argument for an operation which
  /// requires a non-null user object.
  static const String nullUser = 'null-user';

  /// The given sign-in provider is disabled for this Firebase project. Enable
  /// it in the Firebase console, under the sign-in method tab of the Auth
  /// section.
  static const String operationNotAllowed = 'operation-not-allowed';

  /// This operation is not supported in the environment this application is
  /// running on. location.protocol must be http, https or chrome-extension and
  /// web storage must be enabled.
  static const String operationNotSupportedInThisEnvironment =
      'operation-not-supported-in-this-environment';

  /// Unable to establish a connection with the popup. It may have been blocked
  /// by the browser.
  static const String popupBlocked = 'popup-blocked';

  /// The popup has been closed by the user before finalizing the operation.
  static const String popupClosedByUser = 'popup-closed-by-user';

  /// User can only be linked to one identity for the given provider.
  static const String providerAlreadyLinked = 'provider-already-linked';

  /// The project's quota for this operation has been exceeded.
  static const String quotaExceeded = 'quota-exceeded';

  /// The redirect operation has been cancelled by the user before finalizing.
  static const String redirectCancelledByUser = 'redirect-cancelled-by-user';

  /// A redirect sign-in operation is already pending.
  static const String redirectOperationPending = 'redirect-operation-pending';

  /// The request contains malformed or mismatching credentials.
  static const String rejectedCredential = 'rejected-credential';

  /// The second factor is already enrolled on this account.
  static const String secondFactorAlreadyInUse = 'second-factor-already-in-use';

  /// The maximum allowed number of second factors on a user has been exceeded.
  static const String maximumSecondFactorCountExceeded =
      'maximum-second-factor-count-exceeded';

  /// The provided tenant ID does not match the Auth instance's tenant ID
  static const String tenantIdMismatch = 'tenant-id-mismatch';

  /// The operation has timed out.
  static const String timeout = 'timeout';

  /// The user's credential is no longer valid. The user must sign in again.
  static const String userTokenExpired = 'user-token-expired';

  /// We have blocked all requests from this device due to unusual activity. Try
  /// again later.
  static const String tooManyRequests = 'too-many-requests';

  /// The domain of the continue URL is not whitelisted. Please whitelist the
  /// domain in the Firebase console.
  static const String unauthorizedContinueUri = 'unauthorized-continue-uri';

  /// Enrolling a second factor or signing in with a multi-factor account
  /// requires sign-in with a supported first factor.
  static const String unsupportedFirstFactor = 'unsupported-first-factor';

  /// The current environment does not support the specified persistence type.
  static const String unsupportedPersistenceType =
      'unsupported-persistence-type';

  /// This operation is not supported in a multi-tenant context.
  static const String unsupportedTenantOperation =
      'unsupported-tenant-operation';

  /// The operation requires a verified email.
  static const String unverifiedEmail = 'unverified-email';

  /// The user did not grant your application the permissions it requested.
  static const String userCancelled = 'user-cancelled';

  /// There is no user record corresponding to this identifier. The user may
  /// have been deleted.
  static const String userNotFound = 'user-not-found';

  /// The user account has been disabled by an administrator.
  static const String userDisabled = 'user-disabled';

  /// The supplied credentials do not correspond to the previously signed in
  /// user.
  static const String userMismatch = 'user-mismatch';

  /// The user signed out
  static const String userSignedOut = 'user-signed-out';

  /// The password must be 6 characters or longer.
  static const String weakPassword = 'weak-password';

  /// This browser is not supported or 3rd party cookies and data may be
  /// disabled.
  static const String webStorageUnsupported = 'web-storage-unsupported';
}
