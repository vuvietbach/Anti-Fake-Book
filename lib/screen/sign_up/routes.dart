import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/auth.dto.dart';
import 'package:anti_fake_book/screen/sign_up/redux_actions.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

import 'sign_up.dart';

final GoRoute signUpRoutes = GoRoute(
  path: 'sign-up',
  builder: (BuildContext context, GoRouterState state) {
    return const EmptyLayout(child: SignUp());
  },
);

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _email;
  String? _password;
  late String deviceId;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    getDeviceId().then((value) => deviceId = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_pageController.page == 0) {
                Navigator.of(context).pop();
              } else {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }
            },
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            physics:
                const NeverScrollableScrollPhysics(), // allowImplicitScrolling: false,
            controller: _pageController,
            children: [
              BeginSignUp(
                pageController: _pageController,
              ),
              SignUpName(
                pageController: _pageController,
              ),
              SignUpAge(
                pageController: _pageController,
              ),
              SignUpEmail(
                initialValue: _email,
                onSave: (String? email) {
                  setState(() {
                    _email = email;
                  });
                },
                pageController: _pageController,
              ),
              SignUpPassword(
                initialValue: _password,
                onSave: (String? password) {
                  setState(() {
                    _password = password;
                  });
                },
                pageController: _pageController,
              ),
              _policyScreen(),
            ],
          ),
        ));
  }

  Widget _policyScreen() {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return PolicyScreen(
        onConfirm: () async {
          signUp(
            context,
            SignUpRequest(
                email: _email!,
                password: _password!,
                uuid: await getDeviceId()),
          );
        },
        pageController: _pageController,
      );
    });
  }
}
