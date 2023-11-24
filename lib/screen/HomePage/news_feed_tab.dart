import 'package:anti_fake_book/screen/HomePage/news_feed_subtab/detailed_post.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:faker/faker.dart';
import 'dart:math';

final List<String> imageAssets = [
  "assets/images/PostImage_01.jpeg",
  "assets/images/PostImage_02.jpeg",
  "assets/images/PostImage_03.jpeg",
  "assets/images/PostImage_04.jpeg",
];

class PostHomePageContent extends StatefulWidget {
  @override
  _PostHomePageContentState createState() => _PostHomePageContentState();
}

List<String> getRandomImages(List<String> images, int count) {
  Random random = Random();
  Set<int> uniqueIndices = Set<int>();

  while (uniqueIndices.length < count) {
    int index = random.nextInt(images.length);
    uniqueIndices.add(index);
  }

  return uniqueIndices.map((index) => images[index]).toList();
}

class Post {
  final String id;
  final String userName;
  final String content;
  final String youtubeLink;
  final String vietnamNetLink;
  final int kudosCount;
  final int disappointedCount;
  final int commentCount;
  final List<String> imageURL;
  final DateTime PostDate;
  final FlickManager currentFlickManager = FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    ),
  );
  late final String timeAgo;
  List<InlineSpan> textSpans = [];
  bool showAllText = false;
  List<InlineSpan> displayedText = [];

  Post(
      this.id,
      this.userName,
      this.content,
      this.youtubeLink,
      this.imageURL,
      this.vietnamNetLink,
      this.kudosCount,
      this.disappointedCount,
      this.commentCount,
      this.PostDate) {
    final now = DateTime.now();
    final timeDifference = now.difference(this.PostDate);

    if (timeDifference.inMinutes < 1) {
      this.timeAgo = "Vừa xong";
    } else if (timeDifference.inHours < 24) {
      this.timeAgo = "${timeDifference.inHours} giờ trước";
    } else if (timeDifference.inDays < 365 / 12) {
      this.timeAgo = "${timeDifference.inDays} ngày trước";
    } else if (timeDifference.inDays < 365) {
      this.timeAgo = "${timeDifference.inDays ~/ 30} tháng trước";
    } else {
      this.timeAgo = "${timeDifference.inDays ~/ 365} năm trước";
    }

    // Split post content into parts based on spaces
    final contentParts = this.content.split(' ');

    for (final part in contentParts) {
      if (part.startsWith('http') || part.startsWith('https')) {
        this.textSpans.add(
              TextSpan(
                text: part + ' ',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrlString(part);
                  },
              ),
            );
      } else if (part.startsWith('#')) {
        // Handle Hashtags
        this.textSpans.add(
              TextSpan(
                text: part + ' ',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle when the user taps on hashtags
                  },
              ),
            );
      } else {
        this.textSpans.add(
              TextSpan(
                text: part + ' ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            );
      }
    }
  }
}

Post FakePost() {
  String id = faker.guid.guid();
  String username = faker.person.name();
  String content = faker.lorem.words(50).join(' ');
  String youtubeLink = 'https://youtube.com/';
  String vietnamNetLink = 'https://vietnamnet.vn/';

  final random = Random();

  int kudosCount = random.nextInt(200);
  int disappointedCount = random.nextInt(200);
  int commentCount = random.nextInt(200);

  List<String> imageURL = getRandomImages(imageAssets, random.nextInt(5));

  // PostDate
  DateTime start = DateTime.now().add(Duration(days: -30));
  DateTime end = DateTime.now();

  final difference = end.difference(start).inSeconds;
  final randomSeconds = random.nextInt(difference);
  DateTime PostDate = start.add(Duration(seconds: randomSeconds));

  return Post(id, username, content, youtubeLink, imageURL, vietnamNetLink,
      kudosCount, disappointedCount, commentCount, PostDate);
}

class _PostHomePageContentState extends State<PostHomePageContent> {
  final ScrollController _scrollController = ScrollController();
  int numberOfContainers = 3;
  bool isLoading = false;

