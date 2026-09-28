import 'package:yogasala_plus_mobile/features/app/data/models/app_data_model.dart';

/// Remote data source for app data.
abstract class AppDataRemoteDataSource {
  /// Fetch open-mobile app data by [appDataId].
  Future<AppDataModel> getAppDataOpenMobile({required int appDataId});
}
