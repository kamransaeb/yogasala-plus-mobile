import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_user.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

/// The model for the authentication user.
@freezed
abstract class AuthUserModel with _$AuthUserModel {
  /// Creates a new [AuthUserModel] instance.
  const factory AuthUserModel({
    /// The id of the user.
    required String id,
    required String email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'email_verified') bool? emailVerified,
  }) = _AuthUserModel;

  const AuthUserModel._();

  /// Creates a new [AuthUserModel] instance from a JSON object.
  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  /// Converts the [AuthUserModel] to an [AuthUser].
  AuthUser toEntity() => AuthUser(
    id: id,
    email: email,
    firstName: firstName ?? '',
    lastName: lastName ?? '',
    avatarUrl: avatarUrl ?? '',
    emailVerified: emailVerified ?? false,
  );
}
