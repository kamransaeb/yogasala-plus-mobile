// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      authUser: AuthUserModel.fromJson(
        json['authUser'] as Map<String, dynamic>,
      ),
      authTokens: AuthTokensModel.fromJson(
        json['authTokens'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'authUser': instance.authUser,
      'authTokens': instance.authTokens,
    };
