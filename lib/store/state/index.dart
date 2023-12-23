import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/response.dto.dart';
import 'package:anti_fake_book/models/saved_state.dto.dart';
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/auth.dart';
import 'package:anti_fake_book/store/state/conversation/conversation.dart';
import 'package:anti_fake_book/store/state/list_videos.dart';
import 'package:anti_fake_book/store/state/listposts.dart';
import 'package:anti_fake_book/store/state/friend/friend.dart';
import 'package:anti_fake_book/store/state/post.dart';
import 'package:anti_fake_book/store/state/requested_friends.dart';
import 'package:anti_fake_book/store/state/search/search.dart';
import 'package:anti_fake_book/store/state/user.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'index.freezed.dart';
part 'index.g.dart';

@freezed
class AntiFakeBookState with _$AntiFakeBookState {
  @customJsonSerializable
  factory AntiFakeBookState({
    required String token,
    required AuthState authState,
    required ResponseDTO responseDTO,
    required AppState appState,
    required PostState postState,
    required UserState userState,
    required SearchState searchState,
    required ConversationState conversationState,
    required ListPostsState listPostsState,
    required RequestedFriendsState requestedFriendsState,
    required FriendState friendState,
    required ListVideosState listVideosState,
  }) = _AntiFakeBookState;

  factory AntiFakeBookState.initState() => AntiFakeBookState(
        token: "",
        authState: AuthState(),
        appState: AppState(),
        postState: PostState(),
        userState: UserState(),
        responseDTO: ResponseDTO(),
        searchState: const SearchState(),
        conversationState: ConversationState(),
        listPostsState: ListPostsState(),
        requestedFriendsState: RequestedFriendsState(),
        friendState: FriendState(),
        listVideosState: ListVideosState(),
      );

  factory AntiFakeBookState.fromJson(Map<String, dynamic> json) =>
      _$AntiFakeBookStateFromJson(json);
}
