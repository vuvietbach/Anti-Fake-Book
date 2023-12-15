import 'package:anti_fake_book/screen/sign_in/sign_in.dart';
import 'package:anti_fake_book/store/state/index.dart';
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
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignIn(
              onSuccess: (BuildContext context) => context.go("/home")))),
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
      if (store.state.userState.userInfo.username == "") {
        return const SizedBox();
      } else {
        final name = store.state.userState.userInfo.username;
        final avatarUrl = store.state.userState.userInfo.avatar;
        return InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignInWithAccount(
                  onSuccess: (context) => context.go("/home")))),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(avatarUrl),
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
