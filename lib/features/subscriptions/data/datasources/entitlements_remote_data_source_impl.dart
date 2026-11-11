import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/data/api/entitlements_api_client.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/data/datasources/entitlements_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/data/models/user_entitlements_model.dart';

/// Implementation of [EntitlementsRemoteDataSource].
@LazySingleton(as: EntitlementsRemoteDataSource)
class EntitlementsRemoteDataSourceImpl implements EntitlementsRemoteDataSource {
  /// Creates an [EntitlementsRemoteDataSourceImpl].
  EntitlementsRemoteDataSourceImpl(this._apiClient);

  final EntitlementsApiClient _apiClient;

  @override
  Future<UserEntitlementsModel> getEntitlements() async {
    final response = await _apiClient.getEntitlements();
    return response.data;
  }
}
