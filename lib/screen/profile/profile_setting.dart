import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/screen/profile/redux_actions.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:anti_fake_book/screen/search_page/profile_search_page.dart';
import 'package:anti_fake_book/store/actions/block.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class ProfileSettingPage extends StatelessWidget {
  final UserState userState;
  const ProfileSettingPage({super.key, required this.userState});

  void _copyLink(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('Copied to clipboard!')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
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
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0, // Set the background color to white
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomDivider(),
          firstOption(context),
          Option(
              callback: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ProfileSearchPage(userState: userState);
                  })),
              icon: const Icon(Icons.search),
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
                Text(store.state.userState.userInfo.link,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                OutlinedButton(
                    onPressed: () =>
                        _copyLink(context, store.state.userState.userInfo.link),
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
    });
  }

  Widget firstOption(BuildContext context) {
    Store<AntiFakeBookState> store =
        StoreProvider.of<AntiFakeBookState>(context);
    bool isOwner = isAccountOwner(userState.userInfo.id, store.state);
    return isOwner
        ? Option(
            callback: () => context.go("/change_profile_setting"),
            icon: const Icon(Icons.edit),
            title: "Chỉnh sửa trang cá nhân",
          )
        : Option(
            icon: const Icon(Icons.block),
            title: "chặn",
            callback: () => _blockUser(context));
  }

  void _blockUser(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Chặn ${userState.userInfo.username}"),
            // content: Text("Chặn ${info.username}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Đóng")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Plugins.antiFakeBookStore!.dispatch(SetBlockAction(
                        userState.userInfo.id, true, {'context': context}));
                  },
                  child: const Text("Xác nhận"))
            ],
          );
        });
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
  final Function? callback;
  const Option(
      {super.key, required this.icon, required this.title, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback as void Function()?,
      highlightColor: Colors.grey.withOpacity(0.2),
      child: ListTile(
          leading: icon,
          title: Text(title),
          shape: Border(
              bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ))),
    );
  }
}
