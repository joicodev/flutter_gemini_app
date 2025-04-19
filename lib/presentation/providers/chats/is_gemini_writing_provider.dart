import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_gemini_writing_provider.g.dart';

@riverpod
class IsGeminiWriting extends _$IsGeminiWriting {
  @override
  bool build() => false;

  void setIsWriting(bool isWriting) {
    state = isWriting;
  }
}
