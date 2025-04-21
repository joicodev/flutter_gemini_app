import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini_app/config/dependency_providers/provider_observer_logger.dart';
import 'package:flutter_gemini_app/config/router/app_router.dart';
import 'package:flutter_gemini_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  AppTheme.setSystemUIOverlayStyle(true);
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(observers: [ProviderObserverLogger()], child: GeminiApp()),
  );
}

class GeminiApp extends StatelessWidget {
  const GeminiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: true).getTheme(),
    );
  }
}
