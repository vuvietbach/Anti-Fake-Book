import 'package:anti_fake_book/store/state/listposts.dart';

import '../../constants/constants.dart';
import '../../models/base_apis/dto/response/response.dto.dart';
import '../actions/listposts.dart';
import '../state/app.dart';
import '../state/index.dart';

AntiFakeBookState onGetListPostsPending(
    AntiFakeBookState preState, PendingGetListPostsAction action) {
  print('onGetListPostsPending');
  AntiFakeBookState newState = preState.copyWith.listPostsState();
  // print(newState.listPostsState.message);
  return newState;
}

AntiFakeBookState onGetListPostsSuccess(
    AntiFakeBookState preState, SuccessGetListPostsAction action) {
  action.extras['onSuccess']!();
  late ListPostsState listPostsState;
  print(action.payload.code);
  if (action.payload.code == "1000") {
    Map<String, dynamic> rawData = action.payload.data.toJson();
    List<Map<String, dynamic>> result = [];
    int postLength = rawData['post'].length;
    // print(postLength);
    // print('here');
    for (int i = 0; i < postLength; i++) {
      List<Map<String, dynamic>> resImage = [];
      // print('here');
      // print(rawData['post'][i]);
      Map<String, dynamic> thisPost = rawData['post'][i].toJson();
      // print(thisPost);
      for (int j = 0; j < thisPost['image'].length; j++) {
        // print(j);
        resImage.add(thisPost['image'][j].toJson());
      }
      // print('here');
      if (thisPost['video'] != null) {
        thisPost['video'] = thisPost['video'].toJson();
      }
      thisPost['image'] = resImage;
      thisPost['author'] = thisPost['author'].toJson();
      // print(thisPost);
      result.add(thisPost);
      // print('passed');
    }
    listPostsState = ListPostsState.fromJson({'post': result});
    listPostsState.newItems = rawData['new_items'];
    listPostsState.lastId = rawData['last_id'];
  } else {
    listPostsState = preState.listPostsState;
  }
  // print(action.payload.data.toJson());
  // print(listPostsState.lastId);
  // print('here');
  // print(listPostsState);

  AntiFakeBookState newState = preState.copyWith(
    appState: AppState(status: AppStatus.loaded),
    responseDTO: ResponseDTO(
        code: int.parse(action.payload.code ?? ""),
        message: action.payload.message ?? ""),
    listPostsState: listPostsState,
  );

  // DiskStore.saveState(newState);
  return newState;
}

ListPostsState updateListPostReducer(ListPostsState state, action) {
  if (action is UpdateListPostAction) {
    state.post[action.index] = action.updatedPost;
  }

  return state;
}
