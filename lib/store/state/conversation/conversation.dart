import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'conversation.freezed.dart';
part 'conversation.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ConversationState with _$ConversationState {
  factory ConversationState({
    @Default([]) List<ListConversationData> conversations,
    @Default(ConversationMetadata(isBlocked: 0, conversation: []))
    ConversationMetadata currentConversation,
  }) = _ConversationState;

  factory ConversationState.fromJson(Map<String, dynamic> json) =>
      _$ConversationStateFromJson(json);
}
