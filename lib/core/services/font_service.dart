import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Handles one-time Google Fonts fetch and local caching.
///
/// On first app launch, we temporarily allow runtime fetching and
/// touch the font variants we use so they are cached to disk.
/// After that, we disable runtime fetching to avoid network and
/// platform channel calls on subsequent launches.
class FontService {
  static const String _fontsCachedKey = 'fonts_cached_v1';
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    // Never fetch at runtime in tests
    if (_isTestEnvironment()) {
      GoogleFonts.config.allowRuntimeFetching = false;
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final alreadyCached = prefs.getBool(_fontsCachedKey) ?? false;

      if (alreadyCached) {
        // Ensure runtime fetching stays off after first run
        GoogleFonts.config.allowRuntimeFetching = false;
        return;
      }

      // Temporarily allow fetching to cache fonts on first run
      GoogleFonts.config.allowRuntimeFetching = true;

      // Touch the font variants we use so the files are written to disk
      // These calls create TextStyles which triggers the underlying cache.
      // No UI needed here.
      // Inter variants used throughout typography
      if (!_isTestEnvironment()) {
        // ignore: unused_local_variable
        final _ = [
          GoogleFonts.inter(),
          GoogleFonts.inter(fontWeight: FontWeight.w500),
          GoogleFonts.inter(fontWeight: FontWeight.w600),
          GoogleFonts.inter(fontWeight: FontWeight.w700),
        ];
      }

      // Persist that fonts are cached
      await prefs.setBool(_fontsCachedKey, true);
    } catch (_) {
      // If caching fails for any reason, keep app functional by disabling fetch
    } finally {
      // Disable runtime fetching for subsequent use
      GoogleFonts.config.allowRuntimeFetching = false;
    }
  }

  static bool _isTestEnvironment() {
    // Check for test environment indicators
    return const bool.fromEnvironment('dart.vm.product') == false &&
        (const bool.fromEnvironment('flutter.inspector.structuredErrors') ==
                true ||
            const bool.fromEnvironment('dart.vm.test') == true ||
            kDebugMode);
  }
}
