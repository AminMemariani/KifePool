import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:kifepool/core/models/transfer_models.dart';
import 'package:kifepool/core/services/rpc_node_service.dart';
import 'package:kifepool/core/services/database_service.dart';

/// Service for handling token and NFT transfers
class TransferService {
  /// Send token transfer
  static Future<TransferResult> sendToken(TransferRequest request) async {
    try {
      // Validate the transfer request
      final validation = await validateTokenTransfer(request);
      if (!validation.isValid) {
        return TransferResult(
          success: false,
          error: validation.errors.join(', '),
        );
      }

      // Get RPC endpoint
      final endpoint = RpcNodeService.getRpcUrl(request.chain);
      if (endpoint == null) {
        throw TransferException(
          message: 'No RPC node configured for chain: ${request.chain}',
        );
      }

      // Create WebSocket connection
      final channel = WebSocketChannel.connect(Uri.parse(endpoint));

      // Prepare transfer transaction (metadata will be handled separately)

      // Send transfer transaction
      final requestData = {
        'jsonrpc': '2.0',
        'id': Random().nextInt(1000000),
        'method': 'api.tx.balances.transfer',
        'params': [request.recipientAddress, request.amount],
      };

      channel.sink.add(jsonEncode(requestData));

      // Wait for response
      final response = await channel.stream.first;
      final responseData = jsonDecode(response) as Map<String, dynamic>;

      await channel.sink.close();

      if (responseData['result'] != null) {
        final transactionHash = responseData['result']['hash'] as String?;

        // Save transfer to database
        final transfer = TokenTransfer()
          ..transactionHash = transactionHash ?? 'pending'
          ..fromAddress =
              'sender_address' // This would be the actual sender
          ..toAddress = request.recipientAddress
          ..tokenSymbol = request.tokenSymbol
          ..tokenName = request.tokenSymbol
          ..amount = request.amount
          ..chain = request.chain
          ..direction = TransferDirection.send
          ..status = TransferStatus.pending
          ..gasFee = validation.estimatedGasFee
          ..gasUsed = validation.estimatedGasUsed
          ..timestamp = DateTime.now()
          ..createdAt = DateTime.now()
          ..memo = request.memo;

        await DatabaseService.saveTokenTransfer(transfer);

        return TransferResult(
          success: true,
          transactionHash: transactionHash,
          gasUsed: validation.estimatedGasUsed,
          gasFee: validation.estimatedGasFee,
        );
      } else {
        return TransferResult(
          success: false,
          error:
              'Transfer failed: ${responseData['error']?['message'] ?? 'Unknown error'}',
        );
      }
    } catch (e) {
      debugPrint('Token transfer error: $e');
      return TransferResult(success: false, error: e.toString());
    }
  }

  /// Send NFT transfer
  static Future<TransferResult> sendNft(NftTransferRequest request) async {
    try {
      // Validate the NFT transfer request
      final validation = await validateNftTransfer(request);
      if (!validation.isValid) {
        return TransferResult(
          success: false,
          error: validation.errors.join(', '),
        );
      }

      // Get RPC endpoint
      final endpoint = RpcNodeService.getRpcUrl(request.chain);
      if (endpoint == null) {
        throw TransferException(
          message: 'No RPC node configured for chain: ${request.chain}',
        );
      }

      // Create WebSocket connection
      final channel = WebSocketChannel.connect(Uri.parse(endpoint));

      // Send NFT transfer transaction
      final requestData = {
        'jsonrpc': '2.0',
        'id': Random().nextInt(1000000),
        'method': 'api.tx.uniques.transfer',
        'params': [
          request.collectionId,
          request.nftId,
          request.recipientAddress,
        ],
      };

      channel.sink.add(jsonEncode(requestData));

      // Wait for response
      final response = await channel.stream.first;
      final responseData = jsonDecode(response) as Map<String, dynamic>;

      await channel.sink.close();

      if (responseData['result'] != null) {
        final transactionHash = responseData['result']['hash'] as String?;

        // Save NFT transfer to database
        final transfer = NftTransfer()
          ..transactionHash = transactionHash ?? 'pending'
          ..fromAddress =
              'sender_address' // This would be the actual sender
          ..toAddress = request.recipientAddress
          ..nftId = request.nftId
          ..collectionId = request.collectionId
          ..nftName = 'NFT #${request.nftId}'
          ..chain = request.chain
          ..direction = TransferDirection.send
          ..status = TransferStatus.pending
          ..gasFee = validation.estimatedGasFee
          ..gasUsed = validation.estimatedGasUsed
          ..timestamp = DateTime.now()
          ..createdAt = DateTime.now()
          ..memo = request.memo;

        await DatabaseService.saveNftTransfer(transfer);

        return TransferResult(
          success: true,
          transactionHash: transactionHash,
          gasUsed: validation.estimatedGasUsed,
          gasFee: validation.estimatedGasFee,
        );
      } else {
        return TransferResult(
          success: false,
          error:
              'NFT transfer failed: ${responseData['error']?['message'] ?? 'Unknown error'}',
        );
      }
    } catch (e) {
      debugPrint('NFT transfer error: $e');
      return TransferResult(success: false, error: e.toString());
    }
  }

