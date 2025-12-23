# iOS Keychain Entitlement Fix Guide

## Error: -34018 "A required entitlement isn't present"

This error occurs when the iOS app tries to access the Keychain but doesn't have the proper entitlements configured.

## ✅ What We've Fixed

1. ✅ Created `ios/Runner/Runner.entitlements` with keychain-access-groups
2. ✅ Added entitlements file reference to Xcode project
3. ✅ Updated all build configurations (Debug, Release, Profile) to use entitlements
4. ✅ Updated secure storage to use proper iOS options

## 🔍 Verification Steps

### 1. Verify Entitlements File Exists
```bash
cat ios/Runner/Runner.entitlements
```

Should show:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>keychain-access-groups</key>
	<array>
		<string>$(AppIdentifierPrefix)$(CFBundleIdentifier)</string>
	</array>
</dict>
</plist>
```

### 2. Verify Xcode Project Configuration

Open `ios/Runner.xcworkspace` in Xcode:

1. Select **Runner** target
2. Go to **Signing & Capabilities** tab
3. Check that **Keychain Sharing** capability is listed
   - If not present, click **+ Capability** and add **Keychain Sharing**
4. Verify **Code Signing Entitlements** shows: `Runner/Runner.entitlements`
   - Go to **Build Settings** → Search for "Code Signing Entitlements"
   - Should show: `Runner/Runner.entitlements`

### 3. Clean and Rebuild

```bash
# Clean everything
flutter clean
rm -rf ios/Pods ios/Podfile.lock
cd ios && pod install && cd ..

# Rebuild
flutter pub get
flutter run
```

### 4. Test on Device/Simulator

Run the integration test:
```bash
flutter test integration_test/ios_secure_storage_integration_test.dart
```

Or use the diagnostic script:
```bash
./scripts/test_ios_secure_storage.sh
```

## 🛠️ Manual Xcode Fix (If Still Not Working)

If the error persists after the above steps:

1. **Open Xcode:**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Select Runner Target:**
   - Click on "Runner" in the project navigator
   - Select the "Runner" target (not the project)

3. **Add Keychain Sharing Capability:**
   - Go to **Signing & Capabilities** tab
   - Click **+ Capability** button
   - Search for and add **Keychain Sharing**
   - This will automatically update the entitlements file

4. **Verify Signing:**
   - Ensure **Automatically manage signing** is checked
   - Select your **Team** (development team)
   - Verify **Bundle Identifier** is: `com.kifepool.app.kifepool`

5. **Clean Build:**
   - Product → Clean Build Folder (Shift+Cmd+K)
   - Product → Build (Cmd+B)

6. **Run from Xcode:**
   - Select a simulator or device
   - Click Run (Cmd+R)

## 🔧 Alternative: Use Different Accessibility Option

If Keychain Sharing capability causes issues, we can use a simpler accessibility option that doesn't require special entitlements. Edit `lib/core/services/secure_storage_service.dart`:

```dart
iOptions: IOSOptions(
  accessibility: KeychainAccessibility.when_unlocked, // Simpler option
  synchronizable: false,
),
```

However, `first_unlock_this_device` is more secure, so try to get Keychain Sharing working first.

## 📝 Testing

After fixing, test wallet creation:
1. Open the app
2. Go to Create Wallet
3. Enter wallet name
4. Select 12 or 24 words
5. Generate mnemonic
6. Click "I've Saved It"

If successful, you should see "Wallet created successfully!" message.

## 🐛 Still Having Issues?

If error -34018 persists:

1. **Check Xcode Console:**
   - Look for more detailed error messages
   - Check if there are signing errors

2. **Verify App Signing:**
   ```bash
   codesign -d --entitlements - /path/to/your/app.app
   ```

3. **Check Provisioning Profile:**
   - Ensure your provisioning profile includes Keychain Sharing entitlement
   - May need to regenerate provisioning profile in Apple Developer Portal

4. **Try Simulator vs Device:**
   - Test on both iOS Simulator and physical device
   - Some Keychain features behave differently

5. **Check iOS Version:**
   - Ensure testing on iOS 12.0+ (as specified in deployment target)

## 📚 References

- [Apple Keychain Services](https://developer.apple.com/documentation/security/keychain_services)
- [Flutter Secure Storage iOS Setup](https://pub.dev/packages/flutter_secure_storage)
- [iOS Entitlements](https://developer.apple.com/documentation/bundleresources/entitlements)

