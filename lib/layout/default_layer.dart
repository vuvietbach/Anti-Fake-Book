import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/screen/welcome_screen.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class EmptyLayout extends StatefulWidget {
  final Widget? child;

  const EmptyLayout({super.key, this.child});

  @override
  EmptyLayoutState createState() => EmptyLayoutState();
}

class EmptyLayoutState extends State<EmptyLayout> {
  bool isLoading = false;

  touchLoading(bool value) {
    setState(() {
      isLoading = !isLoading;
    });
  }

  static EmptyLayoutState of(BuildContext context) =>
      context.findAncestorStateOfType<EmptyLayoutState>()!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          // FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.child!,
            // màu nền CircularProgressIndicator trong suốt nhìn thấy widget ở dưới
            //
            if (isLoading)
              const CircularProgressIndicator(
                backgroundColor: Colors.transparent,
              )
          ],
        ),
      ), // Thêm widget con vào đây
    );
  }
}

class CheckLoginWrapper extends StatelessWidget {
  final Widget child;
  const CheckLoginWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      print(store.state.userState.email);
      bool login = isLogin(store.state);
      if (!login) {
        return const WelcomeScreen();
      } else {
        return child;
      }
    });
  }
}
