import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/store/actions/common.dart';
import 'package:anti_fake_book/store/state/index.dart';

AntiFakeBookState onResetResponse(
    AntiFakeBookState state, ResetResponseAction action) {
  return state.copyWith(
    responseDTO: ResponseDTO(),
  );
}