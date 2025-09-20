#!/bin/bash

# KifePool Integration Test Runner
# This script runs all integration tests with proper setup and reporting

set -e

echo "🚀 Starting KifePool Integration Tests"
echo "======================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

# Check Flutter version
FLUTTER_VERSION=$(flutter --version | head -n 1)
print_status "Using $FLUTTER_VERSION"

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    print_error "pubspec.yaml not found. Please run this script from the project root."
    exit 1
fi

# Parse command line arguments
VERBOSE=false
COVERAGE=false
PLATFORM=""
SPECIFIC_TEST=""
TIMEOUT="60s"

while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -c|--coverage)
            COVERAGE=true
            shift
            ;;
        -p|--platform)
            PLATFORM="$2"
            shift 2
            ;;
        -t|--test)
            SPECIFIC_TEST="$2"
            shift 2
            ;;
        --timeout)
            TIMEOUT="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  -v, --verbose     Run tests with verbose output"
            echo "  -c, --coverage    Generate coverage report"
            echo "  -p, --platform    Run tests on specific platform (android, ios, web)"
            echo "  -t, --test        Run specific test file"
            echo "  --timeout         Set test timeout (default: 60s)"
            echo "  -h, --help        Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                                    # Run all tests"
            echo "  $0 -v                                 # Run with verbose output"
            echo "  $0 -c                                 # Run with coverage"
            echo "  $0 -p android                         # Run on Android"
            echo "  $0 -t blockchain_service_integration_test.dart  # Run specific test"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Setup
print_status "Setting up test environment..."

# Clean previous builds
print_status "Cleaning previous builds..."
flutter clean

# Get dependencies
print_status "Getting dependencies..."
flutter pub get

# Generate code
print_status "Generating code..."
dart run build_runner build --delete-conflicting-outputs

# Check if integration_test directory exists
if [ ! -d "integration_test" ]; then
    print_error "integration_test directory not found"
    exit 1
fi

# Build test command
TEST_CMD="flutter test integration_test/"

if [ "$VERBOSE" = true ]; then
    TEST_CMD="$TEST_CMD --verbose"
fi

if [ "$COVERAGE" = true ]; then
    TEST_CMD="$TEST_CMD --coverage"
fi

if [ -n "$PLATFORM" ]; then
    TEST_CMD="$TEST_CMD --platform $PLATFORM"
fi

if [ -n "$SPECIFIC_TEST" ]; then
    TEST_CMD="$TEST_CMD $SPECIFIC_TEST"
fi

TEST_CMD="$TEST_CMD --timeout $TIMEOUT"

# Run tests
print_status "Running integration tests..."
print_status "Command: $TEST_CMD"
echo ""

# Execute tests
if eval $TEST_CMD; then
    print_success "All integration tests passed! 🎉"
    
    if [ "$COVERAGE" = true ]; then
        print_status "Generating coverage report..."
        if command -v genhtml &> /dev/null; then
            genhtml coverage/lcov.info -o coverage/html
            print_success "Coverage report generated at coverage/html/index.html"
        else
            print_warning "genhtml not found. Install lcov to generate HTML coverage report."
        fi
    fi
    
    echo ""
    print_success "Integration tests completed successfully!"
    exit 0
else
    print_error "Integration tests failed! ❌"
    echo ""
    print_status "Troubleshooting tips:"
    echo "  - Check network connectivity for blockchain tests"
    echo "  - Verify test environment setup"
    echo "  - Run with --verbose for detailed output"
    echo "  - Check device/emulator status"
    exit 1
fi
