// import 'package:isar/isar.dart'; // Removed - using SQLite instead
import 'package:json_annotation/json_annotation.dart';

part 'wallet_models.g.dart';

/// Wallet account model for Isar database
class WalletAccount {
  late String address;

  late String name;
  late String publicKey;
  late String encryptedPrivateKey; // Encrypted private key
  late String derivationPath;
  late int accountIndex;
  late DateTime createdAt;
  late DateTime lastUsed;
  late bool isActive;
  late String walletType; // 'mnemonic' or 'private_key'
  late String? mnemonicId; // Reference to mnemonic if applicable

  WalletAccount();

  WalletAccount.create({
    required this.address,
    required this.name,
    required this.publicKey,
    required this.encryptedPrivateKey,
    required this.derivationPath,
    required this.accountIndex,
    required this.walletType,
    this.mnemonicId,
  }) {
    createdAt = DateTime.now();
    lastUsed = DateTime.now();
    isActive = true;
  }
}

/// Mnemonic wallet model for Isar database
class MnemonicWallet {
  late String encryptedMnemonic; // Encrypted 12/24 word mnemonic
  late int wordCount; // 12 or 24
  late String name;
  late DateTime createdAt;
  late DateTime lastUsed;
  late bool isActive;
  late int accountCount; // Number of accounts derived from this mnemonic

  MnemonicWallet();

  MnemonicWallet.create({
    required this.encryptedMnemonic,
    required this.wordCount,
    required this.name,
  }) {
    createdAt = DateTime.now();
    lastUsed = DateTime.now();
    isActive = true;
    accountCount = 0;
  }
}

/// Chain balance model
@JsonSerializable()
class ChainBalance {
  final String chain;
  final String symbol;
  final String balance;
  final String usdValue;
  final int decimals;
  final String? logoUrl;

  const ChainBalance({
    required this.chain,
    required this.symbol,
    required this.balance,
    required this.usdValue,
    required this.decimals,
    this.logoUrl,
  });

  factory ChainBalance.fromJson(Map<String, dynamic> json) =>
      _$ChainBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$ChainBalanceToJson(this);
}

/// Wallet creation result
@JsonSerializable()
class WalletCreationResult {
  final String address;
  final String publicKey;
  final String mnemonic;
  final String derivationPath;
  final bool success;
  final String? error;

  const WalletCreationResult({
    required this.address,
    required this.publicKey,
    required this.mnemonic,
    required this.derivationPath,
    required this.success,
    this.error,
  });

  factory WalletCreationResult.fromJson(Map<String, dynamic> json) =>
      _$WalletCreationResultFromJson(json);

  Map<String, dynamic> toJson() => _$WalletCreationResultToJson(this);
}

/// Wallet import result
@JsonSerializable()
class WalletImportResult {
  final String address;
  final String publicKey;
  final bool success;
  final String? error;
  final String importType; // 'mnemonic' or 'private_key'

  const WalletImportResult({
    required this.address,
    required this.publicKey,
    required this.success,
    required this.importType,
    this.error,
  });

  factory WalletImportResult.fromJson(Map<String, dynamic> json) =>
      _$WalletImportResultFromJson(json);

  Map<String, dynamic> toJson() => _$WalletImportResultToJson(this);
}

/// Onboarding step model
@JsonSerializable()
class OnboardingStep {
  final String title;
  final String description;
  final String imagePath;
  final String? buttonText;

  const OnboardingStep({
    required this.title,
    required this.description,
    required this.imagePath,
    this.buttonText,
  });

  factory OnboardingStep.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStepFromJson(json);

  Map<String, dynamic> toJson() => _$OnboardingStepToJson(this);
}

/// Wallet backup verification model
@JsonSerializable()
class BackupVerification {
  final List<String> words;
  final List<int> correctIndices;
  final bool isComplete;

  const BackupVerification({
    required this.words,
    required this.correctIndices,
    required this.isComplete,
  });

  factory BackupVerification.fromJson(Map<String, dynamic> json) =>
      _$BackupVerificationFromJson(json);

  Map<String, dynamic> toJson() => _$BackupVerificationToJson(this);
}

/// Wallet error types
enum WalletErrorType {
  mnemonicInvalid,
  privateKeyInvalid,
  encryptionFailed,
  decryptionFailed,
  accountNotFound,
  accountAlreadyExists,
  storageError,
  networkError,
  userCancelled,
  unknown,
}

/// Wallet exception
class WalletException implements Exception {
  final WalletErrorType type;
  final String message;
  final String? details;

  const WalletException({
    required this.type,
    required this.message,
    this.details,
  });

  @override
  String toString() =>
      'WalletException: $message${details != null ? ' - $details' : ''}';
}