  List<Post> listPost = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        loadMoreContainers();
      } else if (_scrollController.position.pixels == 0 && !isLoading) {
        reloadContainers();
      }
    });

    listPost = List.generate(numberOfContainers, (index) {
      return FakePost();
    });
  }

  void loadMoreContainers() {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        numberOfContainers += 3;
        isLoading = false;
      });
    });

    for (int i = 0; i < 3; i++) {
      listPost.add(FakePost());
    }
  }

  void reloadContainers() {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        numberOfContainers = 3;
        isLoading = false;
      });
    });

    listPost = [];
    for (int i = 0; i < 3; i++) {
      listPost.add(FakePost());
    }
  }

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
    List<GlobalKey> _menuButtonKeys =
        List.generate(numberOfContainers, (index) => GlobalKey());
    return Stack(children: [
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: numberOfContainers + 1,
              itemBuilder: (BuildContext context, int indexOfAll) {
                int index = indexOfAll - 1;
                if (index == -1) {
                  return ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/post/create');
                    },
                    child: Text('Tạo bài viết'),
                  );
                } else if (index < numberOfContainers) {
                  if (listPost[index].textSpans.length <= 30) {
                    listPost[index].displayedText = listPost[index].textSpans;
                  } else if (listPost[index].kudosCount < 100 &&
                      listPost[index].commentCount < 100 &&
                      listPost[index].imageURL.length <= 1) {
                    listPost[index].displayedText = listPost[index].showAllText
                        ? listPost[index].textSpans
                        : listPost[index].textSpans.sublist(0, 30);
                    if (!listPost[index].showAllText) {
                      listPost[index].displayedText.add(
                            TextSpan(
                              text: '...',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                      listPost[index].displayedText.add(
                            TextSpan(
                              text: 'Xem thêm',
                              style: TextStyle(color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    listPost[index].showAllText = true;
                                  });
                                },
                            ),
                          );
                    } else {
                      listPost[index].displayedText.add(
                            TextSpan(
                              text: ' Thu gọn',
                              style: TextStyle(color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    listPost[index].showAllText = false;
                                  });
                                },
                            ),
                          );
                    }
                  } else {
                    listPost[index].displayedText = listPost[index].showAllText
                        ? listPost[index].textSpans
                        : listPost[index].textSpans.sublist(0, 30);
                    if (!listPost[index].showAllText) {
                      listPost[index].displayedText.add(
                            TextSpan(
                              text: '...',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                      listPost[index].displayedText.add(
                            TextSpan(
                              text: 'Xem thêm',
                              style: TextStyle(color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailedPost(post: listPost[index]),
                                    ),
                                  );
                                },
                            ),
                          );
                    }
                  }
                  return Container(
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
                                  listPost[index].userName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${listPost[index].timeAgo} • ',
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
                              key: _menuButtonKeys[index],
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {
                                final RenderBox buttonBox =
                                    _menuButtonKeys[index]
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
                          text:
                              TextSpan(children: listPost[index].displayedText),
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
                                  'Kudos: ${formatCount(listPost[index].kudosCount)}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.comment, color: Colors.green),
                                SizedBox(width: 5),
                                Text(
                                  'Comments: ${formatCount(listPost[index].commentCount)}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.thumb_down, color: Colors.red),
                                SizedBox(width: 5),
                                Text(
                                  'Disappointed: ${formatCount(listPost[index].disappointedCount)}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Comment Count Section
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: listPost[index].imageURL.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, imageIndex) {
                            // Determine the layout based on the number of images
                            if (listPost[index].imageURL.length == 1) {
                              // If there's only one image, display it in one line
                              return Image.asset(
                                listPost[index].imageURL[imageIndex],
                                fit: BoxFit.cover,
                              );
                            } else if (listPost[index].imageURL.length == 2) {
                              // If there are two images, display them in two lines, one each
                              return Image.asset(
                                listPost[index].imageURL[imageIndex],
                                fit: BoxFit.cover,
                              );
                            } else if (listPost[index].imageURL.length == 3) {
                              if (imageIndex == 0) {
                                return Image.asset(
                                  listPost[index].imageURL[imageIndex],
                                  fit: BoxFit.cover,
                                );
                              } else {
                                return Image.asset(
                                  listPost[index].imageURL[imageIndex],
                                  fit: BoxFit.cover,
                                );
                              }
                            } else if (listPost[index].imageURL.length == 4) {
                              return Image.asset(
                                listPost[index].imageURL[imageIndex],
                                fit: BoxFit.cover,
                              );
                            }
                            return Container(); // Return an empty container for other cases
                          },
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: FlickVideoPlayer(
                            flickManager: listPost[index].currentFlickManager,
                          ),
                        )
                        // Add additional content
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      if (isLoading)
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
    ]);
  }
}

class PostHomePage extends StatelessWidget {
  const PostHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return PostHomePageContent();
  }
}
