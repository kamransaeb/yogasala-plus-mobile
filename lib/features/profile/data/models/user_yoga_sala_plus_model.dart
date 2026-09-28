import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/user_yoga_sala_plus_account_type.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

part 'user_yoga_sala_plus_model.g.dart';

/// User Yoga Sala Plus model to JSON
/// Serializable model
@JsonSerializable()
class UserYogaSalaPlusModel implements ModelToEntityMapper<UserYogaSalaPlus> {
  /// Constructor
  /// Constructor
  const UserYogaSalaPlusModel({
    required this.id,
    required this.uid,
    required this.email,
    required this.userYogaSalaPlusAccountType,
    required this.enabled,
    required this.profileCompleted,
    required this.languageCode,
    required this.verified,
    required this.forceLogout,
    this.name,
    this.surname,
    this.personalPhoneNumber,
    this.address,
    this.notificationToken,
    this.turkishIdentificationNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
  });

  /// JSON constructor
  factory UserYogaSalaPlusModel.fromJson(Map<String, dynamic> json) =>
      _$UserYogaSalaPlusModelFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$UserYogaSalaPlusModelToJson(this);

  /// To entity
  @override
  UserYogaSalaPlus toEntity() => UserYogaSalaPlus(
    id: id,
    uid: uid,
    name: name,
    surname: surname,
    email: email,
    personalPhoneNumber: personalPhoneNumber,
    verified: verified,
    forceLogout: forceLogout,
    address: address,
    userYogaSalaPlusAccountType: userYogaSalaPlusAccountType,
    notificationToken: notificationToken,
    enabled: enabled,
    profileCompleted: profileCompleted,
    languageCode: languageCode,
    turkishIdentificationNumber: turkishIdentificationNumber,
    profileImageUrl: profileImageUrl,
    dateOfBirth: dateOfBirth,
    gender: gender,
  );

  /// ID
  final int id;

  /// User ID
  final String uid;

  /// Name
  final String? name;

  /// Surname
  final String? surname;

  /// Email
  final String email;

  /// Personal phone number
  final String? personalPhoneNumber;

  /// Address
  final String? address;

  /// User account type
  final UserYogaSalaPlusAccountType userYogaSalaPlusAccountType;

  /// Notification token
  final String? notificationToken;

  /// Enabled
  final bool enabled;

  /// Profile completed
  final bool profileCompleted;

  /// Language code
  final String languageCode;

  /// Verified
  final bool verified;

  /// Turkish identification number
  final String? turkishIdentificationNumber;

  /// Force logout
  final bool forceLogout;

  /// Profile image URL
  final String? profileImageUrl;

  /// Date of birth
  final DateTime? dateOfBirth;

  /// Gender
  final int? gender;
}
