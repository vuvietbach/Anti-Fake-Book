import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/conversation.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/conversation.dto.dart';
import 'package:redux_future_middleware/redux_future_middleware.dart';

class GetListConversationAction extends FutureAction<GetListConversationAction,
    GetListConversationResponse> {
  final GetListConversationRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  GetListConversationAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.getListConversation(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessGetListConversationAction = FutureSucceededAction<
    GetListConversationAction, GetListConversationResponse>;
typedef PendingGetListConversationAction
    = FuturePendingAction<GetListConversationAction>;

class GetConversationAction
    extends FutureAction<GetConversationAction, GetConversationResponse> {
  final GetConversationRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  GetConversationAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.getConversation(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessGetConversationAction
    = FutureSucceededAction<GetConversationAction, GetConversationResponse>;
typedef PendingGetConversationAction
    = FuturePendingAction<GetConversationAction>;

class SetReadMessageAction
    extends FutureAction<SetReadMessageAction, SetReadMessageResponse> {
  final SetReadMessageRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  SetReadMessageAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.setReadMessage(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessSetReadMessageAction
    = FutureSucceededAction<SetReadMessageAction, SetReadMessageResponse>;
typedef PendingSetReadMessageAction = FuturePendingAction<SetReadMessageAction>;

class DeleteMessageAction
    extends FutureAction<DeleteMessageAction, DeleteMessageResponse> {
  final DeleteMessageRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  DeleteMessageAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.deleteMessage(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessDeleteMessageAction
    = FutureSucceededAction<DeleteMessageAction, DeleteMessageResponse>;
typedef PendingDeleteMessageAction = FuturePendingAction<DeleteMessageAction>;

class DeleteConversationAction
    extends FutureAction<DeleteConversationAction, DeleteConversationResponse> {
  final DeleteConversationRequest data;
  final Function? onSuccess;
  final Function? onPending;
  final Function? onError;
  DeleteConversationAction(
      {required this.data, this.onSuccess, this.onPending, this.onError})
      : super(future: ApiModel.api.deleteConversation(data), extras: {
          'onSuccess': onSuccess,
          'onPending': onPending,
          'onError': onError
        });
}

typedef SuccessDeleteConversationAction = FutureSucceededAction<
    DeleteConversationAction, DeleteConversationResponse>;
typedef PendingDeleteConversationAction
    = FuturePendingAction<DeleteConversationAction>;
