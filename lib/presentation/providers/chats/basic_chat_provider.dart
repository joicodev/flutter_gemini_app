import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'basic_chat_provider.g.dart';

final _uuid = Uuid();

@riverpod
class BasicChat extends _$BasicChat {
  @override
  List<Message> build() => [];

  void addMessage({required PartialText partialText, required User user}) {
    _addTextMessage(partialText: partialText, user: user);
  }

  void _addTextMessage({required PartialText partialText, required User user}) {
    final message = TextMessage(
      id: _uuid.v4(),
      text: partialText.text,
      author: user,
    );

    state = [message, ...state];
  }
}
