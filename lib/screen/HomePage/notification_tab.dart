import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/get_notification.dto.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NotificationContent extends StatefulWidget {
  @override
  NotificationContentState createState() => NotificationContentState();
}

class NotificationContentState extends State<NotificationContent> {
  List<NotificationPayloadDto> listNotifications =
      List.generate(10, (index) => NotificationPayloadDto()).toList();
  List<NotificationPayloadDto> get recentNotifications => listNotifications
      .where((element) => element.created
          .isAfter(DateTime.now().subtract(const Duration(hours: 10))))
      .toList();
  List<NotificationPayloadDto> get oldNotifications => listNotifications
      .where((element) => element.created
          .isBefore(DateTime.now().subtract(const Duration(hours: 10))))
      .toList();

  @override
  void initState() {
    super.initState();
    ApiModel().getNotification(0, 20).then((value) {
      setState(() {
        listNotifications = value.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        print(1);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Thông báo',
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
          BlockListNotification(
              title: 'Gần đây', listNotifications: recentNotifications),
          BlockListNotification(
              title: 'Trước đây', listNotifications: oldNotifications)
        ]),
      ),
    ));
  }
}

class BlockListNotification extends StatelessWidget {
  final String title;
  final List<NotificationPayloadDto> listNotifications;
  const BlockListNotification(
      {super.key, required this.title, required this.listNotifications});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
            ),
            child: Wrap(
                children: listNotifications
                    .map((e) => NotificationWidget(notification: e))
                    .toList()),
          )
        ]);
  }
}

class NotificationWidget extends StatefulWidget {
  final NotificationPayloadDto notification;
  const NotificationWidget({super.key, required this.notification});
  @override
  NotificationWidgetState createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> {
  Map<String, String> get getContent {
    String title = widget.notification.title;
    String content = widget.notification.post?.described ??
        widget.notification.user?.username ??
        widget.notification.title;
    switch (widget.notification.type) {
      case '5':
        {
          title = '$widget.notification.user?.username đã đăng bài';
          content = widget.notification.post?.described ?? '';
          break;
        }
      case '6':
        {
          title = '$widget.notification.user?.username đã bình luận bài viết';
          content = widget.notification.post?.described ?? '';
          break;
        }
      case '1':
        {
          title = '$widget.notification.user?.username đã gửi lời mời kết bạn';
          content = '';
          break;
        }
    }
    return {
      'title': title,
      'content': content,
    };
  }

  @override
  Widget build(BuildContext context) {
    // tạo ra 1 plaeholder có độ dài là toàn màn hình, chiều cao là 30
    return Container(
      color: widget.notification.read == '1' ? Colors.grey[300] : Colors.white,
      child: Row(children: [
        ClipOval(
          child: SizedBox(
            width: 80,
            height: 80,
            child: CachedImageWidget(
              url: widget.notification.avatar,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.notification.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20)),
              Text(getContent['content'] ?? '',
                  style: const TextStyle(color: Colors.black, fontSize: 20)),
              Text(widget.notification.created.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 10)),
            ],
          ),
        ))
      ]),
    );
  }
}
