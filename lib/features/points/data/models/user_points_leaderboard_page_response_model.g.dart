// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points_leaderboard_page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPointsLeaderboardPageResponseModel
_$UserPointsLeaderboardPageResponseModelFromJson(Map<String, dynamic> json) =>
    UserPointsLeaderboardPageResponseModel(
      content:
          (json['content'] as List<dynamic>?)
              ?.map(
                (e) => UserPointsLeaderboardEntryModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserPointsLeaderboardPageResponseModelToJson(
  UserPointsLeaderboardPageResponseModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
};
