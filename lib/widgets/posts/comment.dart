import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/widgets/common/cached_image.dart';
import 'package:anti_fake_book/widgets/common/oval_seclection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class CommentPostWidget extends StatefulWidget {
  final String username;
  final String avatar;
  final String content;
  final String created;
  final bool isKudos;

  @override
  CommentPostWidget(
      {super.key,
      required this.username,
      required this.avatar,
      required this.content,
      this.isKudos = false,
      required DateTime created})
      : created = timeAgo(created);

  @override
  _CommentPostState createState() => _CommentPostState(isKudos);
}

class _CommentPostState extends State<CommentPostWidget> {
  late bool isKudos;
  _CommentPostState(this.isKudos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipOval(
            child: SizedBox(
                width: 40,
                height: 40,
                child: CachedImageWidget(url: widget.avatar))),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OvalSelection(
                title: widget.username, label: widget.content, disable: true),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  widget.created,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Trả lời',
                      style: TextStyle(color: Colors.grey),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isKudos = !isKudos;
                      });
                    },
                    child: Text(
                      'is Trust',
                      style: TextStyle(
                          color: isKudos ? Colors.lightBlue : Colors.red),
                    )),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
