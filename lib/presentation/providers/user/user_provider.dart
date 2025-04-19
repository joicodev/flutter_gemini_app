import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user_provider.g.dart';

@riverpod
User geminiUser(Ref ref) {
  return User(
    id: Uuid().v4(),
    firstName: 'Gemini',
    lastName: 'AI',
    imageUrl: 'https://picsum.photos/id/179/200/200',
  );
}

@Riverpod(keepAlive: true)
User user(Ref ref) {
  return User(
    id: Uuid().v4(),
    firstName: 'John',
    lastName: 'Doe',
    imageUrl: 'https://picsum.photos/id/179/200/200',
  );
}
