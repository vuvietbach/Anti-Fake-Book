import '../../constants/constants.dart';
import '../../models/base_apis/dto/response/response.dto.dart';
import '../actions/requested_friends.dart';
import '../state/app.dart';
import '../state/index.dart';
import '../state/requested_friends.dart';

AntiFakeBookState onGetRequestedFriendsPending(
    AntiFakeBookState preState, PendingGetRequestedFriendsAction action) {
  print('onGetRequestedFriendsPending');
  AntiFakeBookState newState = preState.copyWith.requestedFriendsState();
  return newState;
}

AntiFakeBookState onGetRequestedFriendsSuccess(
    AntiFakeBookState preState, SuccessGetRequestedFriendsAction action) {
  action.extras['onSuccess']!();
  late RequestedFriendsState requestedFriendsState;
  print(action.payload.code);
  print(action.payload.data);
  if (action.payload.code == "1000") {
    Map<String, dynamic> rawData = action.payload.data.toJson();
    List<Map<String, dynamic>> result = [];
    int requestFriendsLength = rawData['requests'].length;
    print(requestFriendsLength);
    // for (int i = 0; i < requestFriendsLength; i++) {
    //   print(rawData['requests'][i]);
    //   Map<String, dynamic> thisRequest = rawData['requests'][i].toJson();
    //   result.add(thisRequest);
    // }
    requestedFriendsState = RequestedFriendsState.fromJson(rawData);
  } else {
    requestedFriendsState = preState.requestedFriendsState;
  }
  // print(action.payload.data.toJson());

  AntiFakeBookState newState = preState.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO: ResponseDTO(
        code: int.parse(action.payload.code ?? ""),
        message: action.payload.message ?? ""),
    requestedFriendsState: requestedFriendsState,
  );

  // DiskStore.saveState(newState);
  return newState;
}
