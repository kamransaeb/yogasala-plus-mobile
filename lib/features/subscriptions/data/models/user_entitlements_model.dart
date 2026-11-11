import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/entitlement.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_source.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_status.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/user_entitlements.dart';

part 'user_entitlements_model.g.dart';

/// Serializable entitlements from `GET /mobile/user/entitlements`.
@JsonSerializable()
class UserEntitlementsModel implements ModelToEntityMapper<UserEntitlements> {
  /// Creates a [UserEntitlementsModel].
  const UserEntitlementsModel({
    this.plan,
    this.status,
    this.source,
    this.validUntil,
    this.entitlements = const [],
  });

  /// JSON constructor.
  factory UserEntitlementsModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntitlementsModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$UserEntitlementsModelToJson(this);

  /// Plan short (`0` STANDARD, `1` PREMIUM).
  final int? plan;

  /// Status short.
  final int? status;

  /// Source short.
  final int? source;

  /// ISO offset datetime string.
  final String? validUntil;

  /// Entitlement shorts (`0` VIDEO, `1` LIVE).
  @JsonKey(defaultValue: <int>[])
  final List<int> entitlements;

  @override
  UserEntitlements toEntity() {
    DateTime? parsedValidUntil;
    final raw = validUntil?.trim();
    if (raw != null && raw.isNotEmpty) {
      parsedValidUntil = DateTime.tryParse(raw);
    }
    return UserEntitlements(
      plan: SubscriptionPlan.fromWire(plan),
      status: SubscriptionStatus.fromWire(status),
      source: SubscriptionSource.fromWire(source),
      validUntil: parsedValidUntil,
      entitlements: entitlements
          .map(Entitlement.fromWire)
          .whereType<Entitlement>()
          .toList(growable: false),
    );
  }
}
