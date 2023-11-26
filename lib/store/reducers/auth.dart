import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/store/actions/auth.dart';
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/index.dart';

AntiFakeBookState onSignInSuccess(
    AntiFakeBookState state, SuccessSignInAction action) {
  return state.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO:
        ResponseDTO(code: action.payload.code, message: action.payload.message),
  );
}

AntiFakeBookState onSignInPending(
    AntiFakeBookState state, PendingSignInAction action) {
  return state.copyWith(
    appState: AppState(status: AppStatus.loading),
  );
}
