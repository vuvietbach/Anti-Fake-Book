import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/services/save_to_disk_service.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user.dart';

AntiFakeBookState onSignInSuccess(
    AntiFakeBookState state, SuccessSignInAction action) {
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  late UserState userState;
  if (action.payload.code == 1000) {
    userState = UserState.fromJson(action.payload.data.toJson());
  } else {
    userState = state.userState;
  }
  AntiFakeBookState newState = state.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO:
        ResponseDTO(code: action.payload.code, message: action.payload.message),
    userState: userState,
  );

  // DiskStore.saveState(newState);
  return newState;
}

AntiFakeBookState onSignInPending(
    AntiFakeBookState state, PendingSignInAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state.copyWith(
    appState: AppState(status: AppStatus.loading),
  );
}

AntiFakeBookState onSignUpSuccess(
    AntiFakeBookState state, SuccessSignUpAction action) {
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onSignUpPending(
    AntiFakeBookState state, PendingSignUpAction action) {
  action.extras['onPending']?.call();
  return state;
}

AntiFakeBookState onSuccessCheckVerifyCode(
    AntiFakeBookState state, SuccessCheckVerifyCodeAction action) {
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onPendingCheckVerifyCode(
    AntiFakeBookState state, PendingCheckVerifyCodeAction action) {
  action.extras['onPending']?.call();
  return state;
}

AntiFakeBookState onSuccessGetVerifyCode(
    AntiFakeBookState state, SuccessGetVerifyCodeAction action) {
  action.extras['onSuccess']?.call(action.payload);
  return state;
}

AntiFakeBookState onPendingGetVerifyCode(
    AntiFakeBookState state, PendingGetVerifyCodeAction action) {
  action.extras['onPending']?.call();
  return state;
}
