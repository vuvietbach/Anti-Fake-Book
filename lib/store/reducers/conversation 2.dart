import 'package:anti_fake_book/store/actions/conversation.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';

AntiFakeBookState onPendingGetListConversation(
    AntiFakeBookState state, PendingGetListConversationAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onSuccessGetListConversation(
    AntiFakeBookState state, SuccessGetListConversationAction action) {
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  AntiFakeBookState newState = state;
  if (isSuccessCode(action.payload.code)) {
    newState = state.copyWith(
      conversationState: state.conversationState.copyWith(
        conversations: action.payload.data,
      ),
    );
  }
  return newState;
}

AntiFakeBookState onPendingGetConversation(
    AntiFakeBookState state, PendingGetConversationAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onSuccessGetConversation(
    AntiFakeBookState state, SuccessGetConversationAction action) {
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  AntiFakeBookState newState = state;
  if (isSuccessCode(action.payload.code)) {
    newState = state.copyWith(
      conversationState: state.conversationState.copyWith(
        currentConversation: action.payload.data,
      ),
    );
  }
  return newState;
}

// AntiFakeBookState onPendingSetReadMessage(
//     AntiFakeBookState state, PendingSetReadMessageAction action) {
//   if (action.extras['onPending'] != null) action.extras['onPending']!();
//   return state;
// }

// AntiFakeBookState onSuccessSetReadMessage(
//     AntiFakeBookState state, SuccessSetReadMessageAction action) {
//   if (action.extras['onSuccess'] != null) {
//     action.extras['onSuccess']!(action.payload);
//   }
//   AntiFakeBookState newState = state;
//   if (isSuccessCode(action.payload.code)) {
//     newState = state.copyWith(
//       conversationState: state.conversationState.copyWith(

//       ),
//     );
//   }
//   return newState;
// }

// AntiFakeBookState onPendingDeleteMessage(
//     AntiFakeBookState state, PendingDeleteMessageAction action) {
//   if (action.extras['onPending'] != null) action.extras['onPending']!();
//   return state;
// }

// AntiFakeBookState onSuccessDeleteMessage(
//     AntiFakeBookState state, SuccessDeleteMessageAction action) {
//   if (action.extras['onSuccess'] != null) {
//     action.extras['onSuccess']!(action.payload);
//   }
//   AntiFakeBookState newState = state;
//   if (isSuccessCode(action.payload.code)) {
//     newState = state.copyWith(
//       conversationState: state.conversationState.copyWith(
//         conversation: action.payload.data,
//       ),
//     );
//   }
//   return newState;
// }

// AntiFakeBookState onPendingDeleteConversation(
//     AntiFakeBookState state, PendingDeleteConversationAction action) {
//   if (action.extras['onPending'] != null) action.extras['onPending']!();
//   return state;
// }

// AntiFakeBookState onSuccessDeleteConversation(
//     AntiFakeBookState state, SuccessDeleteConversationAction action) {
//   if (action.extras['onSuccess'] != null) {
//     action.extras['onSuccess']!(action.payload);
//   }
//   AntiFakeBookState newState = state;
//   if (isSuccessCode(action.payload.code)) {
//     newState = state.copyWith(
//       conversationState: state.conversationState.copyWith(
//         conversation: action.payload.data,
//       ),
//     );
//   }
//   return newState;
// }
