import 'package:anti_fake_book/widgets/common/app_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatelessWidget {
  String? oldPassword;
  String? newPassword;
  String? repeatPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Tên'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
          child: AppDropdownMenu(
              title: 'Đổi mật khẩu',
              isShowLeading: false,
              onPressed: null,
              children: [
            ...['Mật khẩu hiện tại', 'Mật khẩu mới', 'Nhập lại mật khẩu mới']
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: e,
                          border: const OutlineInputBorder(gapPadding: 10),
                        ),
                        onChanged: (value) {
                          if (e == 'Mật khẩu hiện tại') {
                            oldPassword = value;
                          } else if (e == 'Mật khẩu mới') {
                            newPassword = value;
                          } else {
                            repeatPassword = value;
                          }
                        },
                      ),
                    ))
                .toList(),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 40)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                child: const Text(
                  'Thay đổi',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  context.pop();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 40)),
                ),
                child: const Text(
                  'Huỷ',
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  context.pop();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 40)),
                ),
                //quên mật khẩu có gạch chân chữ
                child: const Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                )),
          ])),
    );
  }
}
