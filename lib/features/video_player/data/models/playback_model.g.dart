// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaybackModel _$PlaybackModelFromJson(Map<String, dynamic> json) =>
    PlaybackModel(
      videoId: (json['videoId'] as num).toInt(),
      videoTitle: json['videoTitle'] as String,
      playbackId: json['playbackId'] as String,
      playbackToken: json['playbackToken'] as String,
      streamUrl: json['streamUrl'] as String,
      envKey: json['envKey'] as String,
      viewerUserId: json['viewerUserId'] as String,
      thumbnailToken: json['thumbnailToken'] as String?,
    );

Map<String, dynamic> _$PlaybackModelToJson(PlaybackModel instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'videoTitle': instance.videoTitle,
      'playbackId': instance.playbackId,
      'playbackToken': instance.playbackToken,
      'thumbnailToken': instance.thumbnailToken,
      'streamUrl': instance.streamUrl,
      'envKey': instance.envKey,
      'viewerUserId': instance.viewerUserId,
    };
