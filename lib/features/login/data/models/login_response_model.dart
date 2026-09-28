import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_user_model.dart';
import 'package:yogasala_plus_mobile/features/auth/data/models/auth_tokens_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

/// Represents the response from the login endpoint.
@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  /// The user associated with the login.
  const factory LoginResponseModel({
    required AuthUserModel authUser,
    required AuthTokensModel authTokens,
  }) = _LoginResponseModel;

  const LoginResponseModel._();

  /// Creates a new [LoginResponseModel] instance from a JSON object.
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
