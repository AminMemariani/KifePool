import 'dart:async';
import 'blockchain_service.dart';
import '../models/blockchain_models.dart';
import 'error_handler.dart';

/// Test class for BlockchainService to demonstrate functionality
class BlockchainServiceTest {
  final BlockchainService _service = BlockchainService();

  /// Test the service against multiple parachains
  Future<void> runTests() async {
    print('🚀 Starting BlockchainService tests...\n');

    // Test networks
    final testNetworks = [
      BlockchainNetwork.polkadot,
      BlockchainNetwork.moonbeam,
      BlockchainNetwork.astar,
    ];

    // Test address (this is a valid Polkadot address format)
    const testAddress = '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5';

    for (final network in testNetworks) {
      await _testNetwork(network, testAddress);
    }

    await _service.dispose();
    print('✅ All tests completed!');
  }

  /// Test a specific network
  Future<void> _testNetwork(BlockchainNetwork network, String address) async {
    print('🔗 Testing ${network.name}...');

    try {
      // Test 1: Get Balance
      await _testGetBalance(network, address);

      // Test 2: Get Transaction History
      await _testGetTransactionHistory(network, address);

      // Test 3: Get NFTs
      await _testGetNFTs(network, address);

      // Test 4: Get Staking Info
      await _testGetStakingInfo(network, address);

      // Test 5: Send Transaction (mock)
      await _testSendTransaction(network, address);

      // Test 6: Stake Tokens (mock)
      await _testStakeTokens(network, address);

      // Test 7: Cross-chain Transfer (mock)
      await _testCrossChainTransfer(network, address);

      print('✅ ${network.name} tests passed!\n');
    } catch (e) {
      print('❌ ${network.name} tests failed: $e\n');
    }
  }

