import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_gemini_app/presentation/providers/chats/basic_chat_provider.dart';
import 'package:flutter_gemini_app/presentation/providers/chats/is_gemini_writing_provider.dart';
import 'package:flutter_gemini_app/presentation/providers/user/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicPromptScreen extends ConsumerWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final geminiUser = ref.watch(geminiUserProvider);
    final isGeminiWriting = ref.watch(isGeminiWritingProvider);
    final chatMessages = ref.watch(basicChatProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('BasicPromptScreen')),
      body: Chat(
        messages: chatMessages,
        onSendPressed: (partialText) => _onSendPressed(ref, user, partialText),
        user: user,
        showUserNames: true,
        showUserAvatars: true,
        theme: DarkChatTheme(),
        typingIndicatorOptions: TypingIndicatorOptions(
          typingUsers: isGeminiWriting ? [geminiUser] : [],
        ),
      ),
    );
  }

  void _onSendPressed(WidgetRef ref, User user, PartialText partialText) {
    final basicChatNotifier = ref.read(basicChatProvider.notifier);
    basicChatNotifier.sendUserMessage(partialText: partialText, user: user);
  }
}
