import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/app/data/models/app_data_model.dart';

/// Remote app configuration / store / legal content payload.
class AppData implements EntityToModelMapper<AppDataModel> {
  /// Creates an [AppData].
  const AppData({
    required this.id,
    required this.buildNumber,
    required this.appVersion,
    required this.storeUrlEn,
    required this.storeUrlTr,
    this.bucketUrl,
    this.bucketName,
    this.bucketFolder,
    this.cloudUrl,
    this.purchaseCallbackUrl,
    this.kvkkPrivacyPolicyEn,
    this.kvkkPrivacyPolicyTr,
    this.onlineSalesAgreementEn,
    this.onlineSalesAgreementTr,
    this.userConsentConfirmationFormEn,
    this.userConsentConfirmationFormTr,
    this.userAgreementsEn,
    this.userAgreementsTr,
    this.personalDataProtectionEn,
    this.personalDataProtectionTr,
    this.kdvTaxPercentage,
    this.forceUpdate,
    this.basketShippingFee,
    this.basketShippingNoFeeLimit,
    this.basketItemCounterLimit,
  });

  /// App data row id (platform-specific in callers).
  final int id;

  /// Remote minimum / reference build number.
  final String buildNumber;

  /// Remote app version string.
  final String appVersion;

  /// App Store / Play Store URL (English).
  final String storeUrlEn;

  /// App Store / Play Store URL (Turkish).
  final String storeUrlTr;

  /// Object storage base URL.
  final String? bucketUrl;

  /// Object storage bucket name.
  final String? bucketName;

  /// Object storage folder prefix.
  final String? bucketFolder;

  /// Cloud CDN / media base URL.
  final String? cloudUrl;

  /// Purchase callback URL.
  final String? purchaseCallbackUrl;

  /// KVKK privacy policy (English).
  final String? kvkkPrivacyPolicyEn;

  /// KVKK privacy policy (Turkish).
  final String? kvkkPrivacyPolicyTr;

  /// Online sales agreement (English).
  final String? onlineSalesAgreementEn;

  /// Online sales agreement (Turkish).
  final String? onlineSalesAgreementTr;

  /// User consent confirmation form (English).
  final String? userConsentConfirmationFormEn;

  /// User consent confirmation form (Turkish).
  final String? userConsentConfirmationFormTr;

  /// User agreements (English).
  final String? userAgreementsEn;

  /// User agreements (Turkish).
  final String? userAgreementsTr;

  /// Personal data protection text (English).
  final String? personalDataProtectionEn;

  /// Personal data protection text (Turkish).
  final String? personalDataProtectionTr;

  /// VAT / KDV tax percentage.
  final int? kdvTaxPercentage;

  /// Whether the client must update before continuing.
  final bool? forceUpdate;

  /// Basket shipping fee.
  final double? basketShippingFee;

  /// Basket total above which shipping is free.
  final double? basketShippingNoFeeLimit;

  /// Max quantity per basket line item.
  final int? basketItemCounterLimit;

  @override
  AppDataModel toModel() => AppDataModel(
    id: id,
    buildNumber: buildNumber,
    appVersion: appVersion,
    storeUrlEn: storeUrlEn,
    storeUrlTr: storeUrlTr,
    bucketUrl: bucketUrl,
    bucketName: bucketName,
    bucketFolder: bucketFolder,
    cloudUrl: cloudUrl,
    purchaseCallbackUrl: purchaseCallbackUrl,
    kvkkPrivacyPolicyEn: kvkkPrivacyPolicyEn,
    kvkkPrivacyPolicyTr: kvkkPrivacyPolicyTr,
    onlineSalesAgreementEn: onlineSalesAgreementEn,
    onlineSalesAgreementTr: onlineSalesAgreementTr,
    userConsentConfirmationFormEn: userConsentConfirmationFormEn,
    userConsentConfirmationFormTr: userConsentConfirmationFormTr,
    userAgreementsEn: userAgreementsEn,
    userAgreementsTr: userAgreementsTr,
    personalDataProtectionEn: personalDataProtectionEn,
    personalDataProtectionTr: personalDataProtectionTr,
    kdvTaxPercentage: kdvTaxPercentage,
    forceUpdate: forceUpdate,
    basketShippingFee: basketShippingFee,
    basketShippingNoFeeLimit: basketShippingNoFeeLimit,
    basketItemCounterLimit: basketItemCounterLimit,
  );
}
