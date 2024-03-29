import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/screen/profile/redux_actions.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:anti_fake_book/screen/profile/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class FriendListPage extends StatelessWidget {
  final String? userId;
  final String username;
  const FriendListPage({super.key, this.userId, required this.username});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      bool isOwner = isAccountOwner(userId, store.state);
      if (!isOwner) {
        return OtherFriendListPage(userId: userId, username: username);
      } else {
        return const MyFriendListPage();
      }
    });
  }
}

class MyFriendListPage extends StatelessWidget {
  const MyFriendListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      getUserFriends(context,
          GetUserFriendsRequest(index: 0, count: NUM_QUERY_PER_REQUEST));
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      final friends = store.state.friendState.userFriends;
      final total = store.state.friendState.userTotalNumFriend;
      final username = store.state.userState.userInfo.username;
      return FriendListUI(
          friendState: FriendState(
              userId: null,
              friends: friends,
              total: total,
              setStateCallback: null),
          username: username,
          isOwner: true);
    });
  }
}

class OtherFriendListPage extends StatefulWidget {
  const OtherFriendListPage({super.key, this.userId, required this.username});
  final String? userId;
  final String username;

  @override
  State<OtherFriendListPage> createState() => _OtherFriendListPageState();
}

class _OtherFriendListPageState extends State<OtherFriendListPage> {
  late FriendState friendState;
  bool isOwner = false;
  @override
  void initState() {
    super.initState();
    friendState = FriendState(
        userId: widget.userId,
        setStateCallback: (FriendState state) {
          setState(() {
            friendState = state;
          });
        });
    friendState.getInitialFriends(context);
  }

  // void _unfriend(BuildContext context, String userId) {
  //   friendState.unfriend(context, userId, callback: (FriendState state) {
  //     setState(() {
  //       friendState = state;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FriendListUI(
        friendState: friendState, username: widget.username, isOwner: false);
  }
}

class FriendListTile extends StatelessWidget {
  const FriendListTile(
      {super.key,
      required this.info,
      required this.isOwnersFriend,
      this.onUnfriend,
      this.onBlockUser});
  final Friend info;
  final bool isOwnersFriend;
  final Function(String userId)? onUnfriend;
  final Function(String userId)? onBlockUser;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      String username = info.username;
      String avatarUrl = info.avatar;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            AvatarImage(
              height: 60.0,
              imageUrl: avatarUrl,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(username,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 19.0)),
            const Spacer(),
            _showOptionButton(context)
          ],
        ),
      );
    });
  }

  void _getUserFriends(BuildContext context) {
    Navigator.pop(context);
    Map<String, dynamic> queryParameters = {};
    queryParameters['userId'] = info.id;
    queryParameters['username'] = info.username;
    var uri = Uri(path: '/friend_list', queryParameters: queryParameters);
    context.push(uri.toString());
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return FriendListPage(userId: info.id, username: info.username);
    // }));
  }

  void _showProfile(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return ProfilePage(userId: info.id);
    // }));
    context.push('/profile/${info.id}');
  }

  void _unfriend(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Xác nhận hủy kết bạn"),
            content: Text("Huỷ kết bạn với ${info.username}}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Đóng")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    onUnfriend?.call(info.id);
                  },
                  child: const Text("Xác nhận"))
            ],
          );
        });
  }

  void _blockUser(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Chặn ${info.username}"),
            // content: Text("Chặn ${info.username}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Đóng")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    onBlockUser?.call(info.id);
                  },
                  child: const Text("Xác nhận"))
            ],
          );
        });
  }

  Widget _showOptionButton(BuildContext context) {
    return Builder(builder: (context) {
      String username = info.username;
      return IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                      child: Column(children: [
                        ListTile(
                          leading: const Icon(Icons.person_add),
                          title: Text("Xem bạn bè của $username"),
                          onTap: () => _getUserFriends(context),
                        ),
                        // ListTile(
                        //   leading: const Icon(Icons.chat),
                        //   title: Text("Nhắn tin cho $username"),
                        //   onTap: () => {},
                        // ),
                        ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: Text("Xem trang cá nhân của $username"),
                          onTap: () => _showProfile(context),
                        ),
                        isOwnersFriend
                            ? ListTile(
                                leading: const Icon(Icons.block),
                                title: Text("Chặn $username"),
                                subtitle: Text(
                                    "$username sẽ không nhìn thấy bạn hoặc liên hệ với bạn trên Anti Fake Book."),
                                onTap: () => _blockUser(context),
                              )
                            : const SizedBox(),
                        isOwnersFriend
                            ? ListTile(
                                leading: const Icon(Icons.person_remove),
                                title: Text("Hủy kết bạn với $username"),
                                subtitle: Text(
                                    "Xóa $username khỏi danh sách bạn bè."),
                                onTap: () => _unfriend(context),
                              )
                            : const SizedBox(),
                      ]),
                    ));
          },
          icon: const Icon(Icons.more_horiz));
    });
  }
}

