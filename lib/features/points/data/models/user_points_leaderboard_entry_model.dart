import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_entry.dart';

part 'user_points_leaderboard_entry_model.g.dart';

/// Serializable leaderboard row (`UserPointsLeaderboardDTO`).
@JsonSerializable()
class UserPointsLeaderboardEntryModel
    implements ModelToEntityMapper<UserPointsLeaderboardEntry> {
  /// Creates a [UserPointsLeaderboardEntryModel].
  const UserPointsLeaderboardEntryModel({
    required this.id,
    required this.balance,
    this.name,
    this.surname,
    this.profileImageUrl,
  });

  /// JSON constructor.
  factory UserPointsLeaderboardEntryModel.fromJson(Map<String, dynamic> json) =>
      _$UserPointsLeaderboardEntryModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() =>
      _$UserPointsLeaderboardEntryModelToJson(this);

  /// User id.
  final int id;

  /// First name.
  final String? name;

  /// Last name.
  final String? surname;

  /// Profile image URL.
  final String? profileImageUrl;

  /// Points balance.
  final int balance;

  @override
  UserPointsLeaderboardEntry toEntity() => UserPointsLeaderboardEntry(
        id: id,
        name: name,
        surname: surname,
        profileImageUrl: profileImageUrl,
        balance: balance,
      );
}
