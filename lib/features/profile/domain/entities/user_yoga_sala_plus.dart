import 'package:yogasala_plus_mobile/core/enums/user_yoga_sala_plus_account_type.dart';

/// User Yoga Sala Plus entity
class UserYogaSalaPlus {
  /// Constructor
  const UserYogaSalaPlus({
    required this.id,
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    required this.userYogaSalaPlusAccountType,
    required this.enabled,
    required this.profileCompleted,
    required this.languageCode,
    required this.verified,
    required this.forceLogout,
    this.personalPhoneNumber,
    this.address,
    this.notificationToken,
    this.turkishIdentificationNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
  });

  /// ID
  final int id;

  /// User ID
  final String uid;

  /// Name
  final String name;

  /// Surname
  final String surname;

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
