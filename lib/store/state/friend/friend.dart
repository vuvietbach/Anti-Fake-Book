
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'friend.freezed.dart';
part 'friend.g.dart';


@Freezed(makeCollectionsUnmodifiable: false)
class FriendState with _$FriendState {
  const FriendState._();
  @customJsonSerializable
  factory FriendState({
    @Default([]) List<Friend> userFriends,
    @Default(0) int userTotalNumFriend,
    @Default([]) List<Friend> searchedUserFriends,
    @Default(0) int searchedUserTotalNumFriend,
  }) = _FriendState;

  factory FriendState.fromJson(Map<String, dynamic> json) =>
      _$FriendStateFromJson(json);
}