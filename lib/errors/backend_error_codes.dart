/// Backend problem `code` values the app reacts to beyond showing a message.
///
/// Values match the backend contract and the same-named localization keys.
abstract final class BackendErrorCodes {
  const BackendErrorCodes._();

  /// Paid VOD playback requires an active VIDEO entitlement.
  static const String subscriptionRequired = 'subscription_required';

  /// Joining a live class requires an active LIVE entitlement.
  static const String liveAccessRequired = 'live_access_required';

  /// The quiz was already completed by this user.
  static const String quizAlreadyCompleted = 'quiz_already_completed';

  /// The quiz question was already answered by this user.
  static const String quizQuestionAlreadyAnswered =
      'quiz_question_already_answered';

  /// The quiz question id is not part of the current quiz version.
  static const String invalidQuizQuestionId = 'invalid_quiz_question_id';

  /// The quiz attempt id does not exist or is not the user's.
  static const String invalidQuizAttemptId = 'invalid_quiz_attempt_id';

  /// The quiz attempt has not been completed yet.
  static const String quizAttemptNotCompleted = 'quiz_attempt_not_completed';
}
