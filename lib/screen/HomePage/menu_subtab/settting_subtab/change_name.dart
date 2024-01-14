import 'package:anti_fake_book/widgets/common/app_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeNameScreen extends StatelessWidget {
  String? familyName;
  String? middleName;
  String? firstName;
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
              title: 'Tên',
              isShowLeading: false,
              onPressed: null,
              children: [
            ...['Họ', 'Tên đệm', 'Tên']
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: e,
                          border: const OutlineInputBorder(gapPadding: 10),
                        ),
                        onChanged: (value) {
                          if (e == 'Họ') {
                            familyName = value;
                          } else if (e == 'Tên đệm') {
                            middleName = value;
                          } else {
                            firstName = value;
                          }
                        },
                      ),
                    ))
                .toList(),
            //Text có chữ xin lưu ý là in đậm, còn lại là bình thường
            const Text('Xin lưu ý:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // chữ căn giữa
            const Text(
                'Nếu thay đổi tên thì bạn không thể thay đổi trong 60 ngày. Đừng có mà thêm các kí tự khác thường, kí tự dặc biệt',
                textAlign: TextAlign.center),
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
                ))
          ])),
    );
  }
}
