import 'package:anti_fake_book/store/state/listposts.dart';

import '../../constants/constants.dart';
import '../../disk.dart';
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
    int postLength = rawData['post'].length;
    for (int i = 0; i < postLength; i++) {
      List<Map<String, dynamic>> res = [];
      for (int j = 0; j < rawData['post'][i]['video'].length; j++) {
        res.add(rawData['post'][i]['video'][j].toJson());
      }
      rawData['post'][i]['video'] = res;
      rawData['post'][i]['author'] = rawData['post'][i]['author'].toJson();
    }
    listPostsState = ListPostsState.fromJson(rawData);
    listPostsState.newItems = rawData['new_items'];
    listPostsState.lastId = rawData['last_id'];
  } else {
    listPostsState = preState.listPostsState;
  }
  // print(action.payload.data.toJson());
  // print(listPostsState.lastId);
  print(listPostsState);

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
