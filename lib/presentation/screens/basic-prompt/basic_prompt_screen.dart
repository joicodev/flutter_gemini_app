import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as fct;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

final user = fct.User(
  id: '1',
  firstName: 'John',
  lastName: 'Doe',
  imageUrl: 'https://i.pravatar.cc/150?img=1',
);

final geminiUser = fct.User(
  id: '2',
  firstName: 'Gemini',
  lastName: 'AI',
  imageUrl: 'https://picsum.photos/id/179/200/200',
);

final messages = <fct.Message>[
  fct.TextMessage(
    id: Uuid().v4(),
    text: 'I am fine, thank you!',
    createdAt: DateTime.now().millisecondsSinceEpoch,
    author: geminiUser,
  ),
  fct.TextMessage(
    id: Uuid().v4(),
    text: 'Hello, how are you?',
    createdAt: DateTime.now().millisecondsSinceEpoch,
    author: user,
  ),
  fct.TextMessage(
    id: Uuid().v4(),
    text: 'Hello, world!!',
    createdAt: DateTime.now().millisecondsSinceEpoch,
    author: user,
  ),
];

class BasicPromptScreen extends StatelessWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BasicPromptScreen')),
      body: Chat(
        messages: messages,
        onSendPressed: onSendPressed,
        user: user,
        showUserNames: true,
        showUserAvatars: true,
        theme: DarkChatTheme(),
        typingIndicatorOptions: TypingIndicatorOptions(
          // typingUsers: [geminiUser],
        ),
      ),
    );
  }

  void onSendPressed(fct.PartialText partialText) {
    print(partialText);
  }
}
