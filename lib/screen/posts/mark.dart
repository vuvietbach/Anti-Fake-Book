import 'package:anti_fake_book/widgets/posts/comment.dart';
import 'package:flutter/material.dart';

class MarkPostScreenWidget extends StatefulWidget {
  String postId;
  MarkPostScreenWidget({Key? key, required this.postId}) : super(key: key);

  @override
  _MarkPostScreenWidgetState createState() => _MarkPostScreenWidgetState();
}

class _MarkPostScreenWidgetState extends State<MarkPostScreenWidget> {
  int kudos = 0;
  @override
//tôi muốn Statefulwidget có animation hiện từ dưới lên
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bình luận',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 30,
          leading: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(Icons.favorite, color: Colors.red),
              Text(
                kudos.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        ),
        body: ListView(
            //tạo ra 10 phần tử ngẫu nhiên
            children: List.generate(
                    40,
                    (index) =>
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan' +
                        'tuan tuan tuan tuan tuan')
                .map((e) => Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: CommentPostWidget(
                        created: DateTime(2021),
                        username: 'tuan',
                        avatar: 'tuan',
                        content: e,
                      ),
                    ))
                .toList()),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(
                //nền màu xám
                filled: true,
                fillColor: Colors.grey[200],
                // tạo đường viền trên TextField,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.black)),
                hintText: 'Nhập bình luận',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                )),
          ),
        ));
  }
}
