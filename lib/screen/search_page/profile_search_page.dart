import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:anti_fake_book/screen/search_page/search_page.dart';
import 'package:anti_fake_book/screen/search_page/states.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:flutter/material.dart';

class ProfileSearchPage extends StatelessWidget {
  final UserState userState;
  const ProfileSearchPage({Key? key, required this.userState})
      : super(key: key);

  void _search(BuildContext context, String text) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultPage(
              keyword: text,
              userId: userState.userInfo.id,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: CustomSearchBar(
                searchCallback: (String text) => _search(context, text)),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    AvatarImage(
                      imageUrl: userState.userInfo.avatar,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Bạn đang tìm gì à",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "Tìm kiếm trên trang cá nhân của ${userState.userInfo.username} để xem bài viết, ảnh và các hoạt động khác",
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
