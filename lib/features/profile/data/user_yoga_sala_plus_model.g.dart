// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_yoga_sala_plus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserYogaSalaPlusModel _$UserYogaSalaPlusModelFromJson(
  Map<String, dynamic> json,
) => UserYogaSalaPlusModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  surname: json['surname'] as String,
  email: json['email'] as String,
  userYogaSalaPlusAccountType: $enumDecode(
    _$UserYogaSalaPlusAccountTypeEnumMap,
    json['userYogaSalaPlusAccountType'],
  ),
  enabled: json['enabled'] as bool,
  profileCompleted: json['profileCompleted'] as bool,
  languageCode: json['languageCode'] as String,
  verified: json['verified'] as bool,
  forceLogout: json['forceLogout'] as bool,
  personalPhoneNumber: json['personalPhoneNumber'] as String?,
  address: json['address'] as String?,
  notificationToken: json['notificationToken'] as String?,
  turkishIdentificationNumber: json['turkishIdentificationNumber'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  gender: (json['gender'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserYogaSalaPlusModelToJson(
  UserYogaSalaPlusModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'surname': instance.surname,
  'email': instance.email,
  'personalPhoneNumber': instance.personalPhoneNumber,
  'address': instance.address,
  'userYogaSalaPlusAccountType':
      _$UserYogaSalaPlusAccountTypeEnumMap[instance
          .userYogaSalaPlusAccountType]!,
  'notificationToken': instance.notificationToken,
  'enabled': instance.enabled,
  'profileCompleted': instance.profileCompleted,
  'languageCode': instance.languageCode,
  'verified': instance.verified,
  'turkishIdentificationNumber': instance.turkishIdentificationNumber,
  'forceLogout': instance.forceLogout,
  'profileImageUrl': instance.profileImageUrl,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'gender': instance.gender,
};

const _$UserYogaSalaPlusAccountTypeEnumMap = {
  UserYogaSalaPlusAccountType.admin: 'admin',
  UserYogaSalaPlusAccountType.user: 'user',
};
