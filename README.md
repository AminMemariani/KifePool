# KifePool - Polkadot & Kusama Wallet App

[![Tests](https://img.shields.io/badge/Tests-Basic%20Tests%20Passing-brightgreen.svg)](https://github.com/cyberhonig/KifePool)
[![Coverage](https://img.shields.io/badge/Coverage-Unit%20Tests%20Working-blue.svg)](https://github.com/cyberhonig/KifePool)
[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0.0+-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey.svg)](https://flutter.dev/)

A comprehensive Flutter application for managing cryptocurrencies in the Polkadot and Kusama ecosystems, featuring wallet functionality, staking, NFTs, transactions, and cross-chain operations.

## 🚀 Features

- **Wallet Management**: Secure cryptocurrency wallet with multi-asset support
- **Staking**: Earn rewards through cryptocurrency staking
- **NFTs**: Manage and trade non-fungible tokens
- **Transactions**: Send, receive, and track cryptocurrency transactions
- **News**: Stay updated with the latest crypto news
- **Cross-Chain**: Support for Polkadot and Kusama parachains via XCM
- **Dark Mode**: Beautiful dark theme with toggle functionality
- **Offline-First**: Local data persistence with Isar database

## 🌐 Supported Ecosystems

### Polkadot Ecosystem
- **Polkadot**: Main relay chain
- **Parachains**: Statemint, Acala, Moonbeam, Astar, Bifrost, Centrifuge, Parallel, Equilibrium, Composable, HydraDX, Phala, Integritee, Darwinia, Litentry, Crust, OriginTrail, Efinity, Nodle, Bitgreen, Encointer, Pendulum, Amplitude, Interlay, Kylin, Pichiu, Polkadex, Coinversation, InvArch, Oak, Robonomics, Turing, Zeitgeist, SubDAO, Ajuna, Altair, Basilisk, Calamari, Heiko, Kintsugi, Picasso, Quartz, Unique, Genshiro, Karura, Khala, Kilt, Sakura, Shadow, Shiden

### Kusama Ecosystem
- **Kusama**: Canary network relay chain
- **Parachains**: Statemine, Karura, Bifrost, Khala, Shiden, Robonomics, Trustbase, Altair, Heiko, Kintsugi, Pichiu, Calamari, Basilisk, Turing, Litentry, Kilt, Sakura, Quartz, Unique, Genshiro, Subgame, Zeitgeist, Integritee, Nodle, Polkasmith, Dora, Crust, Litmus, Kabocha, Mangata, GM, Tinkernet, Listen, Pioneer, BitCountry, Subsocial, Parallel, Picasso, Composable, Amplitude, Pendulum, InvArch, Kylin, Polkadex, Coinversation, Efinity, Centrifuge, OriginTrail, Equilibrium, HydraDX, Phala, Darwinia

### Dynamic Parachain Detection
The app automatically detects and supports all active parachains in both ecosystems through real-time RPC queries, ensuring users always have access to the latest parachains without app updates.

## 🏗️ Architecture

### Frontend (Flutter)
- **State Management**: Provider pattern for reactive state management
- **Local Database**: Isar for offline-first data persistence
- **Networking**: Dio for HTTP requests and API communication
- **Blockchain Integration**: Direct RPC connections to Polkadot and Kusama networks

## 📁 Project Structure

```
KifePool/
├── lib/
│   ├── core/                    # Core functionality
│   │   ├── constants/          # App constants and configuration
│   │   ├── services/           # Core services (database, network, blockchain)
│   │   ├── theme/              # App theming and styling
│   │   └── utils/              # Utility functions
│   ├── features/               # Feature-based modules
│   │   ├── wallet/             # Wallet functionality
│   │   │   ├── data/           # Data layer (repositories, data sources)
│   │   │   ├── domain/         # Business logic and entities
│   │   │   └── presentation/   # UI layer (screens, widgets, providers)
│   │   ├── staking/            # Staking functionality
│   │   ├── nfts/               # NFT management
│   │   ├── transactions/       # Transaction handling
│   │   ├── news/               # News and updates
│   │   └── cross_chain/        # Cross-chain operations
│   ├── shared/                 # Shared components
│   │   ├── widgets/            # Reusable UI components
│   │   ├── providers/          # Shared state providers
│   │   └── models/             # Shared data models
│   └── main.dart               # App entry point
└── README.md                   # This file
```

## 🛠️ Tech Stack

### Frontend
- **Flutter**: Cross-platform mobile framework
- **Provider**: State management solution
- **Isar**: Local NoSQL database
- **Dio**: HTTP client for networking
- **WebSocket**: Real-time Polkadot/Kusama blockchain communication
- **Google Fonts**: Typography system
- **Material Design 3**: Modern UI components

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.0.0 or higher)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd KifePool
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build
   ```

4. **Run the Flutter app**
   ```bash
   flutter run
   ```

### Development Setup

1. **Generate code**
   ```bash
   dart run build_runner build
   ```

2. **Run in development mode**
   ```bash
   flutter run
   ```

## 🎨 Design System

### Colors
- **Primary**: Indigo (#6366F1)
- **Secondary**: Emerald (#10B981)
- **Accent**: Amber (#F59E0B)
- **Success**: Emerald (#10B981)
- **Warning**: Amber (#F59E0B)
- **Error**: Red (#EF4444)
- **Info**: Blue (#3B82F6)

### Typography
- **Font Family**: Inter (Google Fonts)
- **Display**: 57px, 45px, 36px
- **Headline**: 32px, 28px, 24px
- **Title**: 22px, 16px, 14px
- **Body**: 16px, 14px, 12px
- **Label**: 14px, 12px, 11px

### Spacing
- **Base Unit**: 8px
- **Scale**: 4px, 8px, 12px, 16px, 24px, 32px, 48px, 64px

## 🔧 Configuration

### App Configuration
Update `lib/core/constants/app_constants.dart` with your configuration:
- Polkadot and Kusama RPC URLs
- Database settings
- Feature flags
- Supported parachains

## 📱 Features Overview

### Wallet
- Multi-asset support (DOT, KSM, and parachain tokens)
- Secure key management with mnemonic phrases
- Balance tracking across parachains
- Send/Receive functionality
- Transaction history

### Staking
- Validator staking on Polkadot and Kusama
- Nomination pool staking
- Dynamic parachain support
- APY tracking and reward calculation
- Staking history and unstaking functionality

### NFTs
- NFT collection management
- Minting capabilities
- Trading functionality
- Metadata display
- Collection organization

### Transactions
- Real-time transaction tracking
- Polkadot and Kusama parachain support
- Transaction filtering
- Export functionality
- Status monitoring

### News
- Crypto news aggregation
- Category filtering
- Bookmark functionality
- Offline reading
- Push notifications

## 🔒 Security

- **Encryption**: All sensitive data encrypted at rest
- **Authentication**: JWT-based authentication
- **Authorization**: Role-based access control
- **Key Management**: Secure key storage and generation
- **Network Security**: HTTPS/TLS encryption
- **Input Validation**: Comprehensive input sanitization

## 🧪 Testing

### Current Test Status
- ✅ **Unit Tests**: Basic theme provider tests passing
- ⚠️ **Integration Tests**: Some tests have dependency conflicts (carousel_slider package)
- ⚠️ **Network Tests**: Require RPC node configuration
- 🔧 **Known Issues**: 
  - CarouselController naming conflict with Flutter's built-in controller
  - WebSocket stream management in BlockchainService
  - UI layout constraints in some widgets

### Unit Tests
```bash
# Run all unit tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Integration Tests
```bash
# Run all integration tests
flutter test test/

# Run specific integration test
flutter test test/app_integration_test.dart

# Run with verbose output
flutter test test/ --verbose

# Run with coverage
flutter test test/ --coverage

# Use the test runner script
./scripts/run_integration_tests.sh
```

### Blockchain Service Testing
```bash
# Run blockchain service tests
dart run lib/core/services/blockchain_service_test.dart

# Run blockchain integration tests
flutter test test/blockchain_service_integration_test.dart
```

### Test Coverage
```bash
# Generate coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Test Structure
```
test/
├── app_integration_test.dart                # Complete app experience
├── app_navigation_integration_test.dart     # Navigation and routing
├── blockchain_service_integration_test.dart # Blockchain functionality
├── theme_integration_test.dart              # Theme management
├── wallet_integration_test.dart             # Wallet UI and interactions
└── widget_test.dart                         # Widget unit tests
```

### Test Categories
- **🔗 Network Tests**: Real Polkadot/Kusama blockchain network interactions
- **🎨 UI Tests**: User interface and navigation
- **⚡ Performance Tests**: App performance and responsiveness
- **🔒 Error Handling Tests**: Error scenarios and recovery
- **📱 Platform Tests**: Cross-platform compatibility
- **🏗️ Integration Tests**: Combined unit and integration tests in unified structure

## 📦 Deployment

### Frontend Deployment
- **Android**: Generate APK/AAB for Google Play Store
- **iOS**: Build for App Store Connect
- **Web**: Deploy to web hosting platform

### App Deployment
```bash
# Build for production
flutter build apk --release  # Android
flutter build ios --release  # iOS
flutter build web --release  # Web
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support, email support@kifepool.com or join our Discord community.

## 🗺️ Roadmap

- [ ] Multi-language support
- [ ] Advanced parachain staking features
- [ ] DeFi protocol integration on parachains
- [ ] Hardware wallet support
- [ ] Advanced analytics for Polkadot/Kusama
- [ ] Social features
- [ ] Mobile app optimization
- [ ] Web platform expansion
- [ ] XCM cross-chain transfer improvements
- [ ] Parachain auction participation

---

**Built with ❤️ using Flutter**
