import 'package:anti_fake_book/widgets/common/app_bar.dart';
import 'package:anti_fake_book/widgets/common/app_drop_down_menu.dart';
import 'package:anti_fake_book/widgets/common/app_list_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class NotificationSetting extends StatelessWidget {
  Map<String, bool> notificationSetting = {};
  setNotificationSetting(String key) {
    return (bool value) {
      notificationSetting[key] = value;
    };
  }

  getNotificationSetting(String key) {
    return notificationSetting[key] ?? false;
  }

  NotificationSetting({Key? key}) : super(key: key);
  List<CommonListTileContent> listTypeNotifications = [
    CommonListTileContent(
        icon: const Icon(CupertinoIcons.chat_bubble),
        title: "Bình luận",
        description: "Bình luận về bài viết của bạn",
        key: "notification"),
    CommonListTileContent(
        icon: const Icon(Icons.people),
        title: "Từ bạn bè",
        description: "Bài viết từ bạn bè",
        key: "from_friends"),
    CommonListTileContent(
        icon: const Icon(CupertinoIcons.person_crop_circle_fill_badge_plus),
        title: "Lời mời kết bạn",
        description: "Lời mời kết bạn",
        key: "requested_friend"),
    CommonListTileContent(
        icon: const Icon(CupertinoIcons.person_crop_rectangle),
        title: "Những người bạn có thể biết",
        description: "Những người bạn có thể biết",
        key: "suggested_friend"),
    CommonListTileContent(
        icon: const Icon(Icons.cake), title: "Sinh nhật", key: "birthday"),
    CommonListTileContent(
        icon: const Icon(Icons.video_collection_outlined),
        title: "video",
        key: "video"),
    CommonListTileContent(
        icon: const Icon(Icons.report), title: "Khiếu nại", key: "report"),
  ];
  List<CommonListTileContent> settingNotification = [
    CommonListTileContent(
        icon: const Icon(Icons.note),
        title: "Thông báo đẩy",
        description: 'Thông báo đẩy',
        key: "notification_on"),
    CommonListTileContent(
        icon: const Icon(Icons.vibration),
        title: "Đèn thông báo",
        description: "Bật đèn thông báo khi có thông báo tới",
        key: "led_on"),
    CommonListTileContent(
        icon: const Icon(CupertinoIcons.speaker_1_fill),
        title: "Âm thanh",
        description: "Phát âm tanh khi có thông báo tới",
        key: "sound_on"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: 'Thông báo',
          context: context,
          onPressedLeading: () {
            print(notificationSetting);
            context.pop();
          }),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            AppDropdownMenu(
                title: 'Chọn loại thông báo bạn muốn nhận',
                isShowLeading: false,
                children: [
                  const Divider(),
                  ...listTypeNotifications
                      .map((e) => CommonListTitle(
                            content: e,
                            onChanged: setNotificationSetting(e.key),
                            initValue: getNotificationSetting(e.key),
                          ))
                      .toList(),
                ]),
            AppDropdownMenu(
                title: 'Cài đặt thông báo',
                isShowLeading: false,
                children: [
                  const Divider(),
                  ...settingNotification
                      .map((e) => CommonListTitle(
                            content: e,
                            onChanged: setNotificationSetting(e.key),
                            initValue: getNotificationSetting(e.key),
                          ))
                      .toList(),
                ]),
          ],
        ),
      ),
    );
  }
}
