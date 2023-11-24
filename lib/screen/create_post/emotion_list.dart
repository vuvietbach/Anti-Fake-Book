//hiện hiển thị danh sách cảm xúc, 2 emotion một hàng
import 'package:anti_fake_book/constants/emotion_list.dart';
import 'package:anti_fake_book/store/actions/index.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/app_bar.dart';
import 'package:anti_fake_book/widgets/common/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class EmotionsList extends StatefulWidget {
  const EmotionsList({super.key});
  @override
  _EmotionsList createState() => _EmotionsList();
}

class _EmotionsList extends State<EmotionsList> {
  final List<List<PostStatus>> emotions = [
    PostStatus.getEmotionList(),
    PostStatus.getActivityList()
  ];

  final title = ['Bạn đang nghĩ gì?', 'Bạn đang làm gì vậy?'];
  final _selectionBorderBottom = const BoxDecoration(
      border: Border(
          bottom: BorderSide(
    color: Colors.blue,
    width: 2,
  )));
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AntiFakeBookState>(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Scaffold(
          appBar: CommonAppBar(context: context, title: title[indexTab]),
          body: Column(children: [
            Row(
              children: [
                Expanded(
                    child: createTextButton(
                  title: 'Cảm xúc',
                  textColor: indexTab == 0 ? Colors.blue : Colors.black,
                  decoration: indexTab == 0 ? _selectionBorderBottom : null,
                  onPressed: () {
                    setState(() {
                      indexTab = 0;
                    });
                  },
                )),
                Expanded(
                    child: createTextButton(
                  textColor: indexTab == 1 ? Colors.blue : Colors.black,
                  decoration: indexTab == 1 ? _selectionBorderBottom : null,
                  title: 'Hoạt động',
                  onPressed: () {
                    setState(() {
                      indexTab = 1;
                    });
                  },
                )),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 5,
                physics: const ScrollPhysics(),
                children: emotions[indexTab]
                    .map((e) => createTextButton(
                          onPressed: () {
                            store.dispatch(SetSelectedPostAction(store
                                .state.postState.selected!
                                .copyWith(status: e.name)));
                            context.pop();
                          },
                          haveBoder: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconData(e.icon, fontFamily: 'MaterialIcons'),
                                color: Colors.black,
                              ),
                              Text(e.name,
                                  style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ]));
    });
  }
}
