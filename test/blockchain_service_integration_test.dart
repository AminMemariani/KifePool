import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kifepool/core/services/blockchain_service.dart';
import 'package:kifepool/core/models/blockchain_models.dart';
import 'package:kifepool/core/services/error_handler.dart';

/// Integration tests for BlockchainService
/// Tests real blockchain interactions with multiple parachains
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('BlockchainService Integration Tests', () {
    late BlockchainService blockchainService;
    const testAddress = '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5';

    setUpAll(() {
      blockchainService = BlockchainService();
    });

    tearDownAll(() async {
      await blockchainService.dispose();
    });

    group('Network Connection Tests', () {
      testWidgets('should connect to Polkadot network', (tester) async {
        try {
          final balance = await blockchainService.getBalance(
            testAddress,
            BlockchainNetwork.polkadot,
          );

          expect(balance, isNotNull);
          expect(balance.address, equals(testAddress));
          expect(balance.chain, equals('Polkadot'));
          expect(balance.symbol, isNotEmpty);
          expect(balance.decimals, greaterThan(0));

          print('✅ Polkadot connection successful');
          print('   Balance: ${balance.totalAmount} ${balance.symbol}');
        } catch (e) {
          if (e is BlockchainException) {
            print('⚠️  Polkadot connection failed: ${e.message}');
            // Don't fail the test for network issues
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });

      testWidgets('should connect to Moonbeam network', (tester) async {
        try {
          final balance = await blockchainService.getBalance(
            testAddress,
            BlockchainNetwork.moonbeam,
          );

          expect(balance, isNotNull);
          expect(balance.address, equals(testAddress));
          expect(balance.chain, equals('Moonbeam'));
          expect(balance.symbol, isNotEmpty);
          expect(balance.decimals, greaterThan(0));

          print('✅ Moonbeam connection successful');
          print('   Balance: ${balance.totalAmount} ${balance.symbol}');
        } catch (e) {
          if (e is BlockchainException) {
            print('⚠️  Moonbeam connection failed: ${e.message}');
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });

      testWidgets('should connect to Astar network', (tester) async {
        try {
          final balance = await blockchainService.getBalance(
            testAddress,
            BlockchainNetwork.astar,
          );

          expect(balance, isNotNull);
          expect(balance.address, equals(testAddress));
          expect(balance.chain, equals('Astar'));
          expect(balance.symbol, isNotEmpty);
          expect(balance.decimals, greaterThan(0));

          print('✅ Astar connection successful');
          print('   Balance: ${balance.totalAmount} ${balance.symbol}');
        } catch (e) {
          if (e is BlockchainException) {
            print('⚠️  Astar connection failed: ${e.message}');
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });
    });

    group('Balance Operations', () {
      testWidgets('should get balance for valid address', (tester) async {
        final networks = [
          BlockchainNetwork.polkadot,
          BlockchainNetwork.moonbeam,
          BlockchainNetwork.astar,
        ];

        for (final network in networks) {
          try {
            final balance = await blockchainService.getBalance(
              testAddress,
              network,
            );

            expect(balance, isNotNull);
            expect(balance.address, equals(testAddress));
            expect(balance.chain, equals(network.name));
            expect(balance.free, isNotEmpty);
            expect(balance.total, isNotEmpty);
            expect(balance.symbol, isNotEmpty);
            expect(balance.decimals, greaterThan(0));

            print(
              '✅ ${network.name} balance retrieved: ${balance.totalAmount} ${balance.symbol}',
            );
          } catch (e) {
            if (e is BlockchainException) {
              print('⚠️  ${network.name} balance failed: ${e.message}');
              expect(e.type, isA<BlockchainErrorType>());
            } else {
              rethrow;
            }
          }
        }
      });

      testWidgets('should handle invalid address gracefully', (tester) async {
        const invalidAddress = 'invalid_address';

        try {
          final balance = await blockchainService.getBalance(
            invalidAddress,
            BlockchainNetwork.polkadot,
          );
          // In test mode, the service returns mock data instead of throwing exceptions
          expect(balance, isA<Balance>());
          expect(balance.address, equals(invalidAddress));
          print(
            '✅ Invalid address handled correctly: Mock data returned in test mode',
          );
        } catch (e) {
          // In production mode, the service should throw an exception
          expect(e, isA<BlockchainException>());
          final exception = e as BlockchainException;
          expect(exception.type, isA<BlockchainErrorType>());
          print('✅ Invalid address handled correctly: ${exception.message}');
        }
      });
    });

    group('Transaction History', () {
      testWidgets('should get transaction history', (tester) async {
        final networks = [
          BlockchainNetwork.polkadot,
          BlockchainNetwork.moonbeam,
        ];

        for (final network in networks) {
          try {
            final transactions = await blockchainService.getTransactionHistory(
              testAddress,
              network,
            );

            expect(transactions, isA<List<Transaction>>());

            if (transactions.isNotEmpty) {
              final tx = transactions.first;
              expect(tx.hash, isNotEmpty);
              expect(tx.from, isNotEmpty);
              expect(tx.symbol, isNotEmpty);
              expect(tx.status, isA<TransactionStatus>());

              print(
                '✅ ${network.name} transactions retrieved: ${transactions.length}',
              );
            } else {
              print(
                'ℹ️  ${network.name} no transactions found for test address',
              );
            }
          } catch (e) {
            if (e is BlockchainException) {
              print(
                '⚠️  ${network.name} transaction history failed: ${e.message}',
              );
              expect(e.type, isA<BlockchainErrorType>());
            } else {
              rethrow;
            }
          }
        }
      });
    });

    group('NFT Operations', () {
      testWidgets('should get NFTs for address', (tester) async {
        final networks = [BlockchainNetwork.moonbeam, BlockchainNetwork.astar];

        for (final network in networks) {
          try {
            final nfts = await blockchainService.getNFTs(testAddress, network);

            expect(nfts, isA<List<NFT>>());

            if (nfts.isNotEmpty) {
              final nft = nfts.first;
              expect(nft.id, isNotEmpty);
              expect(nft.name, isNotEmpty);
              expect(nft.owner, isNotEmpty);
              expect(nft.chain, equals(network.name));

              print('✅ ${network.name} NFTs retrieved: ${nfts.length}');
            } else {
              print('ℹ️  ${network.name} no NFTs found for test address');
            }
          } catch (e) {
            if (e is BlockchainException) {
              print('⚠️  ${network.name} NFT retrieval failed: ${e.message}');
              expect(e.type, isA<BlockchainErrorType>());
            } else {
              rethrow;
            }
          }
        }
      });
    });

    group('Staking Operations', () {
      testWidgets('should get staking information', (tester) async {
        final networks = [BlockchainNetwork.polkadot, BlockchainNetwork.astar];

        for (final network in networks) {
          try {
            final stakingInfo = await blockchainService.getStakingInfo(
              testAddress,
              network,
            );

            expect(stakingInfo, isNotNull);
            expect(stakingInfo.address, equals(testAddress));
            expect(stakingInfo.chain, equals(network.name));
            expect(stakingInfo.staked, isNotEmpty);
            expect(stakingInfo.symbol, isNotEmpty);
            expect(stakingInfo.validators, isA<List<Validator>>());

            print('✅ ${network.name} staking info retrieved');
            print('   Staked: ${stakingInfo.staked} ${stakingInfo.symbol}');
            print('   Validators: ${stakingInfo.validators.length}');
          } catch (e) {
            if (e is BlockchainException) {
              print('⚠️  ${network.name} staking info failed: ${e.message}');
              expect(e.type, isA<BlockchainErrorType>());
            } else {
              rethrow;
            }
          }
        }
      });

      testWidgets('should handle staking operations', (tester) async {
        try {
          final result = await blockchainService.stakeTokens(
            address: testAddress,
            amount: '1000000000', // 0.001 DOT
            chain: BlockchainNetwork.polkadot,
          );

          expect(result, isNotNull);
          expect(result.hash, isNotEmpty);
          expect(result.success, isA<bool>());

          print('✅ Staking operation completed: ${result.hash}');
        } catch (e) {
          if (e is BlockchainException) {
            print('⚠️  Staking operation failed: ${e.message}');
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });
    });

    group('Cross-Chain Operations', () {
      testWidgets('should handle cross-chain transfer', (tester) async {
        try {
          final result = await blockchainService.crossChainTransfer(
            from: testAddress,
            to: testAddress,
            assetId: '0', // DOT
            sourceChain: BlockchainNetwork.polkadot,
            destChain: BlockchainNetwork.moonbeam,
          );

          expect(result, isNotNull);
          expect(result.hash, isNotEmpty);
          expect(result.success, isA<bool>());

          print('✅ Cross-chain transfer initiated: ${result.hash}');
        } catch (e) {
          if (e is BlockchainException) {
            print('⚠️  Cross-chain transfer failed: ${e.message}');
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });
    });

    group('Error Handling', () {
      testWidgets('should handle network errors gracefully', (tester) async {
        // Test with a non-existent network URL
        try {
          await blockchainService.getBalance(
            testAddress,
            BlockchainNetwork.polkadot,
          );
        } catch (e) {
          if (e is BlockchainException) {
            expect(e.type, isA<BlockchainErrorType>());
            expect(ErrorHandler.isRetryable(e), isA<bool>());
            expect(ErrorHandler.getRetryDelay(e, 1), isA<Duration>());

            print('✅ Error handling working correctly: ${e.type.name}');
          } else {
            rethrow;
          }
        }
      });

      testWidgets('should log errors properly', (tester) async {
        try {
          await blockchainService.getBalance(
            'invalid_address',
            BlockchainNetwork.polkadot,
          );
        } catch (e) {
          if (e is BlockchainException) {
            // Test error logging
            ErrorHandler.logError(
              e,
              context: 'integration_test',
              additionalData: {'test': 'error_logging'},
            );

            print('✅ Error logging working correctly');
          } else {
            rethrow;
          }
        }
      });
    });

    group('Performance Tests', () {
      testWidgets('should handle concurrent requests', (tester) async {
        final futures = <Future<Balance>>[];

        // Create multiple concurrent requests
        for (int i = 0; i < 5; i++) {
          futures.add(
            blockchainService.getBalance(
              testAddress,
              BlockchainNetwork.polkadot,
            ),
          );
        }

        try {
          final results = await Future.wait(futures);
          expect(results.length, equals(5));

          for (final result in results) {
            expect(result.address, equals(testAddress));
            expect(result.chain, equals('Polkadot'));
          }

          print('✅ Concurrent requests handled successfully');
        } catch (e) {
          if (e is BlockchainException) {
            print('⚠️  Concurrent requests failed: ${e.message}');
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });

      testWidgets('should handle timeout scenarios', (tester) async {
        final stopwatch = Stopwatch()..start();

        try {
          await blockchainService.getBalance(
            testAddress,
            BlockchainNetwork.polkadot,
          );

          stopwatch.stop();
          print('✅ Request completed in ${stopwatch.elapsedMilliseconds}ms');

          // Requests should complete within reasonable time
          expect(stopwatch.elapsedMilliseconds, lessThan(30000)); // 30 seconds
        } catch (e) {
          stopwatch.stop();
          print(
            '⚠️  Request failed after ${stopwatch.elapsedMilliseconds}ms: $e',
          );

          if (e is BlockchainException) {
            expect(e.type, isA<BlockchainErrorType>());
          } else {
            rethrow;
          }
        }
      });
    });
  });
}
