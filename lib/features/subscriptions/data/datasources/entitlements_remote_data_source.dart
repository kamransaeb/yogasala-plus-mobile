import 'package:yogasala_plus_mobile/features/subscriptions/data/models/user_entitlements_model.dart';

/// Remote data source for user entitlements.
abstract class EntitlementsRemoteDataSource {
  /// Loads entitlements from the API.
  Future<UserEntitlementsModel> getEntitlements();
}
