import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer.dart';

/// One question in a video quiz version.
class VideoQuizQuestion {
  /// Creates a [VideoQuizQuestion].
  const VideoQuizQuestion({
    required this.id,
    required this.versionId,
    required this.questionEn,
    required this.questionTr,
    required this.sortOrder,
    required this.answers,
    this.selectedAnswerId,
    this.correctAnswerId,
  });

  /// Server id (belongs to the pinned version).
  final int id;

  /// Parent quiz version id.
  final int versionId;

  /// Question text (EN).
  final String questionEn;

  /// Question text (TR).
  final String questionTr;

  /// Display order.
  final int sortOrder;

  /// Answer options (sorted by [VideoQuizAnswer.sortOrder]).
  final List<VideoQuizAnswer> answers;

  /// User's selected answer id, if already answered.
  final int? selectedAnswerId;

  /// Correct answer id (only after answered / quiz completed).
  final int? correctAnswerId;

  /// Whether the user has already answered this question.
  bool get isAnswered => selectedAnswerId != null;

  /// Localized question for [locale] (`tr` / `en`).
  String questionForLocale(String locale) =>
      locale == 'tr' ? questionTr : questionEn;

  /// Copy with optional overrides.
  VideoQuizQuestion copyWith({
    int? id,
    int? versionId,
    String? questionEn,
    String? questionTr,
    int? sortOrder,
    List<VideoQuizAnswer>? answers,
    int? selectedAnswerId,
    int? correctAnswerId,
  }) {
    return VideoQuizQuestion(
      id: id ?? this.id,
      versionId: versionId ?? this.versionId,
      questionEn: questionEn ?? this.questionEn,
      questionTr: questionTr ?? this.questionTr,
      sortOrder: sortOrder ?? this.sortOrder,
      answers: answers ?? this.answers,
      selectedAnswerId: selectedAnswerId ?? this.selectedAnswerId,
      correctAnswerId: correctAnswerId ?? this.correctAnswerId,
    );
  }
}
