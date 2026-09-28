// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/profile/data/api/user_yoga_sala_plus_endpoints.dart';
import 'package:yogasala_plus_mobile/features/profile/data/models/user_yoga_sala_plus_model.dart';

part 'user_yoga_sala_plus_api_client.g.dart';

/// User Yoga Sala Plus API client.
@lazySingleton
@RestApi()
abstract class UserYogaSalaPlusApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory UserYogaSalaPlusApiClient(DioClient dioClient) =>
      _UserYogaSalaPlusApiClient(dioClient.dio);

  /// Get or create open-mobile profile (requires Firebase id token).
  @GET(UserYogaSalaPlusEndpoints.getOrCreateUserYogaSalaPlusOpenMobile)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserYogaSalaPlusModel>>
  getOrCreateUserYogaSalaPlusOpenMobile();

  /// Get mobile client profile (requires Firebase id token).
  @GET(UserYogaSalaPlusEndpoints.getUserYogaSalaPlusMobileUser)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserYogaSalaPlusModel>> getUserYogaSalaPlusMobileUser();

  /// Update user yoga sala plus mobile client
  @PUT(UserYogaSalaPlusEndpoints.updateUserYogaSalaPlusMobileUser)
  Future<HttpResponse<UserYogaSalaPlusModel>> updateUserYogaSalaPlusMobileUser({
    @Body() required UserYogaSalaPlusModel userYogaSalaPlusModel,
  });

  /// Complete user yoga sala plus mobile client
  @PUT(UserYogaSalaPlusEndpoints.completeUserYogaSalaPlusMobileUser)
  Future<HttpResponse<UserYogaSalaPlusModel>>
  completeUserYogaSalaPlusMobileUser({
    @Body() required UserYogaSalaPlusModel userYogaSalaPlusModel,
  });
}
