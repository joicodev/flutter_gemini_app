import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const seedColor = Color(0xFF1E1C36);

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    ),
    listTileTheme: const ListTileThemeData(iconColor: seedColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: seedColor,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
  );

  static setSystemUIOverlayStyle(bool isDarkMode) {
    final themeBrightness = isDarkMode ? Brightness.light : Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: themeBrightness,
        statusBarBrightness: themeBrightness,
        systemNavigationBarIconBrightness: themeBrightness,
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
