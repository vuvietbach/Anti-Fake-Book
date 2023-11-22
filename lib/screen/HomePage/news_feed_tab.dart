import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';

class PostHomePageContent extends StatefulWidget {
  const PostHomePageContent({super.key});

  @override
  _PostHomePageContentState createState() => _PostHomePageContentState();
}

class _PostHomePageContentState extends State<PostHomePageContent> {
  final ScrollController _scrollController = ScrollController();
  int numberOfContainers = 3;
  bool isLoading = false;
  bool showAllText = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreContainers();
      } else if (_scrollController.position.pixels == 0) {
        loadMoreContainers();
      }
    });
  }

  void _launchURL(String url) {
    launchUrlString(url);
  }

  void loadMoreContainers() {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        numberOfContainers += 3;
        isLoading = false;
      });
    });
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

  @override
  Widget build(BuildContext context) {
    List<GlobalKey> menuButtonKeys =
        List.generate(numberOfContainers, (index) => GlobalKey());

    int kudosCount = 4200;
    int disappointedCount = 10000;
    int commentCount = 1500;

    final DateTime postTime = DateTime(2023, 10, 10, 10, 0);
    final now = DateTime.now();
    final timeDifference = now.difference(postTime);
    String timeAgo;

    if (timeDifference.inMinutes < 1) {
      timeAgo = "Vừa xong";
    } else if (timeDifference.inHours < 24) {
      timeAgo = "${timeDifference.inHours} giờ trước";
    } else if (timeDifference.inDays < 365 / 12) {
      timeAgo = "${timeDifference.inDays} ngày trước";
    } else {
      timeAgo = "${timeDifference.inDays ~/ 365} năm trước";
    }

    // Post content (text)
    const postContent =
        '#flutterno1\n 😀😀😀😀😀😀😀😀😀 \nThis is the post content. This is the post content. This is the post content. This is the post content. \nThis is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content. This is the post content.\nLink1: https://www.tutorialspoint.com/index.htm \nLink2: https://www.youtube.com/watch?v=dQw4w9WgXcQ';
    final List<InlineSpan> textSpans = [];

    // Split post content into parts based on spaces
    final contentParts = postContent.split(' ');

    for (final part in contentParts) {
      if (part.startsWith('http') || part.startsWith('https')) {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Open the link when tapped
                _launchURL(part);
              },
          ),
        );
      } else if (part.startsWith('#')) {
        // Handle Hashtags
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle when the user taps on hashtags
              },
          ),
        );
      } else {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        );
      }
    }

    List<InlineSpan> displayedText = [];

    if (textSpans.length > 31) {
      displayedText = showAllText ? textSpans : textSpans.sublist(0, 30);
      if (!showAllText) {
        displayedText.add(
          const TextSpan(
            text: '...',
            style: TextStyle(color: Colors.black),
          ),
        );
        displayedText.add(
          TextSpan(
            text: 'Xem thêm',
            style: const TextStyle(color: Colors.grey),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  showAllText = true;
                });
              },
          ),
        );
      } else {
        displayedText.add(
          TextSpan(
            text: ' Thu gọn',
            style: const TextStyle(color: Colors.grey),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  showAllText = false;
                });
              },
          ),
        );
      }
    } else {
      displayedText = textSpans;
    }

    final List<String> imageAssets = [
      "assets/images/PostImage_01.jpeg",
      "assets/images/PostImage_02.jpeg",
      "assets/images/PostImage_03.jpeg",
      "assets/images/PostImage_04.jpeg",
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

    return Container(
      child: ListView(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/post/create');
            },
            child: const Text('Tạo bài viết'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: numberOfContainers + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < numberOfContainers) {
                  final FlickManager currentFlickManager = FlickManager(
                    videoPlayerController: VideoPlayerController.networkUrl(
                      Uri.parse(
                        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                      ),
                    ),
                  );

                  return Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.deepPurple,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'User Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '$timeAgo • ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Icon(
                                      Icons.public_rounded,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              key: menuButtonKeys[index],
                              icon: const Icon(Icons.more_horiz),
                              onPressed: () {
                                final RenderBox buttonBox =
                                    menuButtonKeys[index]
                                        .currentContext
                                        ?.findRenderObject() as RenderBox;
                                final Offset offset =
                                    buttonBox.localToGlobal(Offset.zero);

                                final Size screenSize = window.physicalSize /
                                    window.devicePixelRatio;
                                final double menuHeight =
                                    menuOptions.length * 56.0;

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
                                        contentPadding: const EdgeInsets.all(0),
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
                        const SizedBox(height: 10),
                        // Post content (text)
                        RichText(
                          text: TextSpan(children: displayedText),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.thumb_up, color: Colors.blue),
                                const SizedBox(width: 5),
                                Text(
                                  'Kudos: ${formatCount(kudosCount)}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.thumb_down, color: Colors.red),
                                const SizedBox(width: 5),
                                Text(
                                  'Disappointed: ${formatCount(disappointedCount)}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Comment Count Section
                        Row(
                          children: [
                            const Icon(Icons.comment, color: Colors.green),
                            const SizedBox(width: 5),
                            Text(
                              'Comments: ${formatCount(commentCount)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: imageAssets.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PhotoViewGallery(
                                      pageController:
                                          PageController(initialPage: index),
                                      pageOptions: imageAssets
                                          .map((imageAsset) =>
                                              PhotoViewGalleryPageOptions(
                                                imageProvider:
                                                    AssetImage(imageAsset),
                                                minScale: PhotoViewComputedScale
                                                    .contained,
                                                maxScale: PhotoViewComputedScale
                                                        .covered *
                                                    2,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(imageAssets[index],
                                  fit: BoxFit.cover),
                            );
                          },
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: FlickVideoPlayer(
                            flickManager: currentFlickManager,
                          ),
                        )
                        // Add additional content
                      ],
                    ),
                  );
                } else if (isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostHomePage extends StatelessWidget {
  const PostHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PostHomePageContent();
  }
}
