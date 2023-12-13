import 'package:anti_fake_book/constants/common/color_config.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

class HomeFake extends StatelessWidget {
  const HomeFake({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Green Button Demo',
        theme: ThemeData(
          primaryColor: lightBlueColor, // Màu chủ đạo
        ),
        home: StoreConnector<AntiFakeBookState, _View>(
            converter: (store) => _View('f', () {
                  store.dispatch('');
                }),
            builder: (BuildContext context, _View vm) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(vm.state),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      vm.onClick();
                    },
                    child: const Text(
                      'Đăng bài',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                floatingActionButton: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/post/1/report');
                    },
                    child: const Text(
                      'next',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

class _View {
  final String state;
  final void Function() onClick;
  _View(this.state, this.onClick);
}
