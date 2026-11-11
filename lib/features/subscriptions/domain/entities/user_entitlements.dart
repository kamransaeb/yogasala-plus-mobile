import 'package:yogasala_plus_mobile/core/enums/entitlement.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_source.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_status.dart';

/// Backend entitlement snapshot (`GET /mobile/user/entitlements`).
class UserEntitlements {
  /// Creates [UserEntitlements].
  const UserEntitlements({
    this.plan,
    this.status,
    this.source,
    this.validUntil,
    this.entitlements = const [],
  });

  /// Empty entitlements (locked).
  static const empty = UserEntitlements();

  /// Active plan, if any.
  final SubscriptionPlan? plan;

  /// Subscription status.
  final SubscriptionStatus? status;

  /// Grant source.
  final SubscriptionSource? source;

  /// Validity end (ISO offset from API).
  final DateTime? validUntil;

  /// Granted entitlements (`VIDEO`, `LIVE`, …).
  final List<Entitlement> entitlements;

  /// Whether [Entitlement.video] is granted.
  bool get hasVideo => entitlements.contains(Entitlement.video);

  /// Whether [Entitlement.live] is granted.
  bool get hasLive => entitlements.contains(Entitlement.live);

  /// Whether paid VOD may play for a non-free series.
  bool canPlayPaidVideo({required bool serieFree}) =>
      serieFree || hasVideo;
}
