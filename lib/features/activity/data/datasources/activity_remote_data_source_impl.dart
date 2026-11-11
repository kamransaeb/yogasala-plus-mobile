import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';
import 'package:yogasala_plus_mobile/features/activity/data/api/activity_api_client.dart';
import 'package:yogasala_plus_mobile/features/activity/data/datasources/activity_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/mark_activity_request_model.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/user_activity_day_model.dart';
import 'package:yogasala_plus_mobile/features/activity/data/models/user_activity_streak_model.dart';

/// Implementation of [ActivityRemoteDataSource].
@LazySingleton(as: ActivityRemoteDataSource)
class ActivityRemoteDataSourceImpl implements ActivityRemoteDataSource {
  /// Creates an [ActivityRemoteDataSourceImpl].
  ActivityRemoteDataSourceImpl(this._apiClient);

  final ActivityApiClient _apiClient;

  @override
  Future<void> markActivity(ActivityType type) async {
    await _apiClient.markActivity(
      body: MarkActivityRequestModel(type: type),
    );
  }

  @override
  Future<List<UserActivityDayModel>> getActivity({
    required String from,
    required String to,
  }) async {
    final response = await _apiClient.getActivity(from: from, to: to);
    return response.data;
  }

  @override
  Future<UserActivityStreakModel> getStreak() async {
    final response = await _apiClient.getStreak();
    return response.data;
  }
}
