import 'package:flutter/widgets.dart';
import 'package:flutter_gemini_app/lang/generated/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';

/// Provider used to access the AppLocalizations object for the current locale
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  // 1. Initialize from the initial locale
  ref.state = lookupAppLocalizations(PlatformDispatcher.instance.locale);

  // 2. Create an observer to update the state when locale changes
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(PlatformDispatcher.instance.locale);
  });

  // 3. Register the observer and clean up
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));

  // 4. Return the current localization
  return ref.state;
});

/// Observer to watch locale changes
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
