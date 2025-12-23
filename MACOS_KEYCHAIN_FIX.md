# macOS Keychain Error -34018 Fix

## Problem
The macOS app was getting error -34018 when trying to use `flutter_secure_storage`:
```
PlatformException(Unexpected security result code, Code: -34018, Message: A required entitlement isn't present.)
```

## Solution Applied

### 1. Added Keychain Access Groups to Entitlements ✅

**Files Updated:**
- `macos/Runner/DebugProfile.entitlements`
- `macos/Runner/Release.entitlements`

**Added:**
```xml
<key>keychain-access-groups</key>
<array>
    <string>$(AppIdentifierPrefix)$(CFBundleIdentifier)</string>
</array>
```

### 2. Added Keychain Sharing Capability ✅

**File Updated:** `macos/Runner.xcodeproj/project.pbxproj`

**Added to SystemCapabilities:**
```pbxproj
com.apple.KeychainSharing = {
    enabled = 1;
};
```

## Verification

### Check Entitlements Files:
```bash
cat macos/Runner/DebugProfile.entitlements
cat macos/Runner/Release.entitlements
```

Both should contain `keychain-access-groups` with your bundle identifier.

### Check Xcode Project:
```bash
grep -A 3 "com.apple.KeychainSharing" macos/Runner.xcodeproj/project.pbxproj
```

Should show:
```
com.apple.KeychainSharing = {
    enabled = 1;
};
```

## Next Steps

1. **Rebuild the app:**
   ```bash
   flutter clean
   flutter pub get
   flutter run -d macos
   ```

2. **Test wallet creation:**
   - Create a new wallet
   - Select 12 or 24 words
   - Generate mnemonic
   - Click "I've Saved It"
   - Should work without -34018 error

3. **If still getting error:**
   - Open `macos/Runner.xcworkspace` in Xcode
   - Select Runner target → Signing & Capabilities
   - Verify "Keychain Sharing" capability is visible
   - Ensure the app is properly signed
   - Clean build folder (Shift+Cmd+K)
   - Build and run from Xcode

## Configuration Summary

✅ **macOS Entitlements**: Keychain access groups added
✅ **macOS Xcode Project**: Keychain Sharing capability enabled
✅ **iOS Entitlements**: Already configured (from previous fix)
✅ **iOS Xcode Project**: Keychain Sharing capability already enabled

The -34018 error should now be resolved on macOS!

