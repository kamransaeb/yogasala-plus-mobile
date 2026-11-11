import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/data/api/entitlements_endpoints.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/data/models/user_entitlements_model.dart';

part 'entitlements_api_client.g.dart';

/// User entitlements API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class EntitlementsApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory EntitlementsApiClient(DioClient dioClient) =>
      _EntitlementsApiClient(dioClient.dio);

  /// Current plan + entitlement ids.
  @GET(EntitlementsEndpoints.entitlements)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserEntitlementsModel>> getEntitlements();
}
