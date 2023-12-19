
import 'package:anti_fake_book/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/base_apis/dto/response/friend.dto.dart';

// part 'friend_list.freezed.dart';
part 'friend_list.g.dart';

@customJsonSerializable
class FriendList {
  final List<Friend> friends;
  final int total;

  FriendList({required this.friends, required this.total});

  factory FriendList.fromJson(Map<String, dynamic> json) =>
      _$FriendListFromJson(json);
  Map<String, dynamic> toJson() => _$FriendListToJson(this);
}