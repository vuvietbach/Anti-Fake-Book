import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/screen/profile/friend_list.dart';
import 'package:anti_fake_book/screen/profile/redux_actions.dart';
import 'package:anti_fake_book/screen/profile/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class ProfilePage extends StatelessWidget {
  final String userId;
  const ProfilePage({super.key, required this.userId});
  static const friendCardHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      getUserInfo(context, GetUserInfoRequest(userId: userId));
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
          body: ListView(
        children: [
          const AccountImage(),
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
                const GeneralInfoSection(
                  userType: 1,
                ),
                const Divider(
                  height: 20.0,
                  thickness: 2.0,
                ),
                const FriendSection(),
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
          onPressed: () => context.go('/profile/setting'),
          child: const Icon(Icons.more_horiz, color: Colors.black)),
    );
  }

  Widget _mainButton(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ElevatedButton(
        onPressed: () =>
            getUserInfo(context, GetUserInfoRequest(userId: userId)),
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
  const FriendSection({
    super.key,
  });

  @override
  State<FriendSection> createState() => _FriendSectionState();
}

class _FriendSectionState extends State<FriendSection> {
  int numFriends = 360;
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
          '$numFriends người bạn',
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
          children: const [
            FriendCard(),
            FriendCard(),
            FriendCard(),
            FriendCard(),
            FriendCard(),
            FriendCard(),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FriendList())),
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
  const FriendCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/avatar.jpeg',
                height: 100.0, fit: BoxFit.fill),
          ),
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text("Vu Viet Bach",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
