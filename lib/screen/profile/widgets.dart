import 'package:anti_fake_book/models/base_apis/dto/response/user_info.dto.dart';
import 'package:anti_fake_book/screen/profile/profile.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class BackgroundImage extends StatelessWidget {
  static const backgroundHeight = 200.0;
  static const photoIconHeight = 40.0;
  final String? imageUrl;
  const BackgroundImage({
    super.key,
    this.imageUrl,
  });
  void _showOptions(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: backgroundHeight,
          decoration: BoxDecoration(
            image: (imageUrl != null && imageUrl!.isNotEmpty)
                ? DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
            color: Colors.grey,
          ),
        ),
        Positioned(
          top: backgroundHeight - 50,
          right: 10.0,
          child: IconButton(
              onPressed: () {
                _showOptions(context);
              },
              icon: const Icon(
                Icons.add_a_photo,
                color: Colors.black,
              )),
        ),
      ],
    );
  }
}

class AvatarImage extends StatelessWidget {
  static const avatarHeight = 100.0;
  static const total_height = 130;
  final String? imageUrl;

  const AvatarImage({
    super.key,
    this.imageUrl,
  });
  void _showOptions(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: avatarHeight,
              width: avatarHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: (imageUrl != null && imageUrl!.isNotEmpty)
                    ? DecorationImage(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage('assets/images/default_avatar.jpeg'),
                        fit: BoxFit.cover),
              ),
            ),
            const Text(
              "Vu Viet Bach",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          right: -5.0,
          child: IconButton(
              onPressed: () {
                _showOptions(context);
              },
              icon: const Icon(
                Icons.add_a_photo,
                color: Colors.black,
              )),
        ),
      ],
    );
  }
}

class AccountImage extends StatelessWidget {
  const AccountImage({
    super.key,
  });

  static const backgroundHeight = 200.0;
  static const photoIconHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      UserInfoData userInfo = store.state.userState.searchedUserInfo;
      return Stack(
        children: [
          Column(
            children: [
              BackgroundImage(
                imageUrl: userInfo.coverImage,
              ),
              Container(
                height: AvatarImage.total_height / 2,
              )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 20,
              child: AvatarImage(
                imageUrl: userInfo.avatar,
              )),
        ],
      );
    });
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

