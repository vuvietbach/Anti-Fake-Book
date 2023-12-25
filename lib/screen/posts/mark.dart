import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/widgets/common/app_bar.dart';
import 'package:anti_fake_book/widgets/posts/comment.dart';
import 'package:flutter/material.dart';

class MarkPostScreenWidget extends StatefulWidget {
  String postId;

  MarkPostScreenWidget({Key? key, required this.postId}) : super(key: key);

  @override
  _MarkPostScreenWidgetState createState() => _MarkPostScreenWidgetState();
}

class _MarkPostScreenWidgetState extends State<MarkPostScreenWidget> {
  List<MarkCommentResponse> comments = [];
  bool isLoadMore = true;
  int indexLoad = 0;
  bool isError = false;
  String content = '';
  @override
  void initState() {
    super.initState();
    GetMarkCommentResponseDto? loadcomments;
    ApiModel()
        .getMarkComment(GetMarkCommentRequestDto(id: widget.postId))
        .then((value) {
      setState(() {
        comments = value.data;
        //fake comments have 20 elements
        // comments = List.generate(20, (index) => MarkCommentResponse());
      });
    }).catchError((e) {
      print(e);
      setState(() {
        isError = true;
      });
    });
  }

  @override
//tôi muốn Statefulwidget có animation hiện từ dưới lên
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Bình luận',
        context: context,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  //tạo ra 10 phần tử ngẫu nhiên
                  children: comments.map((e) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: CommentPostWidget(
                    isKudos: e.typeOfMark == '0',
                    created: e.created,
                    username: e.poster.name,
                    avatar: e.poster.avatar,
                    content: e.markContent,
                  ),
                );
              }).toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
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
                    onPressed: () {
                      ApiModel()
                          .setMarkComment(SetMarkCommentRequest(
                              id: widget.postId, content: content))
                          .then((value) {
                        setState(() {
                          comments = value.data;
                          //clear textfield after send comment
                          content = '';
                          //fake comments have 20 elements
                          // comments = List.generate(20, (index) => MarkCommentResponse());
                        });
                      }).catchError((e) {
                        print(e);
                        setState(() {
                          isError = true;
                        });
                      });
                    },
                    icon: const Icon(Icons.send),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