class FriendListUI extends StatefulWidget {
  const FriendListUI(
      {super.key,
      required this.friendState,
      required this.username,
      required this.isOwner});
  final FriendState friendState;
  final String username;
  final bool isOwner;

  @override
  State<FriendListUI> createState() => _FriendListUIState();
}

class _FriendListUIState extends State<FriendListUI> {
  int selectedOption = 0;
  String searchKeyword = "";

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore(context);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // final Function(String) onSearch;
  void _unfriend(BuildContext context, String userId) {
    widget.friendState.unfriend(context, userId);
  }

  void _loadMore(BuildContext context) {
    if (searchKeyword.isNotEmpty) {
      widget.friendState.loadMoreFriends(context);
    }
  }

  void _blockUser(BuildContext context, String userId) {
    widget.friendState.blockUser(context, userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(color: Colors.black, Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.username,
              style: const TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _options(),
            const SizedBox(
              height: 15.0,
            ),
            CustomSearchBar(
              placeholder: "Tìm kiếm bạn bè",
              searchCallback: (String text) => _searchFriend(text),
              onClear: _clearSearch,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(child: Builder(builder: (context) {
              final friendList = widget.friendState
                  .filterFriends(selectedOption, searchKeyword);
              final displayedNumFriends = (searchKeyword.isEmpty)
                  ? widget.friendState.total
                  : friendList.length;
              return ListView.builder(
                controller: _scrollController,
                itemCount: (friendList.length + 2),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _numFriendText(displayedNumFriends);
                  } else if (index == friendList.length + 1) {
                    // return const BottomProgressIndicator();
                    return const SizedBox();
                  } else {
                    return FriendListTile(
                        info: friendList[index - 1],
                        isOwnersFriend: widget.isOwner,
                        onUnfriend: (String userId) =>
                            _unfriend(context, userId),
                        onBlockUser: (String userId) =>
                            _blockUser(context, userId));
                  }
                },
              );
            }))
          ]),
        ));
  }

  Row _options() {
    return Row(
      children: [
        ChipButton(
          text: "Tất cả",
          isSelected: (selectedOption == 0),
          onPressed: () => _handleSelectOption(0),
        ),
        const SizedBox(
          width: 10.0,
        ),
        ChipButton(
          text: "Gần đây",
          isSelected: (selectedOption == 1),
          onPressed: () => _handleSelectOption(1),
        )
      ],
    );
  }

  void _handleSelectOption(int index) {
    setState(() {
      selectedOption = index;
    });
    // if (index == 0) {
    //   setState(() {
    //     friendList = widget.friendState.alphabeticalFriends;
    //   });
    // } else {
    //   setState(() {
    //     friendList = widget.friendState.recentFriends;
    //   });
    // }
  }

  void _searchFriend(String text) {
    // if (text.isEmpty) {
    //   setState(() {
    //     displayedFriends = friendList;
    //   });
    // }
    // setState(() {
    //   displayedFriends = friendList
    //       .where((friend) =>
    //           friend.username.toLowerCase().contains(text.toLowerCase()))
    //       .toList();
    // });
    setState(() {
      searchKeyword = text;
    });
  }

  void _clearSearch() {
    setState(() {
      searchKeyword = "";
    });
    // setState(() {
    //   displayedFriends = friendList;
    // });
  }

  Widget _numFriendText(int numFriend) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        "$numFriend người bạn",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}

class BottomProgressIndicator extends StatelessWidget {
  const BottomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
