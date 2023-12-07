import 'package:anti_fake_book/widgets/common/divider.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(color: Colors.black, Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
          },
        ),
        title: const Text(
          "Cài đặt trang cá nhân",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Set the background color to white
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomDivider(),
        const Option(
          path: "/profile/setting/change_setting",
          icon: Icon(Icons.edit),
          title: "Chỉnh sửa trang cá nhân",
        ),
        const CustomDivider(),
        const Option(
            path: "/profile/setting/search",
            icon: Icon(Icons.search),
            title: "Tìm kiếm trên trang cá nhân"),
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Liên kết đến trang cá nhân của bạn",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text("Liên kết của riêng bạn trên Anti Fake Book"),
              const Divider(
                height: 10.0,
                thickness: 1.0,
              ),
              const Text("/profile",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      overlayColor: getColor(Colors.grey.withOpacity(0.2))),
                  child: const Text(
                    "SAO CHÉP LIÊN KẾT",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

MaterialStateProperty<Color> getColor(Color colorPressed) {
  getColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    }
    return Colors.transparent;
  }

  return MaterialStateProperty.resolveWith(getColor);
}

class Option extends StatelessWidget {
  final Widget icon;
  final String title;
  final String path;
  const Option(
      {super.key, required this.icon, required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(path),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: ListTile(
        leading: icon,
        title: Text(title),
      ),
    );
  }
}