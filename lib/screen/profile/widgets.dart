import 'dart:io';

import 'package:anti_fake_book/models/base_apis/dto/response/user_info_data.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/store/state/user_info.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux/redux.dart';

class AccountBackgroundImage extends StatelessWidget {
  static const backgroundHeight = 200.0;
  static const photoIconHeight = 40.0;
  final String? imageUrl;
  const AccountBackgroundImage({
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

class AccountAvatar extends StatelessWidget {
  static const avatarHeight = 100.0;
  static const total_height = 130;
  final String? imageUrl;

  const AccountAvatar({
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
    required this.avatar,
    required this.coverImage,
    required this.username,
  });
  final String? coverImage;
  final String? avatar;
  final String username;

  static const backgroundHeight = 200.0;
  static const photoIconHeight = 40.0;

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Column(
            children: [
              BackgroundImage(
                height: 200,
                imageUrl: coverImage,
              ),
              Container(
                height: 90,
              )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    AvatarImage(
                      height: 140,
                      imageUrl: avatar,
                    ),
                    Text(
                      username,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
        ],
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

class BackgroundImage extends StatelessWidget {
  final double height;
  final String? imageUrl;
  final String? imagePath;
  const BackgroundImage({
    super.key,
    this.imageUrl,
    this.imagePath,
    this.height = 100.0,
  });
  DecorationImage? _decorationImage() {
    ImageProvider? image;
    try {
      if (imagePath != null) {
        image = FileImage(File(imagePath!));
      } else if (imageUrl != null) {
        image = NetworkImage(imageUrl!);
      }
    } catch (e) {
      image = null;
    }
    if (image != null) {
      return DecorationImage(
        image: image,
        fit: BoxFit.cover,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: _decorationImage(),
        color: Colors.grey,
      ),
    );
  }
}

class GeneralInfoSection extends StatelessWidget {
  final String? city;
  final String? address;
  final String? country;

  /// userType: 0 is the owner user, 1 is the searched user
  const GeneralInfoSection({super.key, this.city, this.address, this.country});

  @override
  Widget build(BuildContext context) {
  
      return Column(
        children: [
          _item(Icons.work, "Làm việc tại", city),
          _item(Icons.house, "Sống tại", address),
          _item(Icons.location_on, "Đến từ", country)
        ],
      );
  }

  Widget _item(IconData icon, String text, String? mainInfo) => Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10.0,
            ),
            RichText(
                text: TextSpan(
                    text: text,
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                      text: mainInfo,
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ]))
          ],
        ),
      );
}
