import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import '../news_feed_tab.dart';
import 'dart:ui';

class DetailedPost extends StatefulWidget {
  final Post post;

  // Constructor with postId parameter
  const DetailedPost({required this.post, Key? key}) : super(key: key);

  @override
  _DetailedPostState createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
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
      return millionCount.toStringAsFixed(1) + 'M';
    } else if (count >= 1000) {
      double thousandCount = count / 1000.0;
      return thousandCount.toStringAsFixed(1) + 'K';
    } else {
      return count.toString();
    }
  }

  GlobalKey _menuButtonKeys = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.post.userName,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              // You can access the widget's postId using widget.postId
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.deepPurple,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.post.userName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${widget.post.timeAgo} • ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Icon(
                                  Icons.public_rounded,
                                  size: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          key: _menuButtonKeys,
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {
                            final RenderBox buttonBox = _menuButtonKeys
                                .currentContext
                                ?.findRenderObject() as RenderBox;
                            final Offset offset =
                                buttonBox.localToGlobal(Offset.zero);

                            final Size screenSize =
                                window.physicalSize / window.devicePixelRatio;
                            final double menuHeight = menuOptions.length * 56.0;

                            showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                offset.dx,
                                screenSize.height - menuHeight,
                                offset.dx + buttonBox.size.width,
                                screenSize.height,
                              ),
                              items: menuOptions.map((option) {
                                return PopupMenuItem(
                                  value: option['title'],
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    leading: Icon(option['icon']),
                                    title: Text(option['title']),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Post content (text)
                    RichText(
                      text: TextSpan(children: widget.post.displayedText),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.thumb_up, color: Colors.blue),
                            SizedBox(width: 5),
                            Text(
                              'Kudos: ${formatCount(widget.post.kudosCount)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.comment, color: Colors.green),
                            SizedBox(width: 5),
                            Text(
                              'Comments: ${formatCount(widget.post.commentCount)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.thumb_down, color: Colors.red),
                            SizedBox(width: 5),
                            Text(
                              'Disappointed: ${formatCount(widget.post.disappointedCount)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Comment Count Section
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: widget.post.imageURL.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, imageIndex) {
                        // Determine the layout based on the number of images
                        if (widget.post.imageURL.length == 1) {
                          // If there's only one image, display it in one line
                          return Image.asset(
                            widget.post.imageURL[imageIndex],
                            fit: BoxFit.cover,
                          );
                        } else if (widget.post.imageURL.length == 2) {
                          // If there are two images, display them in two lines, one each
                          return Image.asset(
                            widget.post.imageURL[imageIndex],
                            fit: BoxFit.cover,
                          );
                        } else if (widget.post.imageURL.length == 3) {
                          if (imageIndex == 0) {
                            return Image.asset(
                              widget.post.imageURL[imageIndex],
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Image.asset(
                              widget.post.imageURL[imageIndex],
                              fit: BoxFit.cover,
                            );
                          }
                        } else if (widget.post.imageURL.length == 4) {
                          return Image.asset(
                            widget.post.imageURL[imageIndex],
                            fit: BoxFit.cover,
                          );
                        }
                        return Container(); // Return an empty container for other cases
                      },
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: FlickVideoPlayer(
                        flickManager: widget.post.currentFlickManager,
                      ),
                    )
                    // Add additional content
                  ],
                ),
              )),
        ));
  }
}
