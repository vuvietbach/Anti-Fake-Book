import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      SignUpState signUpState = ref.watch(signUpStateProvider);
      signUpState.reset();
      return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
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
                  // allowImplicitScrolling: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // allowImplicitScrolling: false,
                  controller: _pageController,
                  children: [
                    // const VerifyAccount(),
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
                      pageController: _pageController,
                    ),
                    SignUpPassword(
                      pageController: _pageController,
                    ),
                    PolicyScreen(
                      pageController: _pageController,
                    ),
                    const VerifyAccount(),
                  ],
                ),
              )));
    });
  }
}
