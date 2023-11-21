import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const friendCardHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const AccountImage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vu Viet Bach",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Row(children: [
                Expanded(
                  flex: 8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey)),
                        onPressed: () => context.go('/profile/setting'),
                        child:
                            const Icon(Icons.more_horiz, color: Colors.black))),
              ]),
              const Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              const Column(
                children: [GeneralInfo()],
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
  }
}

class FriendSection extends StatelessWidget {
  const FriendSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Bạn bè",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "Tìm bạn bè",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        const Text(
          "360 nguời bạn",
          style: TextStyle(color: Colors.grey),
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
          height: 15.0,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.go('/profile/friend_list'),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade400)),
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

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.business_center),
        const SizedBox(
          width: 10.0,
        ),
        RichText(
            text: const TextSpan(
                text: "Làm việc tại ",
                style: TextStyle(color: Colors.black),
                children: [
              TextSpan(
                text: "Hà Nội",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]))
      ],
    );
  }
}

class AccountImage extends StatelessWidget {
  const AccountImage({
    super.key,
  });

  static const avatarHeight = 110.0;
  static const backgroundHeight = 200.0;
  static const photoIconHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: backgroundHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: avatarHeight / 2,
            )
          ],
        ),
        Positioned(
            top: backgroundHeight - avatarHeight / 2,
            left: 20,
            child: Container(
              height: avatarHeight,
              width: avatarHeight,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/avatar.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        const Positioned(
          top: backgroundHeight - photoIconHeight,
          right: 10.0,
          child: ChangeBackgroundButton(),
        ),
        const Positioned(
            top: backgroundHeight + avatarHeight / 2 - photoIconHeight,
            left: avatarHeight + 25.0,
            child: ChangeAvatarButton())
      ],
    );
  }
}

class ChangeAvatarButton extends StatelessWidget {
  const ChangeAvatarButton({
    super.key,
  });
  static const photoIconHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {showOptions(context)},
      child: Container(
          height: photoIconHeight,
          width: photoIconHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.add_a_photo, color: Colors.black),
          )),
    );
  }

  void showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 300.0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text("Chọn ảnh đại diện"),
                    onTap: () => {},
                  ),
                ],
              ),
            ));
  }
}

class ChangeBackgroundButton extends StatelessWidget {
  static const photoIconHeight = 40.0;

  const ChangeBackgroundButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {showOptions(context)},
      child: Container(
          height: photoIconHeight,
          width: photoIconHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.add_a_photo, color: Colors.black),
          )),
    );
  }

  void showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 300.0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text("Xem ảnh bìa"),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.upload),
                    title: const Text("Tải ảnh lên"),
                    onTap: () => {},
                  ),
                ],
              ),
            ));
  }
}
