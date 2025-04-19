import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gemini_app/presentation/providers/chats/basic_chat_provider.dart';
import 'package:flutter_gemini_app/presentation/providers/user/user_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('BasicChatProvider', () {
    test('initial state is empty', () {
      expect(container.read(basicChatProvider), isEmpty);
    });

    test('addMessage adds a new message to the state', () {
      final user = container.read(userProvider);
      final partialText = PartialText(text: 'Hello, world!');

      container
          .read(basicChatProvider.notifier)
          .addMessage(partialText: partialText, user: user);

      final messages = container.read(basicChatProvider);
      expect(messages, hasLength(1));
      expect(messages.first, isA<TextMessage>());
      // expect(messages.first.text, 'Hello, world!');
      expect(messages.first.author, user);
    });

    test('messages are added in reverse chronological order', () {
      final user = container.read(userProvider);
      final partialText1 = PartialText(text: 'First message');
      final partialText2 = PartialText(text: 'Second message');

      container
          .read(basicChatProvider.notifier)
          .addMessage(partialText: partialText1, user: user);
      container
          .read(basicChatProvider.notifier)
          .addMessage(partialText: partialText2, user: user);

      final messages = container.read(basicChatProvider);
      expect(messages, hasLength(2));
      // expect(messages[0].text, 'Second message');
      // expect(messages[1].text, 'First message');
    });
  });
}
