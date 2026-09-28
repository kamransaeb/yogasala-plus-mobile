import 'package:yogasala_plus_mobile/core/enums/user_yoga_sala_plus_account_type.dart';
import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/profile/data/models/user_yoga_sala_plus_model.dart';

/// User Yoga Sala Plus entity
class UserYogaSalaPlus implements EntityToModelMapper<UserYogaSalaPlusModel> {
  /// Constructor
  const UserYogaSalaPlus({
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

  /// Returns a copy of this entity with the given fields replaced.
  UserYogaSalaPlus copyWith({
    int? id,
    String? uid,
    String? name,
    String? surname,
    String? email,
    String? personalPhoneNumber,
    String? address,
    UserYogaSalaPlusAccountType? userYogaSalaPlusAccountType,
    String? notificationToken,
    bool? enabled,
    bool? profileCompleted,
    String? languageCode,
    bool? verified,
    String? turkishIdentificationNumber,
    bool? forceLogout,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    int? gender,
    bool clearName = false,
    bool clearSurname = false,
    bool clearPersonalPhoneNumber = false,
    bool clearAddress = false,
    bool clearNotificationToken = false,
    bool clearTurkishIdentificationNumber = false,
    bool clearProfileImageUrl = false,
    bool clearDateOfBirth = false,
    bool clearGender = false,
  }) {
    return UserYogaSalaPlus(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: clearName ? null : (name ?? this.name),
      surname: clearSurname ? null : (surname ?? this.surname),
      email: email ?? this.email,
      personalPhoneNumber: clearPersonalPhoneNumber
          ? null
          : (personalPhoneNumber ?? this.personalPhoneNumber),
      address: clearAddress ? null : (address ?? this.address),
      userYogaSalaPlusAccountType:
          userYogaSalaPlusAccountType ?? this.userYogaSalaPlusAccountType,
      notificationToken: clearNotificationToken
          ? null
          : (notificationToken ?? this.notificationToken),
      enabled: enabled ?? this.enabled,
      profileCompleted: profileCompleted ?? this.profileCompleted,
      languageCode: languageCode ?? this.languageCode,
      verified: verified ?? this.verified,
      turkishIdentificationNumber: clearTurkishIdentificationNumber
          ? null
          : (turkishIdentificationNumber ?? this.turkishIdentificationNumber),
      forceLogout: forceLogout ?? this.forceLogout,
      profileImageUrl: clearProfileImageUrl
          ? null
          : (profileImageUrl ?? this.profileImageUrl),
      dateOfBirth: clearDateOfBirth ? null : (dateOfBirth ?? this.dateOfBirth),
      gender: clearGender ? null : (gender ?? this.gender),
    );
  }

  /// To model
  @override
  UserYogaSalaPlusModel toModel() {
    return UserYogaSalaPlusModel(
      id: id,
      uid: uid,
      name: name,
      surname: surname,
      email: email,
      userYogaSalaPlusAccountType: userYogaSalaPlusAccountType,
      enabled: enabled,
      profileCompleted: profileCompleted,
      languageCode: languageCode,
      verified: verified,
      forceLogout: forceLogout,
      personalPhoneNumber: personalPhoneNumber,
      address: address,
      notificationToken: notificationToken,
      turkishIdentificationNumber: turkishIdentificationNumber,
      profileImageUrl: profileImageUrl,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
  }
}
