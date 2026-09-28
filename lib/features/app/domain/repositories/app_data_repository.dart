import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/app/domain/entities/app_data.dart';

/// Repository for remote app configuration.
abstract class AppDataRepository {
  /// Fetch app data for the given [appDataId].
  Future<Either<Failure, AppData>> getAppData({required int appDataId});
}
