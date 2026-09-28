import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/app/data/api/app_data_api_client.dart';
import 'package:yogasala_plus_mobile/features/app/data/datasources/app_data_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/app/data/models/app_data_model.dart';

/// Remote data source implementation for app data.
@Injectable(as: AppDataRemoteDataSource)
class AppDataRemoteDataSourceImpl implements AppDataRemoteDataSource {
  /// Creates an [AppDataRemoteDataSourceImpl].
  AppDataRemoteDataSourceImpl(this._logger, this._apiClient);

  final LoggerService _logger;
  final AppDataApiClient _apiClient;

  @override
  Future<AppDataModel> getAppDataOpenMobile({required int appDataId}) async {
    _logger.d('getAppDataOpenMobile appDataId=$appDataId');
    final response = await _apiClient.getAppDataOpenMobile(
      appDataId: appDataId,
    );
    return response.data;
  }
}
