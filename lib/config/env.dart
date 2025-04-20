import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get geminiApiUrl => dotenv.env['GEMINI_API_URL'] ?? '';
}
