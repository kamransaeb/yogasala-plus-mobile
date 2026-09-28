import 'package:yogasala_plus_mobile/features/profile/data/models/user_yoga_sala_plus_model.dart';

/// Remote data source for user yoga sala plus.
abstract class UserYogaSalaPlusRemoteDataSource {
  /// Get or create user yoga sala plus open mobile.
  Future<UserYogaSalaPlusModel> getOrCreateUserYogaSalaPlusOpenMobile();

  /// Get user yoga sala plus mobile user.
  Future<UserYogaSalaPlusModel> getUserYogaSalaPlusMobileUser();

  /// Update user yoga sala plus mobile user.
  Future<UserYogaSalaPlusModel> updateUserYogaSalaPlusMobileUser(
    UserYogaSalaPlusModel userYogaSalaPlusModel,
  );

  /// Complete user yoga sala plus mobile user.
  Future<UserYogaSalaPlusModel> completeUserYogaSalaPlusMobileUser(
    UserYogaSalaPlusModel userYogaSalaPlusModel,
  );
}
