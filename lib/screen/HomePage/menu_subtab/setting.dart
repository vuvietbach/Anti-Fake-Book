import 'package:anti_fake_book/widgets/common/app_drop_down_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: const TextField(
              //bo tròn viền, giảm chiều rộng
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 3),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
          child: Wrap(
        children: [
          AppDropdownMenu(
            title: 'Cài đặt tài khoản',
            isShowLeading: false,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                    'Quản lý thông tin về bạn, các khoản thanh toán, danh bạ và tài khoản nói chung'),
              ),
              AppDropdownMenu(
                title: 'Thông tin cá nhân',
                onPressed: () {
                  context.pushNamed('change-name');
                },
                icon: const Icon(
                  CupertinoIcons.person_alt_circle_fill,
                  color: Colors.grey,
                ),
                isShowLeading: false,
              )
            ],
          ),
          AppDropdownMenu(
            title: 'Bảo mật',
            isShowLeading: false,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                    'Đổi mật khẩu và các thao tác tăng tính bảo mật cho bài khoản của bạn'),
              ),
              AppDropdownMenu(
                title: 'Đổi mật khẩu',
                onPressed: () {
                  context.go('/setting/change-password');
                },
                icon: const Icon(
                  CupertinoIcons.shield_fill,
                  color: Colors.grey,
                ),
                isShowLeading: false,
              )
            ],
          ),
          AppDropdownMenu(
            title: 'Quyền riêng tư',
            isShowLeading: false,
            children: [
              AppDropdownMenu(
                title: 'Chặn',
                onPressed: () {
                  context.go('/setting/block-user');
                },
                icon: const Icon(
                  CupertinoIcons.xmark_circle,
                  color: Colors.grey,
                ),
                isShowLeading: false,
              ),
            ],
          ),
          AppDropdownMenu(
            title: 'Cài đặt thông báo',
            icon: const Icon(
              CupertinoIcons.bell,
              color: Colors.grey,
            ),
            onPressed: () {
              context.go('/setting/notification');
            },
            isShowLeading: false,
          ),
        ],
      )),
    );
  }
}
