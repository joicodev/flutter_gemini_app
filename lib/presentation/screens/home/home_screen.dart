import 'package:flutter/material.dart';
import 'package:flutter_gemini_app/config/extensions/context_extension.dart';
import 'package:flutter_gemini_app/config/router/app_routes_paths.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Gemini')),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            onTap: () => context.push(AppRoutesPaths.basicPrompt),
            title: Text('Basic Prompt'),
            subtitle: const Text('Use an flash model'),
          ),
        ],
      ),
    );
  }
}
