import 'package:anti_fake_book/plugins/index.dart';

import '../../constants/constants.dart';
import '../../models/base_apis/dto/response/response.dto.dart';
import '../actions/recommended_friends.dart';
import '../state/app.dart';
import '../state/index.dart';
import '../state/recommended_friends.dart';

AntiFakeBookState onGetRecommendedFriendsPending(
    AntiFakeBookState preState, PendingGetRecommendedFriendsAction action) {
  // print('onGetRecommendedFriendsPending');
  AntiFakeBookState newState = preState.copyWith.recommendedFriendsState();
  return newState;
}

AntiFakeBookState onGetRecommendedFriendsSuccess(
    AntiFakeBookState preState, SuccessGetRecommendedFriendsAction action) {
  action.extras['onSuccess']!();
  late RecommendedFriendsState recommendedFriendsState;
  // print(action.payload.code);
  // print(action.payload.data);
  if (action.payload.code == "1000") {
    int len = action.payload.data.length;
    List<Map<String, dynamic>> result = [];
    for (int i = 0; i < len; i++) {
      result.add(action.payload.data[i].toJson());
    }
    recommendedFriendsState =
        RecommendedFriendsState.fromJson({"requests": result});
  } else {
    recommendedFriendsState = preState.recommendedFriendsState;
  }
  // print(action.payload.data.toJson());

  AntiFakeBookState newState = preState.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO: ResponseDTO(
        code: int.parse(action.payload.code ?? ""),
        message: action.payload.message ?? ""),
    recommendedFriendsState: recommendedFriendsState,
  );

  // DiskStore.saveState(newState);
  return newState;
}
