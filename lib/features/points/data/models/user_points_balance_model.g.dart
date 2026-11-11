// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPointsBalanceModel _$UserPointsBalanceModelFromJson(
  Map<String, dynamic> json,
) => UserPointsBalanceModel(
  userId: (json['userId'] as num).toInt(),
  balance: (json['balance'] as num).toInt(),
);

Map<String, dynamic> _$UserPointsBalanceModelToJson(
  UserPointsBalanceModel instance,
) => <String, dynamic>{'userId': instance.userId, 'balance': instance.balance};
