import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
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
                        if (widget.post.userAvatar != '' &&
                            widget.post.userAvatar != null)
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(widget.post.userAvatar),
                          )
                        else
                          const CircleAvatar(
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
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: widget.post.imageURL.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (contextImage, imageIndex) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              contextImage,
                              MaterialPageRoute(
                                builder: (contextImage) => Scaffold(
                                  body: PhotoViewGallery.builder(
                                    itemCount: widget.post.imageURL.length,
                                    builder: (contextImage, indexImage) {
                                      return PhotoViewGalleryPageOptions(
                                        imageProvider: NetworkImage(
                                          widget.post.imageURL[indexImage],
                                        ),
                                        minScale:
                                            PhotoViewComputedScale.contained,
                                        maxScale:
                                            PhotoViewComputedScale.covered * 2,
                                        initialScale:
                                            PhotoViewComputedScale.contained,
                                        heroAttributes: PhotoViewHeroAttributes(
                                          tag: widget.post.imageURL[indexImage],
                                        ),
                                      );
                                    },
                                    backgroundDecoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    pageController:
                                        PageController(initialPage: imageIndex),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Image.network(
                            widget.post.imageURL[imageIndex],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    widget.post.loadedVideo,
                    Row(
                      children: [
                        Container(width: 5),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: widget.post.is_felt == "0"
                                  ? Colors.blue
                                  : Colors.white,
                              onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                // handleLikeButtonPress(index);
                              });
                            },
                            icon: Icon(
                              Icons.thumb_up,
                              color: widget.post.is_felt == "0"
                                  ? Colors.white
                                  : Colors.blue,
                            ),
                            label: Text(
                              formatCount(widget.post.kudosCount),
                              style: TextStyle(
                                fontSize: 16,
                                color: widget.post.is_felt == "0"
                                    ? Colors.white
                                    : Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Container(width: 5), // 5px-width box
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              // Add functionality for the Comment button
                              // You can navigate to a chat screen or perform any other action
                            },
                            icon: Icon(Icons.message),
                            label: Text(
                              formatCount(widget.post.commentCount),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(width: 5), // 5px-width box
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
