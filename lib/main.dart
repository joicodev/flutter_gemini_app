import 'package:flutter/material.dart';
import 'package:flutter_gemini_app/config/router/app_router.dart';
import 'package:flutter_gemini_app/config/theme/app_theme.dart';

void main() {
  AppTheme.setSystemUIOverlayStyle(true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: true).getTheme(),
    );
  }
}
