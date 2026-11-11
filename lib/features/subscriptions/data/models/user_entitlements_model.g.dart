// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entitlements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntitlementsModel _$UserEntitlementsModelFromJson(
  Map<String, dynamic> json,
) => UserEntitlementsModel(
  plan: (json['plan'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  source: (json['source'] as num?)?.toInt(),
  validUntil: json['validUntil'] as String?,
  entitlements:
      (json['entitlements'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
);

Map<String, dynamic> _$UserEntitlementsModelToJson(
  UserEntitlementsModel instance,
) => <String, dynamic>{
  'plan': instance.plan,
  'status': instance.status,
  'source': instance.source,
  'validUntil': instance.validUntil,
  'entitlements': instance.entitlements,
};
