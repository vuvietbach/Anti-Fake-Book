import 'package:anti_fake_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const testAcc = Account(
      name: "Vu Viet Bach",
      avatarUrl:
          "https://t4.ftcdn.net/jpg/05/49/98/39/240_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const SizedBox(
                height: 40,
                child: Image(image: AssetImage('assets/images/logo.jpeg'))),
            const SizedBox(height: 100),
            AccountCard(name: testAcc.name, avatarUrl: testAcc.avatarUrl),
            const SigninOption(
                title: "Đăng nhập bằng tài khoản khác",
                path: "/sign-in",
                icon: Icons.add),
            const SigninOption(
                title: "Tìm tài khoản", path: "/sign-in", icon: Icons.search),
            const Spacer(),
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => context.go('/sign-up'), 
                  child: const Text("Tạo tài khoản mới")),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0, top: 12.0),
              child:
                  Text("Anti Fake Book", style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCreateAccountButton(BuildContext context) {
    return TextButton(
        onPressed: () => context.go('/sign-up'),
        child: const Text("Create Account"));
  }
}

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
      onTap: () => context.go(path),
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
  final String name;
  final String avatarUrl;
  const AccountCard({super.key, required this.name, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go("/sign-in-with-account"),
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
                const PopupMenuItem(child: Text("Gỡ tài khoản khỏi thiết bị")),
                const PopupMenuItem(child: Text("Tắt thông báo đẩy"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
