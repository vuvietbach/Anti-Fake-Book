import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';

AntiFakeBookState onPendingGetUserInfo(
    AntiFakeBookState state, PendingGetUserInfoAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onSuccessGetUserInfo(
    AntiFakeBookState state, SuccessGetUserInfoAction action) {
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  AntiFakeBookState newState = state;
  if (isSuccessCode(action.payload.code)) {
    UserInfoData userInfo = state.userState.userInfo;
    if (action.extras['userId'] == null ||
        action.extras['userId'] == state.userState.userInfo.id) {
      userInfo = action.payload.data;
    }
    newState = state.copyWith(
      userState: state.userState.copyWith(
        userInfo: userInfo,
        searchedUserInfo: action.payload.data,
      ),
    );
  }
  return newState;
}

AntiFakeBookState onPendingSetUserInfo(
    AntiFakeBookState state, PendingSetUserInfoAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onSuccessSetUserInfo(
    AntiFakeBookState state, SuccessSetUserInfoAction action) {
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  AntiFakeBookState newState = state;
  if (isSuccessCode(action.payload.code)) {
    newState = state.copyWith(
      userState: state.userState.copyWith(
        userInfo: action.payload.data,
      ),
    );
  }
  return newState;
}
