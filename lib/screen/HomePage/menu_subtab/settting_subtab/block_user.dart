import 'package:anti_fake_book/global_type/user/user_summary.entity.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:anti_fake_book/store/actions/block.dart';
import 'package:anti_fake_book/store/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/app_bar.dart';
import 'package:anti_fake_book/widgets/common/app_drop_down_menu.dart';
import 'package:anti_fake_book/widgets/common/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class BlockUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Chặn',
        context: context,
      ),
      body: Center(
          child: AppDropdownMenu(
        childPadding: 15,
        title: 'Người bị chặn',
        isShowLeading: false,
        children: [
          const Text(
              'Một khi bạn đã chặn ai đó, họ sẽ không xem được nội dung bạn tự đăng trên dòng thời gian mình, gắn thẻ bạn, mời bạn tham gia sự kiện hoặc nhóm, bắt đầu cuộc trò chuyện với bạn hay thêm bạn làm bạn bè. Điều này không bao gồm các ứng dụng, trò chơi hay nhóm mà cả bạn và người này đều tham gia.'),
          GestureDetector(
            onTap: () {
              Plugins.antiFakeBookStore!
                  .dispatch(SetBlockAction('12', true, {'context': context}));
            },
            child: _RowBlockUser(
              title: 'Thêm vào danh sách chặn',
              textColor: Colors.blue,
            ),
          ),
          StoreBuilder(onInit: (store) {
            store.dispatch(GetListBlocksAction(0, 5, {'context': context}));
          }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
            return ListBlockUsers(
              store: store,
            );
          })
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class ListBlockUsers extends StatelessWidget {
  Store<AntiFakeBookState> store;
  ListBlockUsers({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: store.state.userState.blocks
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(),
                child: _RowBlockUser(
                  title: e.name,
                  leading: CachedImageWidget(url: e.avatar),
                  action: TextButton(
                    child: const Text('Bỏ chặn'),
                    onPressed: () {
                      Plugins.antiFakeBookStore!.dispatch(
                          SetBlockAction(e.id, false, {'context': context}));
                    },
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _RowBlockUser extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Color textColor;
  final Widget? action;
  _RowBlockUser(
      {this.action,
      this.leading,
      required this.title,
      this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 50,
                height: 50,
                child: leading == null
                    ? const Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    : leading!,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: textColor),
              )
            ],
          ),
          if (action != null) action!
        ],
      ),
    );
  }
}
