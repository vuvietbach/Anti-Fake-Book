import 'package:anti_fake_book/screen/profile/widgets.dart';
import 'package:anti_fake_book/store/state/app.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChatPartnerInfoPage extends StatefulWidget {
  const ChatPartnerInfoPage({super.key});

  @override
  State<ChatPartnerInfoPage> createState() => _ChatPartnerInfoPageState();
}

class _ChatPartnerInfoPageState extends State<ChatPartnerInfoPage> {
  final imageUrl =
      "https://images.rawpixel.com/image_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNF9pbGx1c3RyYXRpb25fb2ZfYV9sYWJyYWRvcl9mdWxsX2JvZHlfc2l0dGluZ19kN2E1NjhkMS01MTBjLTRjMjktYTRmNS04YzExYTNlYmJkOTZfMS5qcGc.jpg";

  Widget _popupMenu(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: const Text("Xoá cuộc trò chuyện"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Xoá cuộc trò chuyện"),
                      content: const Text(
                          "Bạn có chắc chắn muốn xoá cuộc trò chuyện này? Thao tác này không thể hoàn tác."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Huỷ")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Xoá"))
                      ],
                    );
                  });
            },
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [_popupMenu(context), const SizedBox(width: 10.0)]),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            _avatar(store),
            _username(store),
            _taskButtonRow(),
            _optionBlock(),
          ],
        ),
      );
    });
  }

  Widget _avatar(Store<AntiFakeBookState> store) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AvatarImage(
        imageUrl: store.state.userState.searchedUserInfo.avatar,
      ),
    );
  }

  Widget _username(Store<AntiFakeBookState> store) {
    return Align(
      alignment: Alignment.center,
      child: Text(store.state.userState.searchedUserInfo.username,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
    );
  }

  Widget _taskButton(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }

  Widget _taskButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _taskButton(Icons.phone, "Âm thanh"),
        _taskButton(Icons.video_call, "Video"),
        _taskButton(Icons.person, "Trang cá nhân"),
        _taskButton(Icons.notifications, "Tắt"),
      ],
    );
  }

  Widget _optionBlock() {
    return ListTile(
      title: const Text("Chặn"),
      onTap: () {},
    );
  }
}
