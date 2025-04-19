import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gemini_app/presentation/providers/chats/is_gemini_writing_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('IsGeminiWritingProvider', () {
    test('initial state is false', () {
      expect(container.read(isGeminiWritingProvider), isFalse);
    });

    test('setIsWriting updates the state', () {
      container.read(isGeminiWritingProvider.notifier).setIsWriting(true);
      expect(container.read(isGeminiWritingProvider), isTrue);

      container.read(isGeminiWritingProvider.notifier).setIsWriting(false);
      expect(container.read(isGeminiWritingProvider), isFalse);
    });
  });
}
