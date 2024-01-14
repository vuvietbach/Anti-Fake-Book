import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/store/state/user_info.dart';

class FriendSectionViewModel {
  final List<Friend> friendList;
  final int totalNumFriend;
  final UserInfo userInfo;

  const FriendSectionViewModel(
      {required this.friendList,
      required this.totalNumFriend,
      required this.userInfo});
}
