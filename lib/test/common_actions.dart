import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/store/actions/conversation.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:redux/redux.dart';

void getConversation(Store<AntiFakeBookState> store) {
  store.dispatch(GetConversationAction(
      data: GetConversationRequest(
    token: store.state.userState.token,
    partnerId: store.state.userState.searchedUserInfo.id,
    index: "0",
    count: "10",
  )));
}

void getUserInfo(Store<AntiFakeBookState> store) {
  store.dispatch(GetUserInfoAction(
    token: store.state.userState.token,
    data: GetUserInfoRequest(),
  ));
}
