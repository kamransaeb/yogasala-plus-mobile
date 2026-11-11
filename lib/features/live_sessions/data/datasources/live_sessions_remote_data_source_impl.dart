import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/api/live_sessions_api_client.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/datasources/live_sessions_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/models/live_join_model.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/data/models/live_session_model.dart';

/// Implementation of [LiveSessionsRemoteDataSource].
@LazySingleton(as: LiveSessionsRemoteDataSource)
class LiveSessionsRemoteDataSourceImpl implements LiveSessionsRemoteDataSource {
  /// Creates a [LiveSessionsRemoteDataSourceImpl].
  LiveSessionsRemoteDataSourceImpl(this._apiClient);

  final LiveSessionsApiClient _apiClient;

  @override
  Future<List<LiveSessionModel>> getLiveSessions({int days = 7}) async {
    final response = await _apiClient.getLiveSessions(days: days);
    return response.data;
  }

  @override
  Future<LiveJoinModel> joinLiveSession({
    required int slotId,
    required String occurrenceStart,
  }) async {
    final response = await _apiClient.joinLiveSession(
      slotId: slotId,
      occurrenceStart: occurrenceStart,
    );
    return response.data;
  }
}
