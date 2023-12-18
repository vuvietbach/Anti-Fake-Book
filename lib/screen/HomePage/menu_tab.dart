import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Menu',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              // màu nều trong suốt
              onPressed: () {
                context.go('/profile');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0)),

              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipOval(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CachedImageWidget(
                      url: store.state.userState.userInfo.avatar,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(store.state.userState.userInfo.username,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const Text('Xem trang cá nhân của bạn',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ],
                )
              ]),
            ),
            WrapperBlockSetting(),
            DropdownMenu(
              title: 'Xem thêm',
              icon: const Icon(
                CupertinoIcons.add,
                color: Colors.amber,
              ),
            ),
            Column(
              //phần từ cuối cùng ở cuối màn hình
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Wrap(
                  children: [
                    DropdownMenu(
                      icon: const Icon(CupertinoIcons.question_circle_fill,
                          color: Colors.cyan),
                      title: 'Trợ giúp và hỗ trợ',
                      children: [
                        DropdownMenu(
                          icon:
                              const Icon(Icons.policy, color: Colors.blueGrey),
                          title: 'Điều khoản và chính sách',
                          isShowLeading: false,
                        )
                      ],
                    ),
                    DropdownMenu(
                      icon: const Icon(CupertinoIcons.gear_alt_fill,
                          color: Colors.cyan),
                      title: 'Cài đặt và quyền riêng tư',
                      children: [
                        DropdownMenu(
                          icon: const Icon(
                              CupertinoIcons.person_alt_circle_fill,
                              color: Colors.blueGrey),
                          title: 'Cài đặt',
                          isShowLeading: false,
                        )
                      ],
                    ),
                  ],
                ),
                DropdownMenu(
                  icon: const Icon(Icons.logout, color: Colors.cyan),
                  title: 'Đăng xuất',
                  isShowLeading: false,
                ),
                DropdownMenu(
                  icon: const Icon(Icons.dangerous, color: Colors.redAccent),
                  title: 'Thoát',
                  isShowLeading: false,
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ]),
        ),
      );
    });
  }
}

class BlockSettingWidget extends StatelessWidget {
  Icon icon;
  String title;
  Widget? subContent;
  BlockSettingWidget(
      {Key? key, required this.icon, required this.title, this.subContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey[100],
      ),
      child: SizedBox(
        // 80% chiều rộng màn hình
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (subContent != null) const SizedBox(height: 10),
            if (subContent != null) subContent!,
          ],
        ),
      ),
    );
  }
}

class WrapperBlockSetting extends StatelessWidget {
  WrapperBlockSetting({Key? key}) : super(key: key);
  final List<BlockSettingWidget> listBlockSetting = [
    BlockSettingWidget(
      icon: const Icon(CupertinoIcons.search_circle, color: Colors.blue),
      title: 'Tìm kiếm bạn bè',
      subContent: const Text('3 mới'),
    ),
    BlockSettingWidget(
      icon: const Icon(CupertinoIcons.timer, color: Colors.blue),
      title: 'Kỉ niệm',
    ),
    BlockSettingWidget(
        icon: const Icon(
          Icons.bookmark,
          color: Colors.purple,
        ),
        title: 'Đã lưu'),
    BlockSettingWidget(
        icon: const Icon(
          CupertinoIcons.game_controller_solid,
          color: Colors.blue,
        ),
        title: 'Trò chơi'),
    BlockSettingWidget(
        icon: const Icon(
          CupertinoIcons.suit_heart_fill,
          color: Colors.pink,
        ),
        title: 'Hẹn Hò'),
    BlockSettingWidget(
        icon: const Icon(
          CupertinoIcons.group_solid,
          color: Colors.blue,
        ),
        title: 'Nhóm'),
    BlockSettingWidget(
      icon: const Icon(
        Icons.video_collection_sharp,
        color: Colors.blueAccent,
      ),
      title: 'Video trên watch',
      subContent: const Text('3 mới'),
    ),
    BlockSettingWidget(
        icon: const Icon(
          Icons.flag,
          color: Colors.amber,
        ),
        title: 'Trang'),
    BlockSettingWidget(
        icon: const Icon(
          Icons.event,
          color: Colors.redAccent,
        ),
        title: 'Sự kiện'),
    BlockSettingWidget(
        icon: const Icon(
          Icons.work,
          color: Colors.brown,
        ),
        title: 'Việc làm'),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 10,
        spacing: 10,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          SizedBox(
              //50% chiều rộng màn hình
              width: MediaQuery.of(context).size.width * 0.45,
              child: Wrap(
                runSpacing: 5,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                //chidren là 1 nửa đầu của listBlockSetting
                children: listBlockSetting
                    .sublist(0, listBlockSetting.length ~/ 2)
                    .toList(),
              )),
          SizedBox(
              //50% chiều rộng màn hình
              width: MediaQuery.of(context).size.width * 0.45,
              child: Wrap(
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                //chidren là 1 nửa đầu của listBlockSetting
                children: listBlockSetting
                    .sublist(listBlockSetting.length ~/ 2)
                    .toList(),
              )),
        ]);
  }
}

class DropdownMenu extends StatefulWidget {
  final Icon? icon;
  final String title;
  final List<Widget> children;
  final Function()? onPressed;
  final bool isShowLeading;
  final Color backgroundColor;
  DropdownMenu(
      {Key? key,
      this.icon,
      required this.title,
      this.children = const [],
      this.isShowLeading = true,
      this.backgroundColor = const Color.fromRGBO(207, 216, 220, 1),
      this.onPressed})
      : super(key: key);
  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.backgroundColor,
      ),
      child: Wrap(
        children: [
          ElevatedButton(
              // ko có màu nền, khi nhấn thì có đường màu đen chạy
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                setState(() {
                  if (widget.onPressed != null) widget.onPressed!();
                  isShow = !isShow;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.icon != null) widget.icon!,
                      if (widget.icon != null) const SizedBox(width: 10),
                      Text(widget.title,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                  if (widget.isShowLeading)
                    Icon(
                        !isShow
                            ? CupertinoIcons.chevron_down
                            : CupertinoIcons.chevron_up,
                        color: Colors.black)
                ],
              )),
          if (isShow)
            Column(
              children: widget.children,
            )
        ],
      ),
    );
  }
}
