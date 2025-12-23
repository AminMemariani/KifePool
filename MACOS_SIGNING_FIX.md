# macOS Code Signing Fix

## Problem
macOS apps with entitlements require code signing. The error was:
```
"Runner" has entitlements that require signing with a development certificate.
Enable development signing in the Signing & Capabilities editor.
```

## Solution Applied

Added `CODE_SIGN_IDENTITY = "-"` to Debug and Profile configurations to enable ad-hoc signing for local development.

## Manual Setup in Xcode (Recommended)

For proper development signing:

1. **Open Xcode:**
   ```bash
   open macos/Runner.xcworkspace
   ```

2. **Select Runner Target:**
   - Click on "Runner" in the project navigator
   - Select the "Runner" target (not the project)

3. **Configure Signing:**
   - Go to **Signing & Capabilities** tab
   - Check **"Automatically manage signing"**
   - Select your **Team** (or "Sign to Run Locally" for local development)
   - If you don't have a team, you can use "Sign to Run Locally" which doesn't require an Apple Developer account

4. **Verify Keychain Sharing:**
   - Ensure "Keychain Sharing" capability is visible
   - It should show your bundle identifier: `com.kifepool.app.kifepool`

5. **Clean and Build:**
   - Product → Clean Build Folder (Shift+Cmd+K)
   - Product → Build (Cmd+B)

## Alternative: Use Flutter CLI

After configuring in Xcode, you can use:
```bash
flutter clean
flutter pub get
flutter run -d macos
```

## Note

Ad-hoc signing (`CODE_SIGN_IDENTITY = "-"`) works for local development but may not work with all entitlements. For production builds, you'll need proper code signing with a development certificate.

