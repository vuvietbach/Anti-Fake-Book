import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/screen/profile/redux_actions.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeProfileAfterSignUpPage extends StatefulWidget {
  final String email;
  const ChangeProfileAfterSignUpPage({super.key, required this.email});

  @override
  State<ChangeProfileAfterSignUpPage> createState() =>
      _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfileAfterSignUpPage> {
  String? avatar;
  static String defaultUsername = "Nhập tên người dùng";
  TextEditingController usernameController = TextEditingController();

  Widget _avatar() {
    return AvatarImage(
      height: 170,
      allowEdit: true,
      onImageChanged: _onImageChanged,
    );
  }

  _onImageChanged(String? avatarUrl) {
    setState(() {
      avatar = avatarUrl;
    });
  }

  @override
  void initState() {
    super.initState();
    usernameController.text = defaultUsername;
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  Widget _username() {
    return SizedBox(
      width: 220,
      child: TextField(
        textAlign: TextAlign.center,
        maxLines: 1,
        maxLength: maxUsernameLength,
        controller: usernameController,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _submitButton() {
    return SizedBox(
        width: double.infinity,
        height: 40.0,
        child: ElevatedButton(
            onPressed: () {
              if (validateUsername(usernameController.text, widget.email) &&
                  usernameController.text.compareTo(defaultUsername) != 0) {
                String title = "Lưu thông tin";
                String content =
                    "Bạn có thể thay đổi thông tin cá nhân sau này";
                showConfirmDialog(context, title, content, onConfirm: () {
                  changeProfileAfterSignUp(
                      context,
                      ChangeProfileAfterSignUpRequest(
                          username: usernameController.text, avatar: avatar),
                      onSuccess: () => context.go('/home'));
                });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Tên người dùng không hợp lệ"),
                        content: const Text(
                            "Tên người dùng không được để trống, không được chứa ký tự đặc biệt, độ dài từ 6 đến 30 ký tự, không được trùng với email"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Đóng"))
                        ],
                      );
                    });
              }
            },
            child: const Text("Cập nhập")));
  }

  Widget _backgroundImage() {
    return const CoverImage();
  }

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Cập nhập thông tin"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Column(
                  children: [
                    _backgroundImage(),
                    Container(
                      height: 80,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: _avatar()),
                ),
              ]),
              _username(),
              _submitButton(),
            ],
          )),
    );
  }
}
