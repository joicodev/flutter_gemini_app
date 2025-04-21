import 'package:flutter/foundation.dart'; // Required for kDebugMode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For formatting timestamps (add intl package to pubspec.yaml)

/// ✨ Awesome Provider Observer that logs Riverpod provider events with emojis and timestamps.
/// Provides insights into provider lifecycle (add, update, dispose, fail) during debug sessions.
class ProviderObserverLogger extends ProviderObserver {
  /// Optional flag to enable logging of provider state values (defaults to false).
  /// Be cautious enabling this in production or with sensitive data.
  final bool logValues;

  /// Formatter for timestamps in logs.
  final DateFormat _dateFormat = DateFormat(
    'H:mm:ss.ms',
  ); // Example: 14:35:07.123

  ProviderObserverLogger({this.logValues = false});

  /// Gets the current time formatted for logging.
  String get _timestamp => _dateFormat.format(DateTime.now());

  /// Helper to get a readable name for a provider (uses provider.name or runtimeType).
  String _providerName(ProviderBase<Object?> provider) {
    return provider.name ?? provider.runtimeType.toString();
  }

  /// Called when a provider is initialized.
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('✨ [$_timestamp] Provider Added: ${_providerName(provider)}');
      if (logValues) {
        print('ইনি Initial Value: $value'); // Log initial value if enabled
      }
    }
  }

  /// Called when a provider's value changes and notifies listeners.
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('🔄 [$_timestamp] Provider Updated: ${_providerName(provider)}');
      if (logValues) {
        // Optionally add more checks, e.g., if (previousValue != newValue)
        print('⬅️ Old Value: $previousValue');
        print('➡️ New Value: $newValue');
      }
    }
  }

  /// Called when a provider is disposed (no longer used).
  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('🗑️ [$_timestamp] Provider Disposed: ${_providerName(provider)}');
    }
  }

  /// Called when a provider throws an exception during creation or update.
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('❌ [$_timestamp] Provider Failed: ${_providerName(provider)}');
      print('Error: $error');
      // StackTrace can be verbose, consider logging selectively if needed
      print('StackTrace: $stackTrace');
    }
  }
}
