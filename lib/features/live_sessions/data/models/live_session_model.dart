import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/live_provider.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_session.dart';

part 'live_session_model.g.dart';

/// Serializable live session from `GET /mobile/user/live-sessions`.
@JsonSerializable()
class LiveSessionModel implements ModelToEntityMapper<LiveSession> {
  /// Creates a [LiveSessionModel].
  const LiveSessionModel({
    required this.slotId,
    required this.title,
    required this.weekday,
    required this.startsAt,
    required this.endsAt,
    this.nameTr,
    this.nameEn,
    this.descriptionTr,
    this.descriptionEn,
    this.imageUrl,
    this.teacherId,
    this.teacherName,
    this.provider,
  });

  /// JSON constructor.
  factory LiveSessionModel.fromJson(Map<String, dynamic> json) =>
      _$LiveSessionModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$LiveSessionModelToJson(this);

  /// Slot id.
  final int slotId;

  /// Fallback title.
  @JsonKey(defaultValue: '')
  final String title;

  /// Name TR.
  final String? nameTr;

  /// Name EN.
  final String? nameEn;

  /// Description TR.
  final String? descriptionTr;

  /// Description EN.
  final String? descriptionEn;

  /// Image URL.
  final String? imageUrl;

  /// Teacher id.
  final int? teacherId;

  /// Teacher name.
  final String? teacherName;

  /// ISO weekday.
  final int weekday;

  /// Provider wire (0 = ZOOM).
  final int? provider;

  /// Start ISO offset datetime.
  final String startsAt;

  /// End ISO offset datetime.
  final String endsAt;

  @override
  LiveSession toEntity() {
    return LiveSession(
      slotId: slotId,
      title: title,
      nameTr: nameTr,
      nameEn: nameEn,
      descriptionTr: descriptionTr,
      descriptionEn: descriptionEn,
      imageUrl: imageUrl,
      teacherId: teacherId,
      teacherName: teacherName,
      weekday: weekday,
      provider: LiveProvider.fromWire(provider),
      startsAt: DateTime.parse(startsAt),
      startsAtRaw: startsAt,
      endsAt: DateTime.parse(endsAt),
    );
  }
}
