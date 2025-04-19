import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_gemini_app/presentation/providers/chats/is_gemini_writing_provider.dart';
import 'package:flutter_gemini_app/presentation/providers/user/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'basic_chat_provider.g.dart';

final _uuid = Uuid();

@riverpod
class BasicChat extends _$BasicChat {
  @override
  List<Message> build() => [];

  /// This function is used to add a message to the chat.
  void addMessage({required PartialText partialText, required User user}) {
    _addTextMessage(partialText: partialText, user: user);
  }

  /// This function is used to add a text message to the chat.
  void _addTextMessage({required PartialText partialText, required User user}) {
    final message = TextMessage(
      id: _uuid.v4(),
      text: partialText.text,
      author: user,
    );

    state = [message, ...state];
    _geminiTextResponse(partialText.text);
  }

  /// This function is used to simulate a response from Gemini.
  Future<void> _geminiTextResponse(String prompt) async {
    final geminiUser = ref.read(geminiUserProvider);
    final isGeminiWriting = ref.read(isGeminiWritingProvider.notifier);

    isGeminiWriting.setIsWriting(true);
    await Future.delayed(const Duration(seconds: 2));
    isGeminiWriting.setIsWriting(false);

    final message = TextMessage(
      id: _uuid.v4(),
      text: 'Hello from Gemini!: $prompt',
      author: geminiUser,
    );

    state = [message, ...state];
  }
}
