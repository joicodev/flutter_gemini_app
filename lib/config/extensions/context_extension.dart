import 'package:flutter/widgets.dart';
import 'package:flutter_gemini_app/lang/generated/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
