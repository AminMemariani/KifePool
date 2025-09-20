# KifePool - Polkadot Wallet App

A comprehensive Flutter application for managing cryptocurrencies, featuring wallet functionality, staking, NFTs, transactions, and cross-chain operations.

## 🚀 Features

- **Wallet Management**: Secure cryptocurrency wallet with multi-asset support
- **Staking**: Earn rewards through cryptocurrency staking
- **NFTs**: Manage and trade non-fungible tokens
- **Transactions**: Send, receive, and track cryptocurrency transactions
- **News**: Stay updated with the latest crypto news
- **Cross-Chain**: Support for multiple blockchain networks
- **Dark Mode**: Beautiful dark theme with toggle functionality
- **Offline-First**: Local data persistence with Isar database

## 🏗️ Architecture

### Frontend (Flutter)
- **State Management**: Provider pattern for reactive state management
- **Local Database**: Isar for offline-first data persistence
- **Networking**: Dio for HTTP requests and API communication
- **Backend Integration**: Serverpod for seamless backend communication

### Backend (Serverpod)
- **API Server**: Dart-based backend with Serverpod framework
- **Database**: PostgreSQL with Redis for caching
- **Authentication**: Secure user authentication and authorization
- **Deployment**: Docker containerization for easy deployment

## 📁 Project Structure

```
KifePool/
├── lib/
│   ├── core/                    # Core functionality
│   │   ├── constants/          # App constants and configuration
│   │   ├── services/           # Core services (database, network)
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
├── kifepool_server/            # Serverpod backend
│   ├── kifepool_server_server/ # Server implementation
│   ├── kifepool_server_client/ # Client SDK
│   └── kifepool_server_flutter/ # Flutter client
└── README.md                   # This file
```

## 🛠️ Tech Stack

### Frontend
- **Flutter**: Cross-platform mobile framework
- **Provider**: State management solution
- **Isar**: Local NoSQL database
- **Dio**: HTTP client for networking
- **Google Fonts**: Typography system
- **Material Design 3**: Modern UI components

### Backend
- **Serverpod**: Dart-based backend framework
- **PostgreSQL**: Primary database
- **Redis**: Caching and session storage
- **Docker**: Containerization
- **Docker Compose**: Multi-container orchestration

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.0.0 or higher)
- Docker and Docker Compose
- Serverpod CLI

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

3. **Set up the backend**
   ```bash
   cd kifepool_server/kifepool_server_server
   docker compose up --build --detach
   dart bin/main.dart --apply-migrations
   ```

4. **Run the Flutter app**
   ```bash
   flutter run
   ```

### Development Setup

1. **Install Serverpod CLI**
   ```bash
   dart pub global activate serverpod_cli
   ```

2. **Generate code**
   ```bash
   serverpod generate
   ```

3. **Run in development mode**
   ```bash
   # Backend
   cd kifepool_server/kifepool_server_server
   dart bin/main.dart --apply-migrations
   
   # Frontend
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

### Environment Variables
Create a `.env` file in the backend directory:
```env
DATABASE_URL=postgresql://username:password@localhost:5432/kifepool
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-jwt-secret
API_KEY=your-api-key
```

### App Configuration
Update `lib/core/constants/app_constants.dart` with your configuration:
- API URLs
- Database settings
- Feature flags
- Supported cryptocurrencies

## 📱 Features Overview

### Wallet
- Multi-asset support (BTC, ETH, BNB, ADA, SOL, etc.)
- Secure key management
- Balance tracking
- Send/Receive functionality
- Transaction history

### Staking
- Multiple staking pools
- APY tracking
- Reward calculation
- Staking history
- Unstaking functionality

### NFTs
- NFT collection management
- Minting capabilities
- Trading functionality
- Metadata display
- Collection organization

### Transactions
- Real-time transaction tracking
- Multi-network support
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

### Frontend Testing
```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Widget tests
flutter test test/widget_test.dart
```

### Backend Testing
```bash
cd kifepool_server/kifepool_server_server
dart test
```

## 📦 Deployment

### Frontend Deployment
- **Android**: Generate APK/AAB for Google Play Store
- **iOS**: Build for App Store Connect
- **Web**: Deploy to web hosting platform

### Backend Deployment
```bash
# Build Docker image
docker build -t kifepool-server .

# Deploy with Docker Compose
docker compose up --build --detach
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
- [ ] Advanced trading features
- [ ] DeFi protocol integration
- [ ] Hardware wallet support
- [ ] Advanced analytics
- [ ] Social features
- [ ] Mobile app optimization
- [ ] Web platform expansion

---

**Built with ❤️ using Flutter and Serverpod**
