import 'package:anti_fake_book/screen/profile/change_setting/screens.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChangeSettingPage extends StatelessWidget {
  const ChangeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      // store.dispatch(GetUserInfoAction(
      //   token: store.state.userState.token,
      //   data: GetUserInfoRequest(),
      // ));
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Chỉnh sửa trang cá nhân'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            children: const [
              EditAvatarSection(),
              Divider(
                height: 2.0,
              ),
              EditBackgroundSection(),
              Divider(
                height: 2.0,
              ),
              EditUsernameSection(),
              Divider(
                height: 2.0,
              ),
              EditDescriptionSection(),
              Divider(
                height: 2.0,
              ),
              EditGeneralInfoSection(),
              Divider(
                height: 2.0,
              ),
              EditAccountLinkSection(),
            ],
          ));
    });
  }
}
