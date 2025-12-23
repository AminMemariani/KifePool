# Install iOS 26.2 Simulator Runtime

## Problem
Xcode SDK 26.2 is installed, but the iOS 26.2 Simulator Runtime is missing. This causes build errors when trying to run on simulators.

## Solution: Install iOS 26.2 Simulator Runtime

### Method 1: Via Xcode GUI (Recommended)
1. **Open Xcode**
2. Go to **Xcode → Settings** (or **Preferences**)
3. Click on **Platforms** tab (or **Components** in older versions)
4. Find **iOS 26.2** in the list
5. Click the **Download** button (⬇️) next to it
6. Wait for the download to complete (this may take several minutes and requires several GB)
7. Once downloaded, restart Xcode
8. Try building again: `flutter run`

### Method 2: Via Command Line
```bash
# List available runtimes
xcrun simctl runtime list

# Download iOS 26.2 runtime (if available via command line)
# Note: This usually requires Xcode GUI, but you can try:
xcodebuild -downloadPlatform iOS
```

### Method 3: Use Available Simulator Runtime
If you can't install iOS 26.2 runtime, you can configure Xcode to use iOS 26.0 SDK:

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select **Runner** target
3. Go to **Build Settings**
4. Search for **"Base SDK"**
5. Change from **"Latest iOS (iOS 26.2)"** to **"iOS 26.0"** or **"iOS 18.5"**
6. Product → Clean Build Folder (Shift+Cmd+K)
7. Try building again

## Current Status
- ✅ Xcode SDK 26.2: Installed
- ❌ iOS 26.2 Simulator Runtime: **NOT INSTALLED**
- ✅ iOS 18.5 Simulator Runtime: Installed
- ✅ iOS 26.0.1 Simulator Runtime: Installed

## Quick Test
After installing, verify the runtime is available:
```bash
xcrun simctl runtime list | grep "26.2"
```

You should see:
```
iOS 26.2 (XX.X) - <UUID> (Ready)
```

## Alternative: Use iOS 26.0 Simulator
If you want to proceed without installing iOS 26.2 runtime, use the iOS 26.0 simulator:
```bash
# Boot iOS 26.0 simulator
xcrun simctl boot A5B7A68B-85BE-4757-9BAD-03DAC7F0DC78

# Then configure Xcode Base SDK to iOS 26.0 (see Method 3 above)
```