  /// Validate token transfer request
  static Future<TransferValidation> validateTokenTransfer(
    TransferRequest request,
  ) async {
    final errors = <String>[];

    // Validate recipient address
    if (request.recipientAddress.isEmpty) {
      errors.add('Recipient address is required');
    } else if (!_isValidAddress(request.recipientAddress)) {
      errors.add('Invalid recipient address format');
    }

    // Validate amount
    if (request.amount.isEmpty) {
      errors.add('Amount is required');
    } else {
      final amount = double.tryParse(request.amount);
      if (amount == null || amount <= 0) {
        errors.add('Amount must be a positive number');
      }
    }

    // Validate token symbol
    if (request.tokenSymbol.isEmpty) {
      errors.add('Token symbol is required');
    }

    // Validate chain
    if (request.chain.isEmpty) {
      errors.add('Chain is required');
    }

    // Estimate gas fee (simplified)
    final estimatedGasFee =
        '0.001'; // This would be calculated based on chain and token
    final estimatedGasUsed = '21000'; // Standard gas limit for token transfers

    return TransferValidation(
      isValid: errors.isEmpty,
      errors: errors,
      estimatedGasFee: estimatedGasFee,
      estimatedGasUsed: estimatedGasUsed,
    );
  }

  /// Validate NFT transfer request
  static Future<TransferValidation> validateNftTransfer(
    NftTransferRequest request,
  ) async {
    final errors = <String>[];

    // Validate recipient address
    if (request.recipientAddress.isEmpty) {
      errors.add('Recipient address is required');
    } else if (!_isValidAddress(request.recipientAddress)) {
      errors.add('Invalid recipient address format');
    }

    // Validate NFT ID
    if (request.nftId.isEmpty) {
      errors.add('NFT ID is required');
    }

    // Validate collection ID
    if (request.collectionId.isEmpty) {
      errors.add('Collection ID is required');
    }

    // Validate chain
    if (request.chain.isEmpty) {
      errors.add('Chain is required');
    }

    // Estimate gas fee (simplified)
    final estimatedGasFee = '0.002'; // NFT transfers typically cost more
    final estimatedGasUsed = '50000'; // Higher gas limit for NFT transfers

    return TransferValidation(
      isValid: errors.isEmpty,
      errors: errors,
      estimatedGasFee: estimatedGasFee,
      estimatedGasUsed: estimatedGasUsed,
    );
  }

  /// Get transfer history
  static Future<List<TokenTransfer>> getTokenTransferHistory({
    String? address,
    String? chain,
    int limit = 50,
  }) async {
    return await DatabaseService.getTokenTransferHistory(
      address: address,
      chain: chain,
      limit: limit,
    );
  }

  /// Get NFT transfer history
  static Future<List<NftTransfer>> getNftTransferHistory({
    String? address,
    String? chain,
    int limit = 50,
  }) async {
    return await DatabaseService.getNftTransferHistory(
      address: address,
      chain: chain,
      limit: limit,
    );
  }

  /// Get transfer by transaction hash
  static Future<TokenTransfer?> getTokenTransferByHash(
    String transactionHash,
  ) async {
    return await DatabaseService.getTokenTransferByHash(transactionHash);
  }

  /// Get NFT transfer by transaction hash
  static Future<NftTransfer?> getNftTransferByHash(
    String transactionHash,
  ) async {
    return await DatabaseService.getNftTransferByHash(transactionHash);
  }

  /// Get all transfers (tokens and NFTs) for an address
  static Future<List<dynamic>> getAllTransfers({
    required String address,
    String? chain,
    int limit = 50,
  }) async {
    return await DatabaseService.getAllTransfers(
      address: address,
      chain: chain,
      limit: limit,
    );
  }

  /// Update transfer status
  static Future<void> updateTransferStatus(
    String transactionHash,
    TransferStatus status, {
    String? blockNumber,
    String? gasUsed,
  }) async {
    // Update token transfer
    final tokenTransfer = await DatabaseService.getTokenTransferByHash(
      transactionHash,
    );
    if (tokenTransfer != null) {
      tokenTransfer.status = status;
      tokenTransfer.updatedAt = DateTime.now();
      if (blockNumber != null) tokenTransfer.blockNumber = blockNumber;
      if (gasUsed != null) tokenTransfer.gasUsed = gasUsed;
      await DatabaseService.updateTokenTransfer(tokenTransfer);
    }

    // Update NFT transfer
    final nftTransfer = await DatabaseService.getNftTransferByHash(
      transactionHash,
    );
    if (nftTransfer != null) {
      nftTransfer.status = status;
      nftTransfer.updatedAt = DateTime.now();
      if (blockNumber != null) nftTransfer.blockNumber = blockNumber;
      if (gasUsed != null) nftTransfer.gasUsed = gasUsed;
      await DatabaseService.updateNftTransfer(nftTransfer);
    }
  }

  /// Validate address format (simplified)
  static bool _isValidAddress(String address) {
    // Basic validation - in production, this would be more comprehensive
    return address.isNotEmpty && address.length >= 32;
  }

  /// Generate QR code data for token transfer
  static TransferQrData generateTokenQrData({
    required String recipientAddress,
    required String amount,
    required String tokenSymbol,
    required String chain,
    String? memo,
  }) {
    return TransferQrData(
      type: 'token',
      recipientAddress: recipientAddress,
      amount: amount,
      tokenSymbol: tokenSymbol,
      chain: chain,
      memo: memo,
    );
  }

  /// Generate QR code data for NFT transfer
  static TransferQrData generateNftQrData({
    required String recipientAddress,
    required String nftId,
    required String collectionId,
    required String chain,
    String? memo,
  }) {
    return TransferQrData(
      type: 'nft',
      recipientAddress: recipientAddress,
      nftId: nftId,
      collectionId: collectionId,
      chain: chain,
      memo: memo,
    );
  }

  /// Parse QR code data
  static TransferQrData? parseQrData(String qrData) {
    try {
      final data = jsonDecode(qrData) as Map<String, dynamic>;
      return TransferQrData.fromJson(data);
    } catch (e) {
      debugPrint('Failed to parse QR data: $e');
      return null;
    }
  }
}
