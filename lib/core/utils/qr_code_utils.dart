import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:kifepool/core/models/transfer_models.dart';

/// QR code utilities for transfer operations
class QrCodeUtils {
  /// Generate QR code widget for token transfer
  static Widget generateTokenQrCode({
    required String recipientAddress,
    required String amount,
    required String tokenSymbol,
    required String chain,
    String? memo,
    double size = 200,
  }) {
    final qrData = TransferQrData(
      type: 'token',
      recipientAddress: recipientAddress,
      amount: amount,
      tokenSymbol: tokenSymbol,
      chain: chain,
      memo: memo,
    );

    return QrImageView(
      data: jsonEncode(qrData.toJson()),
      version: QrVersions.auto,
      size: size,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      errorStateBuilder: (context, error) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text('QR Code Error', style: TextStyle(color: Colors.red)),
          ),
        );
      },
    );
  }

  /// Generate QR code widget for NFT transfer
  static Widget generateNftQrCode({
    required String recipientAddress,
    required String nftId,
    required String collectionId,
    required String chain,
    String? memo,
    double size = 200,
  }) {
    final qrData = TransferQrData(
      type: 'nft',
      recipientAddress: recipientAddress,
      nftId: nftId,
      collectionId: collectionId,
      chain: chain,
      memo: memo,
    );

    return QrImageView(
      data: jsonEncode(qrData.toJson()),
      version: QrVersions.auto,
      size: size,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      errorStateBuilder: (context, error) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text('QR Code Error', style: TextStyle(color: Colors.red)),
          ),
        );
      },
    );
  }

  /// Generate QR code widget for receive address
  static Widget generateReceiveQrCode({
    required String address,
    required String chain,
    String? tokenSymbol,
    double size = 200,
  }) {
    final qrData = TransferQrData(
      type: 'receive',
      recipientAddress: address,
      chain: chain,
      tokenSymbol: tokenSymbol,
    );

    return QrImageView(
      data: jsonEncode(qrData.toJson()),
      version: QrVersions.auto,
      size: size,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      errorStateBuilder: (context, error) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text('QR Code Error', style: TextStyle(color: Colors.red)),
          ),
        );
      },
    );
  }

  /// Parse QR code data from scanned result
  static TransferQrData? parseQrData(String qrData) {
    try {
      final data = jsonDecode(qrData) as Map<String, dynamic>;
      return TransferQrData.fromJson(data);
    } catch (e) {
      debugPrint('Failed to parse QR data: $e');
      return null;
    }
  }

  /// Validate QR code data
  static bool isValidQrData(TransferQrData qrData) {
    if (qrData.chain.isEmpty) return false;

    switch (qrData.type) {
      case 'token':
        return qrData.recipientAddress != null &&
            qrData.amount != null &&
            qrData.tokenSymbol != null;
      case 'nft':
        return qrData.recipientAddress != null &&
            qrData.nftId != null &&
            qrData.collectionId != null;
      case 'receive':
        return qrData.recipientAddress != null;
      default:
        return false;
    }
  }

  /// Get QR code data as string
  static String getQrDataString(TransferQrData qrData) {
    return jsonEncode(qrData.toJson());
  }

  /// Create QR scanner widget
  static Widget createQrScanner({
    required Function(TransferQrData) onScan,
    required VoidCallback onCancel,
  }) {
    return MobileScanner(
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          if (barcode.rawValue != null) {
            final qrData = parseQrData(barcode.rawValue!);
            if (qrData != null && isValidQrData(qrData)) {
              onScan(qrData);
              return;
            }
          }
        }
      },
    );
  }

  /// Format QR data for display
  static String formatQrDataForDisplay(TransferQrData qrData) {
    switch (qrData.type) {
      case 'token':
        return 'Token Transfer\n'
            'To: ${qrData.recipientAddress}\n'
            'Amount: ${qrData.amount} ${qrData.tokenSymbol}\n'
            'Chain: ${qrData.chain}';
      case 'nft':
        return 'NFT Transfer\n'
            'To: ${qrData.recipientAddress}\n'
            'NFT: ${qrData.nftId}\n'
            'Collection: ${qrData.collectionId}\n'
            'Chain: ${qrData.chain}';
      case 'receive':
        return 'Receive Address\n'
            'Address: ${qrData.recipientAddress}\n'
            'Chain: ${qrData.chain}';
      default:
        return 'Unknown QR Data';
    }
  }

  /// Get QR code type display name
  static String getQrTypeDisplayName(String type) {
    switch (type) {
      case 'token':
        return 'Token Transfer';
      case 'nft':
        return 'NFT Transfer';
      case 'receive':
        return 'Receive Address';
      default:
        return 'Unknown';
    }
  }

  /// Get QR code type icon
  static IconData getQrTypeIcon(String type) {
    switch (type) {
      case 'token':
        return Icons.account_balance_wallet;
      case 'nft':
        return Icons.image;
      case 'receive':
        return Icons.qr_code_scanner;
      default:
        return Icons.help_outline;
    }
  }

  /// Get QR code type color
  static Color getQrTypeColor(String type) {
    switch (type) {
      case 'token':
        return Colors.blue;
      case 'nft':
        return Colors.purple;
      case 'receive':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
