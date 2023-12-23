import 'package:anti_fake_book/store/state/listposts.dart';

import '../../constants/constants.dart';
import '../../models/base_apis/dto/response/response.dto.dart';
import '../actions/listvideos.dart';
import '../state/app.dart';
import '../state/index.dart';
import '../state/list_videos.dart';

AntiFakeBookState onGetListVideosPending(
    AntiFakeBookState preState, PendingGetListVideosAction action) {
  print('onGetListVideosPending');
  AntiFakeBookState newState = preState.copyWith.listVideosState();
  // print(newState.listVideosState.message);
  return newState;
}

AntiFakeBookState onGetListVideosSuccess(
    AntiFakeBookState preState, SuccessGetListVideosAction action) {
  action.extras['onSuccess']!();
  late ListVideosState listVideosState;
  // print(action.payload.code);
  // print('here');
  // print(action.payload.data.toJson());
  // print('here');
  // print(action.payload.toJson());
  // print('ok');
  // print(convertFromResponseToListVideo(action.payload.toJson()));
  if (action.payload.code == "1000") {
    Map<String, dynamic> rawData = action.payload.data.toJson();
    List<Map<String, dynamic>> result = rawData['post'];
    listVideosState = ListVideosState.fromJson({'post': result});
    listVideosState.newItems = rawData['new_items'];
    listVideosState.lastId = rawData['last_id'];
  } else {
    listVideosState = preState.listVideosState;
  }
  // print(action.payload.data.toJson());
  // print(listVideosState.lastId);
  // print('here');
  // print(listVideosState);

  AntiFakeBookState newState = preState.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO: ResponseDTO(
        code: int.parse(action.payload.code ?? ""),
        message: action.payload.message ?? ""),
    listVideosState: listVideosState,
  );

  // DiskStore.saveState(newState);
  return newState;
}

ListVideosState updatelistVideosReducer(ListVideosState state, action) {
  if (action is UpdateListVideoAction) {
    state.post[action.index] = action.updatedVideo;
  }

  return state;
}
