import 'package:flutter_gemini_app/config/router/app_routes_paths.dart';
import 'package:flutter_gemini_app/presentation/screens/basic-prompt/basic_prompt_screen.dart';
import 'package:flutter_gemini_app/presentation/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutesPaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutesPaths.basicPrompt,
      builder: (context, state) => const BasicPromptScreen(),
    ),
  ],
);
