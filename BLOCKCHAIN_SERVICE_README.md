# BlockchainService Documentation

## Overview

The `BlockchainService` is a comprehensive Dart service layer for interacting with Polkadot and parachains via RPC nodes. It provides a unified interface for common blockchain operations including balance queries, transaction history, NFT management, staking, and cross-chain transfers.

## Features

- ✅ **Multi-chain Support**: Works with Polkadot, Kusama, Moonbeam, Moonriver, Astar, and Acala
- ✅ **WebSocket RPC Integration**: Real-time communication with blockchain nodes
- ✅ **Comprehensive Error Handling**: Graceful error handling with retry mechanisms
- ✅ **Loading States**: Built-in loading indicators and shimmer effects
- ✅ **Structured Data Models**: Type-safe Dart models for all blockchain data
- ✅ **Cross-chain Transfers**: XCM support for parachain interoperability
- ✅ **Staking Operations**: Token staking and unstaking functionality
- ✅ **NFT Support**: NFT querying for supported chains

## Supported Networks

| Network | RPC URL | Status |
|---------|---------|--------|
| Polkadot | `wss://rpc.polkadot.io` | ✅ Supported |
| Kusama | `wss://kusama-rpc.polkadot.io` | ✅ Supported |
| Moonbeam | `wss://wss.api.moonbeam.network` | ✅ Supported |
| Moonriver | `wss://wss.moonriver.moonbeam.network` | ✅ Supported |
| Astar | `wss://rpc.astar.network` | ✅ Supported |
| Acala | `wss://acala-rpc-0.aca-api.network` | ✅ Supported |

## Core Functions

### 1. Get Balance
```dart
final balance = await blockchainService.getBalance(
  '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  BlockchainNetwork.polkadot,
);
```

### 2. Get Transaction History
```dart
final transactions = await blockchainService.getTransactionHistory(
  '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  BlockchainNetwork.polkadot,
);
```

### 3. Get NFTs
```dart
final nfts = await blockchainService.getNFTs(
  '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  BlockchainNetwork.moonbeam,
);
```

### 4. Send Transaction
```dart
final result = await blockchainService.sendTransaction(
  from: '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  to: '1zugca...',
  amount: '1000000000', // 0.001 DOT in smallest unit
  chain: BlockchainNetwork.polkadot,
);
```

### 5. Stake Tokens
```dart
final result = await blockchainService.stakeTokens(
  address: '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  amount: '10000000000', // 0.01 DOT
  chain: BlockchainNetwork.polkadot,
);
```

### 6. Cross-chain Transfer
```dart
final result = await blockchainService.crossChainTransfer(
  from: '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  to: '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5',
  assetId: '0', // DOT
  sourceChain: BlockchainNetwork.polkadot,
  destChain: BlockchainNetwork.moonbeam,
);
```

## Error Handling

The service includes comprehensive error handling with the following error types:

- `networkError`: Connection issues
- `rpcError`: Server-side errors
- `insufficientBalance`: Not enough funds
- `invalidAddress`: Malformed addresses
- `transactionFailed`: Transaction execution errors
- `stakingError`: Staking operation failures
- `crossChainError`: XCM transfer issues
- `unknown`: Unexpected errors

### Error Handling Example
```dart
try {
  final balance = await blockchainService.getBalance(address, chain);
  // Handle success
} catch (e) {
  if (e is BlockchainException) {
    final userMessage = ErrorHandler.handleBlockchainError(e);
    // Show user-friendly error message
    _showErrorToast(userMessage);
    
    // Log error for debugging
    ErrorHandler.logError(e, context: 'getBalance');
  }
}
```

## UI Components

### Loading States
```dart
// Shimmer loading for balance card
const BalanceShimmer()

// Shimmer loading for transaction list
const TransactionShimmer()

// Shimmer loading for NFT grid
const NFTShimmer()

// Loading overlay
LoadingOverlay(
  isLoading: true,
  message: 'Loading wallet data...',
  child: YourWidget(),
)
```

### Error Display
```dart
ErrorDisplay(
  error: blockchainException,
  onRetry: () => _retryOperation(),
  context: 'Wallet Screen',
)
```

### Toast Notifications
```dart
// Error toast with retry button
ErrorToast(
  message: 'Network connection failed',
  onRetry: () => _retryOperation(),
)

// Success toast
SuccessToast(
  message: 'Transaction sent successfully!',
)
```

## Testing

Run the test suite to verify functionality across multiple parachains:

```dart
import 'package:kifepool/core/services/blockchain_service_test.dart';

// Run comprehensive tests
await runBlockchainServiceTests();
```

The test suite will:
- Test all core functions against multiple networks
- Verify error handling and logging
- Demonstrate proper usage patterns
- Validate data model serialization

## Demo Screen

A complete demo screen is available at:
`lib/features/wallet/presentation/wallet_demo_screen.dart`

This screen demonstrates:
- Network selection
- Address input and validation
- Real-time data loading with shimmer effects
- Error handling with retry mechanisms
- Success/error toast notifications
- Complete wallet data display

## Dependencies

The following dependencies are required:

```yaml
dependencies:
  web_socket_channel: ^2.4.0
  json_annotation: ^4.8.1
  dio: ^5.4.3+1
  http: ^1.1.0

dev_dependencies:
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
```

## Architecture

The service follows a clean architecture pattern:

```
lib/
├── core/
│   ├── models/
│   │   └── blockchain_models.dart      # Data models
│   └── services/
│       ├── blockchain_service.dart     # Main service
│       ├── error_handler.dart          # Error handling
│       └── blockchain_service_test.dart # Test suite
└── shared/
    └── widgets/
        ├── loading_widgets.dart        # Loading components
        └── error_widgets.dart          # Error components
```

## Best Practices

1. **Always handle errors gracefully** - Use try-catch blocks and show user-friendly messages
2. **Implement loading states** - Use shimmer effects during data loading
3. **Log errors for debugging** - Use ErrorHandler.logError() for proper logging
4. **Validate addresses** - Ensure addresses are properly formatted before API calls
5. **Use proper amounts** - Convert to smallest units (e.g., DOT has 10 decimals)
6. **Dispose connections** - Call dispose() when done to close WebSocket connections

## Future Enhancements

- [ ] Support for more parachains
- [ ] Enhanced NFT metadata parsing
- [ ] Real-time transaction monitoring
- [ ] Batch operations for multiple addresses
- [ ] Caching layer for improved performance
- [ ] Offline mode support
- [ ] Advanced staking features (validator selection, etc.)

## Support

For issues or questions regarding the BlockchainService, please refer to the test files and demo screen for usage examples.
