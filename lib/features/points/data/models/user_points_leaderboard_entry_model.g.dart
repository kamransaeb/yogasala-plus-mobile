// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points_leaderboard_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPointsLeaderboardEntryModel _$UserPointsLeaderboardEntryModelFromJson(
  Map<String, dynamic> json,
) => UserPointsLeaderboardEntryModel(
  id: (json['id'] as num).toInt(),
  balance: (json['balance'] as num).toInt(),
  name: json['name'] as String?,
  surname: json['surname'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
);

Map<String, dynamic> _$UserPointsLeaderboardEntryModelToJson(
  UserPointsLeaderboardEntryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'surname': instance.surname,
  'profileImageUrl': instance.profileImageUrl,
  'balance': instance.balance,
};
