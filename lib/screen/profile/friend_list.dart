import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FriendList extends StatelessWidget {
  const FriendList({super.key});

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
        title: const Text("Danh sách bạn bè"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomSearchBar(),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            "360 người bạn",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text("Vu Viet Bach",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              child: Column(children: [
                                ListTile(
                                  leading: const Icon(Icons.person_add),
                                  title:
                                      const Text("Xem bạn bè của Vũ Việt Bách"),
                                  onTap: () => {},
                                ),
                                ListTile(
                                  leading: const Icon(Icons.chat),
                                  title:
                                      const Text("Nhắn tin cho Vũ Việt Bách"),
                                  onTap: () => {},
                                ),
                                ListTile(
                                  leading: const Icon(Icons.account_circle),
                                  title: const Text(
                                      "Xem trang cá nhân của Vũ Việt Bách"),
                                  onTap: () => {},
                                ),
                                ListTile(
                                  leading: const Icon(Icons.block),
                                  title: const Text("Chặn Vũ Việt Bách"),
                                  subtitle: const Text(
                                      "Vũ Việt Bách sẽ không nhìn thấy bạn hoặc liên hệ với bạn trên Anti Fake Book."),
                                  onTap: () => {},
                                ),
                                ListTile(
                                  leading: const Icon(Icons.person_remove),
                                  title: const Text(
                                      "Hủy kết bạn với Vũ Việt Bách"),
                                  subtitle: const Text(
                                      "Xóa Vũ Việt Bách khỏi danh sách bạn bè."),
                                  onTap: () => {},
                                ),
                              ]),
                            ));
                  },
                  icon: const Icon(Icons.more_horiz))
            ],
          )
        ]),
      ),
    );
  }
}
