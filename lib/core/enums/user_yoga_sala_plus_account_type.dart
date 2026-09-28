import 'package:freezed_annotation/freezed_annotation.dart';

/// User Yoga Sala Plus account type
enum UserYogaSalaPlusAccountType {
  /// Admin
  @JsonValue(0)
  admin,

  /// User
  @JsonValue(1)
  user,
}
