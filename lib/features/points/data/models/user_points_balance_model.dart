import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_balance.dart';

part 'user_points_balance_model.g.dart';

/// Serializable points balance (`UserPointsBalance`).
@JsonSerializable()
class UserPointsBalanceModel
    implements ModelToEntityMapper<UserPointsBalance> {
  /// Creates a [UserPointsBalanceModel].
  const UserPointsBalanceModel({
    required this.userId,
    required this.balance,
  });

  /// JSON constructor.
  factory UserPointsBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserPointsBalanceModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$UserPointsBalanceModelToJson(this);

  /// User id.
  final int userId;

  /// Current points balance.
  final int balance;

  @override
  UserPointsBalance toEntity() => UserPointsBalance(
        userId: userId,
        balance: balance,
      );
}
