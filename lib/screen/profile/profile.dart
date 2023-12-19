import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/screen/profile/friend_list.dart';
import 'package:anti_fake_book/screen/profile/profile_setting.dart';
import 'package:anti_fake_book/screen/profile/redux_actions.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:anti_fake_book/screen/profile/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;
  const ProfilePage({super.key, this.userId});
  static const friendCardHeight = 200.0;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserState userState;

  @override
  void initState() {
    super.initState();
    userState = UserState(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      userState.reload(context, callback: (UserState state) {
        setState(() {
          userState = state;
        });
      });
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
          body: ListView(
        children: [
          AccountImage(
            username: userState.userInfo.username,
            avatar: userState.userInfo.avatar,
            coverImage: userState.userInfo.coverImage,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  _mainButton(context),
                  const SizedBox(
                    width: 10.0,
                  ),
                  _profileSettingButton(context),
                ]),
                const Divider(
                  height: 20.0,
                  thickness: 2.0,
                ),
                GeneralInfoSection(
                  city: userState.userInfo.city,
                  country: userState.userInfo.country,
                  address: userState.userInfo.address,
                ),
                const Divider(
                  height: 20.0,
                  thickness: 2.0,
                ),
                FriendSection(
                    userId: widget.userId,
                    username: userState.userInfo.username),
              ],
            ),
          ),
        ],
      ));
    });
  }

  Widget _profileSettingButton(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey)),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileSettingPage(
                    userId: widget.userId,
                  ))),
          child: const Icon(Icons.more_horiz, color: Colors.black)),
    );
  }

  Widget _mainButton(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ElevatedButton(
        onPressed: () => getUserFriends(context, widget.userId, true),
        child:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Thêm vào tin",
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}

class FriendSection extends StatefulWidget {
  final String? userId;
  final String username;
  const FriendSection({
    super.key,
    this.userId,
    required this.username,
  });
  static const maxNumFriend = 6;

  @override
  State<FriendSection> createState() => _FriendSectionState();
}

class _FriendSectionState extends State<FriendSection> {
  late FriendState friendState;
  List<Widget> _recentFriends(List<Friend> friendList) {
    final topFriendList = friendList.sublist(
        0,
        friendList.length > FriendSection.maxNumFriend
            ? FriendSection.maxNumFriend
            : friendList.length);
    return topFriendList.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(userId: e.id)));
        },
        child: FriendCard(
          avatarUrl: e.avatar,
          username: e.username,
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    friendState = FriendState(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (store) {
      friendState.loadMore(context, isFirstTime: true,
          callback: (FriendState state) {
        setState(() {
          friendState = state;
        });
      });
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Bạn bè",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Tìm bạn bè",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          Text(
            '${friendState.total} người bạn',
            style: const TextStyle(color: Colors.grey),
          ),
          GridView.count(
              crossAxisCount: 3,
              controller: ScrollController(keepScrollOffset: false),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.8,
              children: _recentFriends(friendState.friends)),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FriendListPage(
                            userId: widget.userId,
                            username: widget.username,
                          ))),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade200)),
              child: const Text(
                "Xem tất cả bạn bè",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      );
    });
  }
}

class FriendCard extends StatelessWidget {
  final String? avatarUrl;
  final String username;
  const FriendCard({
    super.key,
    this.avatarUrl,
    required this.username,
  });
  Widget _avatar() {
    try {
      if (avatarUrl != null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(avatarUrl!,
              height: 100.0, width: double.infinity, fit: BoxFit.fill),
        );
      }
      throw Exception();
    } catch (e) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset('assets/images/default_avatar.jpeg',
            height: 100.0, width: double.infinity, fit: BoxFit.fill),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_avatar(), const SizedBox(height: 5.0), _username()],
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(username,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold)),
    );
  }
}
