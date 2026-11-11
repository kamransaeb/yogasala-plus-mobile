import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

/// Auth API client.
@lazySingleton
@RestApi()
abstract class AuthApiClient {
  /// Factory method.
  @factoryMethod
  factory AuthApiClient(DioClient dioClient) => _AuthApiClient(dioClient.dio);
}
