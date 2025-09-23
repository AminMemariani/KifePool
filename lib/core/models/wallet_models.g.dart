// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainBalance _$ChainBalanceFromJson(Map<String, dynamic> json) => ChainBalance(
  chain: json['chain'] as String,
  symbol: json['symbol'] as String,
  balance: json['balance'] as String,
  usdValue: json['usdValue'] as String,
  decimals: (json['decimals'] as num).toInt(),
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$ChainBalanceToJson(ChainBalance instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'symbol': instance.symbol,
      'balance': instance.balance,
      'usdValue': instance.usdValue,
      'decimals': instance.decimals,
      'logoUrl': instance.logoUrl,
    };

WalletCreationResult _$WalletCreationResultFromJson(
  Map<String, dynamic> json,
) => WalletCreationResult(
  address: json['address'] as String,
  publicKey: json['publicKey'] as String,
  mnemonic: json['mnemonic'] as String,
  derivationPath: json['derivationPath'] as String,
  success: json['success'] as bool,
  error: json['error'] as String?,
);

Map<String, dynamic> _$WalletCreationResultToJson(
  WalletCreationResult instance,
) => <String, dynamic>{
  'address': instance.address,
  'publicKey': instance.publicKey,
  'mnemonic': instance.mnemonic,
  'derivationPath': instance.derivationPath,
  'success': instance.success,
  'error': instance.error,
};

WalletImportResult _$WalletImportResultFromJson(Map<String, dynamic> json) =>
    WalletImportResult(
      address: json['address'] as String,
      publicKey: json['publicKey'] as String,
      success: json['success'] as bool,
      importType: json['importType'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$WalletImportResultToJson(WalletImportResult instance) =>
    <String, dynamic>{
      'address': instance.address,
      'publicKey': instance.publicKey,
      'success': instance.success,
      'error': instance.error,
      'importType': instance.importType,
    };

OnboardingStep _$OnboardingStepFromJson(Map<String, dynamic> json) =>
    OnboardingStep(
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      buttonText: json['buttonText'] as String?,
    );

Map<String, dynamic> _$OnboardingStepToJson(OnboardingStep instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'buttonText': instance.buttonText,
    };

BackupVerification _$BackupVerificationFromJson(Map<String, dynamic> json) =>
    BackupVerification(
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      correctIndices: (json['correctIndices'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$BackupVerificationToJson(BackupVerification instance) =>
    <String, dynamic>{
      'words': instance.words,
      'correctIndices': instance.correctIndices,
      'isComplete': instance.isComplete,
    };
