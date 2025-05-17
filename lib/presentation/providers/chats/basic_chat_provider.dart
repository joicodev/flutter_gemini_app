import 'package:ai_chat_dart_sdk/ai_chat_dart_sdk.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_gemini_app/config/dependency_providers/dependency_providers.dart';
import 'package:flutter_gemini_app/presentation/providers/chats/is_gemini_writing_provider.dart';
import 'package:flutter_gemini_app/presentation/providers/user/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'basic_chat_provider.g.dart';

/// Generates unique IDs for messages.
final _uuid = Uuid();

/// Manages the state (`List<Message>`) of a basic chat conversation with Gemini.
/// Handles user messages and fetches AI responses via `BasicPromptUseCase`.
@riverpod
class BasicChat extends _$BasicChat {
  /// Lazily initialized use case for interacting with the Gemini model.
  BasicPromptUseCase? _basicPromptUseCase;

  /// Builds the initial empty message list state.
  @override
  List<Message> build() => [];

  /// Adds a user message to the state and triggers fetching a Gemini response.
  /// Takes user input `partialText` and the `user` object.
  void sendUserMessage({required PartialText partialText, required User user}) {
    /// Creates a new user message and adds it to the state.
    _createTextMessage(text: partialText.text, author: user);

    /// Fetches a Gemini response for the given `prompt` and adds it to the state.
    _fetchAndAddGeminiResponse(prompt: partialText.text);
  }

  /// Fetches a Gemini response for the given `prompt`, updates loading state,
  /// and adds the response message to the chat history.
  Future<void> _fetchAndAddGeminiResponse({required String prompt}) async {
    _setIsWriting(true);

    final result = await _promptUseCase.execute(
      BasicPrompParams(prompt: prompt),
    );

    _setIsWriting(false);
    result.fold(
      (failure) {
        debugPrint(
          '❌ Error fetching Gemini response: ${failure.runtimeType} = ${failure.message}',
        );

        final translate = ref.read(appTranslateProvider);
        _createTextMessage(
          status: Status.error,
          text: translate.fromBaseException(failure),
          author: User(id: 'system_error', firstName: 'System'),
        );
      },
      (responseText) {
        debugPrint('✅ Success fetching Gemini response: $responseText');
        _createTextMessage(
          text: responseText,
          author: ref.read(geminiUserProvider),
        );
      },
    );
  }

  /// Creates a new `TextMessage` with the given parameters.
  void _createTextMessage({
    required String text,
    required User author,
    Status? status,
  }) {
    final message = TextMessage(
      id: _uuid.v4(),
      text: text,
      author: author,
      status: status,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    state = [message, ...state];
  }

  /// Updates the writing state of Gemini in the UI.
  void _setIsWriting(bool isWriting) {
    final isGeminiWritingNotifier = ref.read(isGeminiWritingProvider.notifier);
    isGeminiWritingNotifier.setIsWriting(isWriting);
  }

  /// Provides access to the `_basicPromptUseCase`, initializing it if needed.
  BasicPromptUseCase get _promptUseCase =>
      _basicPromptUseCase ??= BasicPromptUseCase(
        ref.read(geminiRepositoryProvider),
      );
}
