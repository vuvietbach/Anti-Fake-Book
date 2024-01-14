import 'package:anti_fake_book/constants/post.dart';
import 'package:anti_fake_book/widgets/common/app_bar.dart';
import 'package:anti_fake_book/widgets/posts/list_oval_choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportPostScreenWidget extends StatefulWidget {
  const ReportPostScreenWidget({super.key});
  @override
  State<StatefulWidget> createState() => _ReportPostScreenStage();
  static _ReportPostScreenStage of(BuildContext context) =>
      context.findAncestorStateOfType<_ReportPostScreenStage>()!;
}

class _ReportPostScreenStage extends State<ReportPostScreenWidget> {
  final List<String> listSelected = [];
  onAddItem(String item) {
    setState(() {
      listSelected.add(item);
    });
  }

  onRemoveItem(String item) {
    setState(() {
      listSelected.remove(item);
    });
  }

  final EdgeInsets paddingEachItem = const EdgeInsets.only(bottom: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          context: context,
          title: 'Báo cáo bài viết',
          actions: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.close))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 18, color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vui lòng chọn vấn đề để tiếp tục',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  'Bạn có thể báo cáo vài viết sau khi chọn vấn đề',
                  style: TextStyle(color: Colors.grey),
                ),
                const ListOvalChoice(labels: reportType),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Nếu bạn nhận thấy ai đó đang gặp nguy hiểm, đừng chần chừ mà hãy gọi cấp cứu tại địa phương',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: listSelected.length > 0
                        ? () {
                            context.push(
                                '${GoRouterState.of(context).uri}/confirm',
                                extra: listSelected);
                          }
                        : null,
                    child: const Text('Tiếp'),
                  ),
                )
              ]
                  .map((e) => Padding(
                        padding: paddingEachItem,
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
