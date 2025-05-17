import 'package:ai_chat_dart_sdk/ai_chat_dart_sdk.dart';
import 'package:flutter_gemini_app/lang/generated/l10n/app_localizations.dart';

class AppTranslate {
  final AppLocalizations loc;

  AppTranslate(this.loc);

  String fromBaseException(BaseException baseException) {
    if (baseException is DIOException) {
      return baseException.translate(loc);
    } else if (baseException is SerializingException) {
      return baseException.translate(loc);
    }

    return baseException.message;
  }
}

extension _DIOExceptionMessage on DIOException {
  String translate(AppLocalizations loc) {
    return switch (type) {
      DioExceptionType.connectionError => loc.connectionErrorMessage,
      DioExceptionType.receiveTimeout => loc.receiveTimeoutErrorMessage,
      DioExceptionType.sendTimeout => loc.sendTimeoutErrorMessage,
      DioExceptionType.connectionTimeout => loc.connectionTimeoutErrorMessage,
      DioExceptionType.badCertificate => loc.badCertificateErrorMessage,
      DioExceptionType.badResponse => loc.badResponseErrorMessage,
      DioExceptionType.unknown => loc.unknownErrorMessage,
      DioExceptionType.cancel => loc.unknownErrorMessage,
    };
  }
}

extension _SerializingExceptionMessage on SerializingException {
  String translate(AppLocalizations loc) {
    switch (type) {
      case SerializingExceptionErrorType.argumentsError:
        return loc.argumentsErrorMessage;
      case SerializingExceptionErrorType.serializeData:
        return loc.serializeDataErrorMessage;
      default:
        return message;
    }
  }
}
