import 'package:flutter/material.dart';
import 'package:flutter_gemini_app/config/router/app_router.dart';
import 'package:flutter_gemini_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  AppTheme.setSystemUIOverlayStyle(true);
  runApp(ProviderScope(child: const GeminiApp()));
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
