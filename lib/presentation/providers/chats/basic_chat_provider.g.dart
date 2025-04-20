// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$basicChatHash() => r'a18f8280dede7f8a82647de4db74e20a6b0e716f';

/// Manages the state (`List<Message>`) of a basic chat conversation with Gemini.
/// Handles user messages and fetches AI responses via `BasicPromptUseCase`.
///
/// Copied from [BasicChat].
@ProviderFor(BasicChat)
final basicChatProvider =
    AutoDisposeNotifierProvider<BasicChat, List<Message>>.internal(
      BasicChat.new,
      name: r'basicChatProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$basicChatHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BasicChat = AutoDisposeNotifier<List<Message>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
