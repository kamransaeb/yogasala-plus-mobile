import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/profile/data/api/user_yoga_sala_plus_api_client.dart';
import 'package:yogasala_plus_mobile/features/profile/data/datasources/user_yoga_sala_plus_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/profile/data/models/user_yoga_sala_plus_model.dart';

/// Remote data source implementation for user yoga sala plus.
@Injectable(as: UserYogaSalaPlusRemoteDataSource)
class UserYogaSalaPlusRemoteDataSourceImpl
    implements UserYogaSalaPlusRemoteDataSource {
  /// Injectable constructor for PostsRemoteDataSourceImpl
  UserYogaSalaPlusRemoteDataSourceImpl(this._logger, this._apiClient);
  final LoggerService _logger;
  final UserYogaSalaPlusApiClient _apiClient;

  @override
  Future<UserYogaSalaPlusModel> getOrCreateUserYogaSalaPlusOpenMobile() async {
    final resposne = await _apiClient.getOrCreateUserYogaSalaPlusOpenMobile();
    return resposne.data;
  }

  @override
  Future<UserYogaSalaPlusModel> updateUserYogaSalaPlusMobileUser(
    UserYogaSalaPlusModel userYogaSalaPlusModel,
  ) async {
    final resposne = await _apiClient.updateUserYogaSalaPlusMobileUser(
      userYogaSalaPlusModel: userYogaSalaPlusModel,
    );
    return resposne.data;
  }

  @override
  Future<UserYogaSalaPlusModel> completeUserYogaSalaPlusMobileUser(
    UserYogaSalaPlusModel userYogaSalaPlusModel,
  ) async {
    final resposne = await _apiClient.completeUserYogaSalaPlusMobileUser(
      userYogaSalaPlusModel: userYogaSalaPlusModel,
    );
    return resposne.data;
  }

  @override
  Future<UserYogaSalaPlusModel> getUserYogaSalaPlusMobileUser() async {
    final resposne = await _apiClient.getUserYogaSalaPlusMobileUser();
    return resposne.data;
  }
}
