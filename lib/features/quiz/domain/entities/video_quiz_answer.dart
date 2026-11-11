/// One answer option for a video quiz question.
class VideoQuizAnswer {
  /// Creates a [VideoQuizAnswer].
  const VideoQuizAnswer({
    required this.id,
    required this.answerEn,
    required this.answerTr,
    required this.sortOrder,
    this.correct,
  });

  /// Server id.
  final int id;

  /// Answer text (EN).
  final String answerEn;

  /// Answer text (TR).
  final String answerTr;

  /// Display order.
  final int sortOrder;

  /// Whether this option is correct (only after question answered / quiz done).
  final bool? correct;

  /// Localized answer for [locale] (`tr` / `en`).
  String answerForLocale(String locale) =>
      locale == 'tr' ? answerTr : answerEn;

  /// Copy with optional overrides.
  VideoQuizAnswer copyWith({
    int? id,
    String? answerEn,
    String? answerTr,
    int? sortOrder,
    bool? correct,
  }) {
    return VideoQuizAnswer(
      id: id ?? this.id,
      answerEn: answerEn ?? this.answerEn,
      answerTr: answerTr ?? this.answerTr,
      sortOrder: sortOrder ?? this.sortOrder,
      correct: correct ?? this.correct,
    );
  }
}
