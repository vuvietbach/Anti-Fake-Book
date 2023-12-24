import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/post.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/user_info.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/get_list_posts.dto.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/store/actions/block.dart';
import 'package:anti_fake_book/store/actions/friends.dart';
import 'package:anti_fake_book/store/actions/user_info.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FriendState {
  final List<Friend> friends;
  final List<Friend> sortedByNameFriends;
  final List<Friend> sortedByDateFriends;
  final int total;
  final String? userId;
  final bool isOwner;
  final Function(FriendState)? setStateCallback;
  FriendState(
      {this.friends = const [],
      this.total = 0,
      required this.userId,
      required this.setStateCallback})
      : isOwner = isAccountOwner(userId, Plugins.antiFakeBookStore!.state),
        sortedByNameFriends = sortFriendsByName(friends),
        sortedByDateFriends = [...friends];

  static List<Friend> sortFriendsByName(List<Friend> friends) {
    var newFriends = [...friends];
    newFriends.sort((a, b) => a.username.compareTo(b.username));
    return newFriends;
  }

  static List<Friend> sortFriendsByDate(List<Friend> friends) {
    var newFriends = [...friends];
    newFriends.sort((a, b) =>
        DateTime.parse(b.created).compareTo(DateTime.parse(a.created)));
    return newFriends;
  }

  void unfriend(BuildContext context, String userId) {
    if (isOwner) {
      Plugins.antiFakeBookStore!.dispatch(UnfriendAction(
          data: UnfriendRequest(userId: userId), context: context));
    }
  }

  void blockUser(BuildContext context, String userId) {
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(SetBlockAction(userId, true, {'context': context}));
    }
  }

  void getInitialFriends(BuildContext context) async {
    final request = GetUserFriendsRequest(
        index: 0, count: NUM_QUERY_PER_REQUEST, userId: userId);
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(GetUserFriendsAction(data: request, context: context));
    } else {
      callAPI(context, () async {
        final response = await ApiModel.api.getUserFriends(request);
        final newState = FriendState(
            friends: response.friends,
            total: response.total,
            userId: userId,
            setStateCallback: setStateCallback);
        setStateCallback?.call(newState);
      });
    }
  }

  List<Friend> filterFriends(int filterType, String keyword) {
    if (keyword.isEmpty) {
      return filterType == 0 ? alphabeticalFriends : recentFriends;
    } else {
      final tmp = (filterType == 0) ? alphabeticalFriends : recentFriends;
      return tmp
          .where((Friend element) =>
              element.username.toLowerCase().contains(keyword))
          .toList();
    }
  }

  void loadMoreFriends(BuildContext context) {
    final request = GetUserFriendsRequest(
        index: friends.length, count: NUM_QUERY_PER_REQUEST, userId: userId);
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(GetUserFriendsAction(data: request, context: context));
    } else {
      callAPI(context, () async {
        final response = await ApiModel.api.getUserFriends(request);
        final newState = FriendState(
            friends: response.friends,
            total: response.total,
            userId: userId,
            setStateCallback: setStateCallback);
        setStateCallback?.call(newState);
      });
    }
  }

  get recentFriends => sortedByDateFriends;
  get alphabeticalFriends => sortedByNameFriends;
  get topRecentFriends => sortedByDateFriends.take(6).toList();
}

class UserState {
  final String? userId;
  final UserInfo userInfo;
  final bool isOwner;
  final Function(UserState)? setStateCallback;
  UserState(
      {this.userId,
      this.userInfo = const UserInfo(),
      required this.setStateCallback})
      : isOwner = isAccountOwner(userId, Plugins.antiFakeBookStore!.state);

  void getUserInfo(BuildContext context,
      {Function(UserState)? callback}) async {
    // final response =
    //     await ApiModel.api.getUserInfo(GetUserInfoRequest(userId: userId));
    // final newState = UserState(
    //     userId: userId, userInfo: UserInfo.fromJson(response.data.toJson()));
    // callback?.call(newState);
    final request = GetUserInfoRequest(userId: userId);
    if (isOwner) {
      Plugins.antiFakeBookStore!
          .dispatch(GetUserInfoAction(data: request, context: context));
    } else {
      callAPI(context, () async {
        final response = await ApiModel.api.getUserInfo(request);
        final newState = UserState(
            userId: userId,
            userInfo: UserInfo.fromJson(response.data.toJson()),
            setStateCallback: setStateCallback);
        setStateCallback?.call(newState);
      });
    }
  }
}

class PostState {
  final String? userId;
  final List<EachPostPayloadDTO> posts;
  final Function(PostState)? setStateCallback;
  const PostState(
      {this.posts = const [],
      required this.userId,
      required this.setStateCallback});

  void getInitialPosts(BuildContext context) async {
    final request = GetListPostsRequest(
        index: 0, count: NUM_QUERY_PER_REQUEST, userId: userId);
    callAPI(context, () async {
      final response = await ApiModel.api.getListPosts(request);
      final newState = PostState(
          posts: response.data.post,
          setStateCallback: setStateCallback,
          userId: userId);
      setStateCallback?.call(newState);
    });
  }

  void loadMorePosts(BuildContext context) async {
    final request = GetListPostsRequest(
        index: posts.length, count: NUM_QUERY_PER_REQUEST, userId: userId);
    callAPI(context, () async {
      final response = await ApiModel.api.getListPosts(request);
      var newPosts = [...posts, ...response.data.post];
      final newState = PostState(
          posts: newPosts, setStateCallback: setStateCallback, userId: userId);
      setStateCallback?.call(newState);
    });
  }

  int get total => posts.length;
}
