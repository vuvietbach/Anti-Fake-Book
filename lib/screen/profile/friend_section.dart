import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/screen/profile/friend_list.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:flutter/material.dart';

class FriendSection extends StatelessWidget {
  final UserState userState;
  final FriendState friendState;
  static const int maxNumFriend = 6;
  const FriendSection(
      {super.key, required this.friendState, required this.userState});

  List<Widget> _recentFriends(BuildContext context, List<Friend> friendList) {
    final topFriendList = friendList.sublist(
        0, friendList.length > maxNumFriend ? maxNumFriend : friendList.length);
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
  Widget build(BuildContext context) {
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
            children: _recentFriends(context, friendState.friends)),
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
                          userId: userState.userInfo.id,
                          username: userState.userInfo.username,
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
