// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get connectionErrorMessage => 'Could not connect to the server, try again later.';

  @override
  String get receiveTimeoutErrorMessage => 'No response was received from the server, try again later.';

  @override
  String get sendTimeoutErrorMessage => 'The request could not be sent to the server, try again later.';

  @override
  String get connectionTimeoutErrorMessage => 'The connection timed out, try again later.';

  @override
  String get badCertificateErrorMessage => 'The security of the connection could not be verified, try again later.';

  @override
  String get badResponseErrorMessage => 'The server response was invalid, try again later.';

  @override
  String get unknownErrorMessage => 'An unknown error occurred, try again later.';

  @override
  String get argumentsErrorMessage => 'The request arguments are not valid, try again later.';

  @override
  String get serializeDataErrorMessage => 'The request data could not be serialized, try again later.';
}
