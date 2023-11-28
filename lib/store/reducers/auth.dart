import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/disk.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:logger/logger.dart';

AntiFakeBookState onSignInSuccess(
    AntiFakeBookState state, SuccessSignInAction action) {
  action.extras['onSuccess']!();
  late UserState userState;
  if (action.payload.code == 1000) {
    userState = UserState.fromJson(action.payload.data);
  } else {
    userState = state.userState;
  }
  AntiFakeBookState newState = state.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO:
        ResponseDTO(code: action.payload.code, message: action.payload.message),
    userState: userState,
  );
//   var logger = Logger(
//   printer: PrettyPrinter(),
// );
//   logger.d(userState.email);
  DiskStore.saveState(newState);
  return newState;
}

AntiFakeBookState onSignInPending(
    AntiFakeBookState state, PendingSignInAction action) {
  action.extras['onPending']!();
  return state.copyWith(
    appState: AppState(status: AppStatus.loading),
  );
}
