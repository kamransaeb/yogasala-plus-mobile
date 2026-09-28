// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDataModel _$AppDataModelFromJson(Map<String, dynamic> json) => AppDataModel(
  id: (json['id'] as num).toInt(),
  buildNumber: json['buildNumber'] as String,
  appVersion: json['appVersion'] as String,
  storeUrlEn: json['storeUrlEn'] as String,
  storeUrlTr: json['storeUrlTr'] as String,
  bucketUrl: json['bucketUrl'] as String?,
  bucketName: json['bucketName'] as String?,
  bucketFolder: json['bucketFolder'] as String?,
  cloudUrl: json['cloudUrl'] as String?,
  purchaseCallbackUrl: json['purchaseCallbackUrl'] as String?,
  kvkkPrivacyPolicyEn: json['kvkkPrivacyPolicyEn'] as String?,
  kvkkPrivacyPolicyTr: json['kvkkPrivacyPolicyTr'] as String?,
  onlineSalesAgreementEn: json['onlineSalesAgreementEn'] as String?,
  onlineSalesAgreementTr: json['onlineSalesAgreementTr'] as String?,
  userConsentConfirmationFormEn:
      json['userConsentConfirmationFormEn'] as String?,
  userConsentConfirmationFormTr:
      json['userConsentConfirmationFormTr'] as String?,
  userAgreementsEn: json['userAgreementsEn'] as String?,
  userAgreementsTr: json['userAgreementsTr'] as String?,
  personalDataProtectionEn: json['personalDataProtectionEn'] as String?,
  personalDataProtectionTr: json['personalDataProtectionTr'] as String?,
  kdvTaxPercentage: (json['kdvTaxPercentage'] as num?)?.toInt(),
  forceUpdate: json['forceUpdate'] as bool?,
  basketShippingFee: (json['basketShippingFee'] as num?)?.toDouble(),
  basketShippingNoFeeLimit: (json['basketShippingNoFeeLimit'] as num?)
      ?.toDouble(),
  basketItemCounterLimit: (json['basketItemCounterLimit'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppDataModelToJson(AppDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buildNumber': instance.buildNumber,
      'appVersion': instance.appVersion,
      'storeUrlEn': instance.storeUrlEn,
      'storeUrlTr': instance.storeUrlTr,
      'bucketUrl': instance.bucketUrl,
      'bucketName': instance.bucketName,
      'bucketFolder': instance.bucketFolder,
      'cloudUrl': instance.cloudUrl,
      'purchaseCallbackUrl': instance.purchaseCallbackUrl,
      'kvkkPrivacyPolicyEn': instance.kvkkPrivacyPolicyEn,
      'kvkkPrivacyPolicyTr': instance.kvkkPrivacyPolicyTr,
      'onlineSalesAgreementEn': instance.onlineSalesAgreementEn,
      'onlineSalesAgreementTr': instance.onlineSalesAgreementTr,
      'userConsentConfirmationFormEn': instance.userConsentConfirmationFormEn,
      'userConsentConfirmationFormTr': instance.userConsentConfirmationFormTr,
      'userAgreementsEn': instance.userAgreementsEn,
      'userAgreementsTr': instance.userAgreementsTr,
      'personalDataProtectionEn': instance.personalDataProtectionEn,
      'personalDataProtectionTr': instance.personalDataProtectionTr,
      'kdvTaxPercentage': instance.kdvTaxPercentage,
      'forceUpdate': instance.forceUpdate,
      'basketShippingFee': instance.basketShippingFee,
      'basketShippingNoFeeLimit': instance.basketShippingNoFeeLimit,
      'basketItemCounterLimit': instance.basketItemCounterLimit,
    };
