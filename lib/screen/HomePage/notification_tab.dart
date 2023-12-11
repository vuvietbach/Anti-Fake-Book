import 'package:anti_fake_book/models/base_apis/dto/response/get_notification.dto.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NotificationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
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
                title: 'Gần đây',
                listNotifications:
                    List.generate(1, (index) => NotificationPayloadDto())
                        .toList()),
            BlockListNotification(
                title: 'Trước đây',
                listNotifications:
                    List.generate(1, (index) => NotificationPayloadDto())
                        .toList()),
          ]),
        ),
      ));
    });
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

class NotificationWidget extends StatelessWidget {
  final NotificationPayloadDto notification;
  const NotificationWidget({super.key, required this.notification});
  @override
  Widget build(BuildContext context) {
    // tạo ra 1 plaeholder có độ dài là toàn màn hình, chiều cao là 30
    return Row(children: [
      ClipOval(
        child: Container(
          width: 80,
          height: 80,
          child: CachedImageWidget(
            url: notification.avatar,
          ),
        ),
      ),
      const Expanded(
          child: Placeholder(
        fallbackHeight: 100,
      ))
    ]);
  }
}
