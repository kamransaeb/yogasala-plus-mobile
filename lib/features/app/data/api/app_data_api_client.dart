import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/app/data/api/app_data_endpoints.dart';
import 'package:yogasala_plus_mobile/features/app/data/models/app_data_model.dart';

part 'app_data_api_client.g.dart';

/// App-data API client.
@lazySingleton
@RestApi()
abstract class AppDataApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory AppDataApiClient(DioClient dioClient) =>
      _AppDataApiClient(dioClient.dio);

  /// Fetch open-mobile app data by id (public; no auth).
  @GET(AppDataEndpoints.appDataOpenMobile)
  @Extra({
    NetworkConstants.skipAuthExtraKey: true,
    NetworkConstants.forceRefreshExtraKey: true,
  })
  Future<HttpResponse<AppDataModel>> getAppDataOpenMobile({
    @Query('appDataId') required int appDataId,
  });
}
