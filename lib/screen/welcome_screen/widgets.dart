import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class SigninOption extends StatelessWidget {
  final String path;
  final String title;
  final IconData icon;
  const SigninOption({
    super.key,
    required this.path,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/sign-in'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1)),
                child: Icon(
                  icon,
                  color: Colors.blue,
                  weight: 10.0,
                )),
            const SizedBox(width: 10.0),
            Text(title,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      if (store.state.userState.userInfo.email == "") {
        return const SizedBox();
      } else {
        final name = store.state.userState.userInfo.username;
        final avatarUrl = store.state.userState.userInfo.avatar;
        return InkWell(
          onTap: () => context.go('/sign-in-with-account'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10),
              child: ListTile(
                leading: AvatarImage(
                  imageUrl: avatarUrl,
                  height: 50.0,
                ),
                title: Text(
                  name,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        child: Text("Gỡ tài khoản khỏi thiết bị")),
                    const PopupMenuItem(child: Text("Tắt thông báo đẩy"))
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
