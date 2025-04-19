import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gemini_app/presentation/providers/user/user_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('UserProvider', () {
    test('user provider returns a User with correct properties', () {
      final user = container.read(userProvider);
      expect(user, isA<User>());
      expect(user.firstName, 'John');
      expect(user.lastName, 'Doe');
      expect(user.imageUrl, 'https://picsum.photos/id/179/200/200');
    });

    test('geminiUser provider returns a User with correct properties', () {
      final geminiUser = container.read(geminiUserProvider);
      expect(geminiUser, isA<User>());
      expect(geminiUser.firstName, 'Gemini');
      expect(geminiUser.lastName, 'AI');
      expect(geminiUser.imageUrl, 'https://picsum.photos/id/179/200/200');
    });

    test('user provider returns the same instance when keepAlive is true', () {
      final user1 = container.read(userProvider);
      final user2 = container.read(userProvider);
      expect(user1, same(user2));
    });
  });
}
