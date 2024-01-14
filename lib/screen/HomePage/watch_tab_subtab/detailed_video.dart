import 'package:flutter/material.dart';

import '../watch_tab.dart';

class DetailedVideo extends StatefulWidget {
  final Video post;

  const DetailedVideo({required this.post, Key? key}) : super(key: key);

  @override
  _DetailedVideoState createState() => _DetailedVideoState();
}

class _DetailedVideoState extends State<DetailedVideo> {
  @override
  void initState() {
    super.initState();
    widget.post.displayedText = widget.post.textSpans;
  }

  final List<Map<String, dynamic>> menuOptions = [
    {
      'icon': Icons.notifications_off,
      'title': "Tắt thông báo về bài viết này",
    },
    {
      'icon': Icons.delete,
      'title': "Xóa",
    },
    {
      'icon': Icons.edit,
      'title': "Chỉnh sửa bài viết",
    },
  ];

  String formatCount(int count) {
    if (count >= 1000000) {
      double millionCount = count / 1000000.0;
      return '${millionCount.toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      double thousandCount = count / 1000.0;
      return '${thousandCount.toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.post.userName,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: VideoWidget(post: widget.post, isDetailedPost: true),
        ));
  }
}
