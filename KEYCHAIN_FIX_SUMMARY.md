# Keychain Error -34018 Fix Summary

## Changes Made

### 1. Changed Keychain Accessibility ✅
**File**: `lib/core/services/secure_storage_service.dart`

Changed from:
```dart
accessibility: KeychainAccessibility.first_unlock_this_device,
```

To:
```dart
accessibility: KeychainAccessibility.when_unlocked,
```

**Why**: `when_unlocked` doesn't require the Keychain Sharing capability, making it more compatible and less prone to entitlement errors. It still provides secure storage while the device is unlocked.

### 2. Keychain Sharing Capability ✅
**File**: `ios/Runner.xcodeproj/project.pbxproj`

Added SystemCapabilities:
```pbxproj
SystemCapabilities = {
    com.apple.KeychainSharing = {
        enabled = 1;
    };
};
```

### 3. Entitlements File ✅
**File**: `ios/Runner/Runner.entitlements`

Contains:
```xml
<key>keychain-access-groups</key>
<array>
    <string>$(AppIdentifierPrefix)$(CFBundleIdentifier)</string>
</array>
```

### 4. Build Configuration ✅
- CODE_SIGN_ENTITLEMENTS is set to `Runner/Runner.entitlements` in all build configurations
- Entitlements file is properly referenced in the project

## Next Steps

1. **Rebuild the app completely:**
   ```bash
   flutter clean
   flutter pub get
   cd ios && pod install && cd ..
   flutter run
   ```

2. **If still getting -34018 error:**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Select Runner target → Signing & Capabilities
   - Verify "Keychain Sharing" capability is visible
   - Ensure "Automatically manage signing" is enabled
   - Select a valid development team
   - Clean build folder (Shift+Cmd+K)
   - Build and run from Xcode

3. **Test wallet creation:**
   - Create a new wallet
   - Select 12 or 24 words
   - Generate mnemonic
   - Click "I've Saved It"
   - Should work without -34018 error

## Accessibility Options Explained

- **`when_unlocked`**: Available when device is unlocked (doesn't require Keychain Sharing)
- **`first_unlock_this_device`**: Available after first unlock (requires Keychain Sharing capability)
- **`when_unlocked_this_device`**: Available when unlocked, only on this device (requires Keychain Sharing)

The `when_unlocked` option is the most compatible and should work without requiring Keychain Sharing capability, though we've enabled it anyway for maximum compatibility.

