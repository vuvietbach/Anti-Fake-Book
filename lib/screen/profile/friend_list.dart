import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key, this.userId, required this.username});
  final String? userId;
  final String username;

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  late FriendState friendState;
  bool isOwner = false;
  @override
  void initState() {
    super.initState();
    friendState = FriendState(userId: widget.userId);
  }

  void _unfriend(BuildContext context, String userId) {
    friendState.unfriend(context, userId, callback: (FriendState state) {
      setState(() {
        friendState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      friendState.loadMore(context, isFirstTime: true,
          callback: (FriendState state) {
        setState(() {
          friendState = state;
        });
      });
      setState(() {
        isOwner = isAccountOwner(widget.userId, store.state);
      });
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(color: Colors.black, Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Quay lại màn hình trước đó
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
              const CustomSearchBar(),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: friendState.friends.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _numFriendText(friendState.total);
                  } else {
                    return FriendListTile(
                        info: friendState.friends[index - 1],
                        isOwnersFriend: isOwner,
                        onUnfriend: (String userId) =>
                            _unfriend(context, userId));
                  }
                },
              ))
            ]),
          ));
    });
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

class FriendListTile extends StatelessWidget {
  const FriendListTile(
      {super.key,
      required this.info,
      required this.isOwnersFriend,
      this.onUnfriend});
  final Friend info;
  final bool isOwnersFriend;
  final Function(String userId)? onUnfriend;

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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return FriendListPage(userId: info.id, username: info.username);
    }));
  }

  void _showProfile(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProfilePage(userId: info.id);
    }));
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
                                onTap: () => {},
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
