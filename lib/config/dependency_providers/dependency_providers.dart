import 'package:ai_chat_dart_sdk/ai_chat_dart_sdk.dart';
import 'package:flutter_gemini_app/config/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependency_providers.g.dart';

class DependencyCreator {
  static initialize() {}
}

@riverpod
SecureStorageRepository secureStorageRepository(Ref ref) {
  return SecureStorageRepositoryImpl();
}

@Riverpod(keepAlive: true)
AIChatDioClient aiChatDioClient(Ref ref) {
  return AIChatDioClient(
    Env.geminiApiUrl,
    ref.read(secureStorageRepositoryProvider),
  );
}

@riverpod
GeminiChatRepository geminiRepository(Ref ref) {
  final aiChatDioClient = ref.read(aiChatDioClientProvider);
  return GeminiChatRepositoryImpl(aiChatDioClient);
}
