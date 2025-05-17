// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get connectionErrorMessage => 'Lo sentimos, no hemos podido conectarnos al servidor. Por favor, intenta de nuevo más tarde.';

  @override
  String get receiveTimeoutErrorMessage => 'Lo sentimos, no hemos podido recibir la respuesta del servidor. Por favor, intenta de nuevo más tarde.';

  @override
  String get sendTimeoutErrorMessage => 'Lo sentimos, no hemos podido enviar la solicitud al servidor. Por favor, intenta de nuevo más tarde.';

  @override
  String get connectionTimeoutErrorMessage => 'Lo sentimos, ha habido un error en la conexión. Por favor, intenta de nuevo más tarde.';

  @override
  String get badCertificateErrorMessage => 'Lo sentimos, el certificado del servidor no es válido. Por favor, informa al administrador del sitio.';

  @override
  String get badResponseErrorMessage => 'Lo sentimos, la respuesta del servidor no es válida. Por favor, intenta de nuevo más tarde.';

  @override
  String get unknownErrorMessage => 'Lo sentimos, ha habido un error desconocido. Por favor, intenta de nuevo más tarde.';

  @override
  String get argumentsErrorMessage => 'Lo sentimos, los argumentos de la solicitud no son válidos. Por favor, intenta de nuevo más tarde.';

  @override
  String get serializeDataErrorMessage => 'Lo sentimos, ha habido un error al serializar los datos. Por favor, intenta de nuevo más tarde.';
}
