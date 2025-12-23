# iOS Simulator Build Error Fix

## Error
```
Unable to find a destination matching the provided destination specifier
iOS 26.2 is not installed. Please download and install the platform from Xcode > Settings > Components.
```

## Problem
Xcode is trying to build for iOS 26.2 SDK, but the simulator is running iOS 18.5. There's a mismatch between the SDK version and the simulator runtime.

## Solutions

### Option 1: Use Xcode GUI (Recommended)
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select **Runner** target
3. Go to **Build Settings**
4. Search for "iOS Deployment Target"
5. Set it to **18.5** or lower (currently set to 13.0)
6. Search for "Base SDK"
7. Set it to **Latest iOS (iOS 18.5)** or match your simulator version
8. Product → Clean Build Folder (Shift+Cmd+K)
9. Product → Build (Cmd+B)

### Option 2: Install iOS 26.2 Simulator Runtime
1. Open Xcode
2. Go to **Xcode → Settings → Platforms** (or Components)
3. Download and install **iOS 26.2 Simulator Runtime**
4. Wait for download to complete
5. Restart Xcode
6. Try building again

### Option 3: Use a Different Simulator
Use a simulator that matches your installed SDK:
```bash
# List available simulators
xcrun simctl list devices available

# Boot a simulator with iOS 26.0 (you have this installed)
xcrun simctl boot A5B7A68B-85BE-4757-9BAD-03DAC7F0DC78  # iPhone 17 Pro (iOS 26.0)

# Then run Flutter
flutter run
```

### Option 4: Specify SDK Explicitly
Try building with explicit SDK specification:
```bash
flutter run --release --device-id=<simulator-id>
```

Or use xcodebuild directly:
```bash
cd ios
xcodebuild -workspace Runner.xcworkspace \
  -scheme Runner \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
  build
```

### Option 5: Check Flutter Configuration
Make sure Flutter is using the correct Xcode:
```bash
flutter doctor -v
```

If Xcode path is wrong:
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

## Current Status
- **Available Simulators**: iOS 18.5 and iOS 26.0
- **Xcode SDK**: iOS 26.2
- **Issue**: Mismatch between SDK and simulator runtime

## Recommended Fix
1. Open Xcode → Settings → Platforms
2. Download iOS 26.2 Simulator Runtime (if needed)
3. OR use an iOS 26.0 simulator that's already available
4. Clean and rebuild

