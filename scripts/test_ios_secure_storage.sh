#!/bin/bash

# Script to test iOS secure storage on device/simulator
# This will help diagnose the Keychain entitlement issue

echo "🔍 Testing iOS Secure Storage..."
echo ""

# Check if entitlements file exists
if [ -f "ios/Runner/Runner.entitlements" ]; then
    echo "✅ Entitlements file exists: ios/Runner/Runner.entitlements"
    echo "   Contents:"
    cat ios/Runner/Runner.entitlements
    echo ""
else
    echo "❌ Entitlements file NOT found: ios/Runner/Runner.entitlements"
    echo "   This is required for Keychain access!"
    exit 1
fi

# Check if entitlements is referenced in Xcode project
if grep -q "CODE_SIGN_ENTITLEMENTS.*Runner.entitlements" ios/Runner.xcodeproj/project.pbxproj; then
    echo "✅ Entitlements file is referenced in Xcode project"
else
    echo "❌ Entitlements file NOT referenced in Xcode project"
    echo "   Need to add CODE_SIGN_ENTITLEMENTS = Runner/Runner.entitlements;"
    exit 1
fi

# Check if entitlements file is in file references
if grep -q "Runner.entitlements" ios/Runner.xcodeproj/project.pbxproj; then
    echo "✅ Entitlements file is in Xcode file references"
else
    echo "⚠️  Entitlements file may not be in Xcode file references"
    echo "   Open Xcode and verify the file is included in the project"
fi

echo ""
echo "📱 Running integration test on iOS..."
echo "   This will test secure storage on an actual iOS device/simulator"
echo ""

# Run the integration test
flutter test integration_test/ios_secure_storage_integration_test.dart --device-id=ios

echo ""
echo "✅ Test complete!"
echo ""
echo "If tests failed with error -34018:"
echo "  1. Open ios/Runner.xcworkspace in Xcode"
echo "  2. Select Runner target"
echo "  3. Go to 'Signing & Capabilities' tab"
echo "  4. Click '+' to add capability"
echo "  5. Add 'Keychain Sharing' capability"
echo "  6. Clean build folder (Shift+Cmd+K)"
echo "  7. Build and run again"