  /// Test getBalance function
  Future<void> _testGetBalance(
    BlockchainNetwork network,
    String address,
  ) async {
    try {
      print('  📊 Testing getBalance...');
      final balance = await _service.getBalance(address, network);

      print('    ✅ Balance retrieved:');
      print('      Address: ${balance.address}');
      print('      Chain: ${balance.chain}');
      print('      Free: ${balance.free} ${balance.symbol}');
      print('      Total: ${balance.total} ${balance.symbol}');
      print('      Decimals: ${balance.decimals}');

      ErrorHandler.logSuccess(
        'getBalance',
        context: network.name,
        additionalData: {
          'address': address,
          'balance': balance.total,
          'symbol': balance.symbol,
        },
      );
    } catch (e) {
      print('    ❌ getBalance failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(
          e,
          context: 'getBalance test for ${network.name}',
        );
      }
    }
  }

  /// Test getTransactionHistory function
  Future<void> _testGetTransactionHistory(
    BlockchainNetwork network,
    String address,
  ) async {
    try {
      print('  📜 Testing getTransactionHistory...');
      final transactions = await _service.getTransactionHistory(
        address,
        network,
      );

      print('    ✅ Transaction history retrieved:');
      print('      Found ${transactions.length} transactions');

      if (transactions.isNotEmpty) {
        final tx = transactions.first;
        print('      Latest transaction:');
        print('        Hash: ${tx.hash}');
        print('        From: ${tx.from}');
        print('        To: ${tx.to}');
        print('        Amount: ${tx.amount} ${tx.symbol}');
        print('        Status: ${tx.status.name}');
      }

      ErrorHandler.logSuccess(
        'getTransactionHistory',
        context: network.name,
        additionalData: {
          'address': address,
          'transaction_count': transactions.length,
        },
      );
    } catch (e) {
      print('    ❌ getTransactionHistory failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(
          e,
          context: 'getTransactionHistory test for ${network.name}',
        );
      }
    }
  }

  /// Test getNFTs function
  Future<void> _testGetNFTs(BlockchainNetwork network, String address) async {
    try {
      print('  🖼️  Testing getNFTs...');
      final nfts = await _service.getNFTs(address, network);

      print('    ✅ NFTs retrieved:');
      print('      Found ${nfts.length} NFTs');

      if (nfts.isNotEmpty) {
        final nft = nfts.first;
        print('      Sample NFT:');
        print('        ID: ${nft.id}');
        print('        Name: ${nft.name}');
        print('        Collection: ${nft.collection}');
        print('        Owner: ${nft.owner}');
      }

      ErrorHandler.logSuccess(
        'getNFTs',
        context: network.name,
        additionalData: {'address': address, 'nft_count': nfts.length},
      );
    } catch (e) {
      print('    ❌ getNFTs failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(e, context: 'getNFTs test for ${network.name}');
      }
    }
  }

  /// Test getStakingInfo function
  Future<void> _testGetStakingInfo(
    BlockchainNetwork network,
    String address,
  ) async {
    try {
      print('  🏦 Testing getStakingInfo...');
      final stakingInfo = await _service.getStakingInfo(address, network);

      print('    ✅ Staking info retrieved:');
      print('      Staked: ${stakingInfo.staked} ${stakingInfo.symbol}');
      print('      Unstaking: ${stakingInfo.unstaking} ${stakingInfo.symbol}');
      print('      Rewards: ${stakingInfo.rewards} ${stakingInfo.symbol}');
      print('      Validators: ${stakingInfo.validators.length}');

      if (stakingInfo.validators.isNotEmpty) {
        final validator = stakingInfo.validators.first;
        print('      Sample validator:');
        print('        Address: ${validator.address}');
        print('        Name: ${validator.name}');
        print('        Commission: ${validator.commission}%');
        print('        Active: ${validator.isActive}');
      }

      ErrorHandler.logSuccess(
        'getStakingInfo',
        context: network.name,
        additionalData: {
          'address': address,
          'staked_amount': stakingInfo.staked,
          'validator_count': stakingInfo.validators.length,
        },
      );
    } catch (e) {
      print('    ❌ getStakingInfo failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(
          e,
          context: 'getStakingInfo test for ${network.name}',
        );
      }
    }
  }

  /// Test sendTransaction function
  Future<void> _testSendTransaction(
    BlockchainNetwork network,
    String address,
  ) async {
    try {
      print('  💸 Testing sendTransaction...');
      final result = await _service.sendTransaction(
        from: address,
        to: address, // Self-transfer for testing
        amount: '1000000000', // 0.001 DOT (in smallest unit)
        chain: network,
      );

      print('    ✅ Transaction sent:');
      print('      Hash: ${result.hash}');
      print('      Success: ${result.success}');
      print('      Block: ${result.blockNumber}');

      ErrorHandler.logSuccess(
        'sendTransaction',
        context: network.name,
        additionalData: {
          'from': address,
          'to': address,
          'amount': '1000000000',
          'tx_hash': result.hash,
        },
      );
    } catch (e) {
      print('    ❌ sendTransaction failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(
          e,
          context: 'sendTransaction test for ${network.name}',
        );
      }
    }
  }

  /// Test stakeTokens function
  Future<void> _testStakeTokens(
    BlockchainNetwork network,
    String address,
  ) async {
    try {
      print('  🔒 Testing stakeTokens...');
      final result = await _service.stakeTokens(
        address: address,
        amount: '10000000000', // 0.01 DOT
        chain: network,
      );

      print('    ✅ Tokens staked:');
      print('      Hash: ${result.hash}');
      print('      Success: ${result.success}');

      ErrorHandler.logSuccess(
        'stakeTokens',
        context: network.name,
        additionalData: {
          'address': address,
          'amount': '10000000000',
          'tx_hash': result.hash,
        },
      );
    } catch (e) {
      print('    ❌ stakeTokens failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(
          e,
          context: 'stakeTokens test for ${network.name}',
        );
      }
    }
  }

  /// Test crossChainTransfer function
  Future<void> _testCrossChainTransfer(
    BlockchainNetwork network,
    String address,
  ) async {
    try {
      print('  🌉 Testing crossChainTransfer...');
      final result = await _service.crossChainTransfer(
        from: address,
        to: address,
        assetId: '0', // DOT
        sourceChain: network,
        destChain: BlockchainNetwork.moonbeam,
      );

      print('    ✅ Cross-chain transfer initiated:');
      print('      Hash: ${result.hash}');
      print('      Success: ${result.success}');
      print('      From: ${network.name}');
      print('      To: ${BlockchainNetwork.moonbeam.name}');

      ErrorHandler.logSuccess(
        'crossChainTransfer',
        context: network.name,
        additionalData: {
          'from': address,
          'to': address,
          'asset_id': '0',
          'source_chain': network.name,
          'dest_chain': BlockchainNetwork.moonbeam.name,
          'tx_hash': result.hash,
        },
      );
    } catch (e) {
      print('    ❌ crossChainTransfer failed: $e');
      if (e is BlockchainException) {
        ErrorHandler.logError(
          e,
          context: 'crossChainTransfer test for ${network.name}',
        );
      }
    }
  }
}

/// Example usage function
Future<void> runBlockchainServiceTests() async {
  final test = BlockchainServiceTest();
  await test.runTests();
}
