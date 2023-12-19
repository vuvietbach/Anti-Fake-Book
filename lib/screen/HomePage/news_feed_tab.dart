import 'dart:async';

import 'package:anti_fake_book/models/base_apis/dto/response/get_list_posts.dto.dart';
import 'package:anti_fake_book/screen/HomePage/news_feed_subtab/detailed_post.dart';
import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:faker/faker.dart';
import 'dart:math';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../models/base_apis/dto/request/get_list_posts.dart';
import '../../store/actions/listposts.dart';
import '../../store/reducers/listposts.dart';
import '../../store/state/index.dart';
import '../../utils.dart';
import '../../widgets/loading_widget.dart';

final List<String> imageAssets = [
  "https://it4788.catan.io.vn/files/image-1702754561794-367705462.jpg",
  "https://it4788.catan.io.vn/files/avatar-1701792559489-506632748.png",
  "https://it4788.catan.io.vn/files/image-1702753432014-3454262.jpg",
  "https://it4788.catan.io.vn/files/image-1702753432015-740386668.jpg",
];

class PostHomePageContent extends StatefulWidget {
  @override
  _PostHomePageContentState createState() => _PostHomePageContentState();
}

List<String> getRandomImages(List<String> images, int count) {
  Random random = Random();
  Set<int> uniqueIndices = <int>{};

  while (uniqueIndices.length < count) {
    int index = random.nextInt(images.length);
    uniqueIndices.add(index);
  }

  return uniqueIndices.map((index) => images[index]).toList();
}

String calculateTimeAgo(DateTime postDate) {
  final now = DateTime.now();
  final timeDifference = now.difference(postDate);
  String res = "";
  if (timeDifference.inMinutes < 1) {
    res = "Vừa xong";
  } else if (timeDifference.inMinutes < 60) {
    res = "${timeDifference.inMinutes} phút trước";
  } else if (timeDifference.inHours < 24) {
    res = "${timeDifference.inHours} giờ trước";
  } else if (timeDifference.inDays < 365 / 12) {
    res = "${timeDifference.inDays} ngày trước";
  } else if (timeDifference.inDays < 365) {
    res = "${timeDifference.inDays ~/ 30} tháng trước";
  } else {
    res = "${timeDifference.inDays ~/ 365} năm trước";
  }
  return res;
}

class Post {
  final String id;
  final String userName;
  final String content;
  // final String youtubeLink;
  // final String vietnamNetLink;
  final List<String> imageURL;
  final String videoURL;
  late int kudosCount;
  // final int disappointedCount;
  final int commentCount;
  final DateTime PostDate;
  late FlickManager? currentFlickManager;
  late final String timeAgo;
  List<InlineSpan> textSpans = [];
  bool showAllText = false;
  List<InlineSpan> displayedText = [];
  final String userAvatar;
  late Widget loadedVideo;
  late String is_felt;

  Post(
      this.id,
      this.userName,
      this.content,
      // this.youtubeLink,
      this.imageURL,
      this.videoURL,
      // this.vietnamNetLink,
      this.kudosCount,
      // this.disappointedCount,
      this.commentCount,
      this.PostDate,
      this.userAvatar,
      this.is_felt) {
    timeAgo = calculateTimeAgo(PostDate);
    // if (videoURL != '') {
    //   loadedVideo = AspectRatio(
    //       aspectRatio: 9 / 16,
    //       child: FlickVideoPlayer(
    //           flickManager: FlickManager(
    //         videoPlayerController: VideoPlayerController.networkUrl(
    //           Uri.parse(
    //             videoURL,
    //           ),
    //         ),
    //       )));
    // } else {
    //   loadedVideo = Container();
    // }

    if (videoURL != '') {
      VideoPlayerController _videoPlayerController =
          VideoPlayerController.network(videoURL);

      ChewieController _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: null,
        autoPlay: false,
        looping: false,
      );

      loadedVideo = Chewie(
        controller: _chewieController,
      );
    } else {
      loadedVideo = Container();
    }

    // Split post content into parts based on spaces
    final contentParts = content.split(' ');

    for (final part in contentParts) {
      if (part.startsWith('http') || part.startsWith('https')) {
        textSpans.add(
          TextSpan(
            text: '$part ',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrlString(part);
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
  }
}

Post getPostState(int listPostId, Store<AntiFakeBookState> store) {
  listPostId = min(listPostId, store.state.listPostsState.post.length - 1);
  EachPostPayloadDTO post = store.state.listPostsState.post[listPostId];
  String id = post.id ?? "";
  String username = post.author?.name ?? "";
  String content = post.described ?? "";

  int kudosCount = int.parse(post.feel ?? "0");
  // int disappointedCount = random.nextInt(200);
  int commentCount = int.parse(post.commentMark ?? "0");

  List<String> imageURL = [];
  for (int i = 0; i < post.images.length; i++) {
    imageURL.add(post.images[i].url ?? "");
  }

  String? videoURL = post.video?.url;

  DateTime postDate = DateTime.parse(post.created ?? "");
  String userAvatar = post.author?.avatar ?? '';

  String? is_felt = post.isFelt;

  return Post(id, username, content, imageURL, videoURL ?? '', kudosCount,
      commentCount, postDate, userAvatar, is_felt ?? "-1");
}

Post FakePost() {
  String id = faker.guid.guid();
  String username = faker.person.name();
  String content = faker.lorem.words(50).join(' ');
  content = '$content \n https://youtube.com/ \n https://vietnamnet.vn/';
  // String youtubeLink = 'https://youtube.com/';
  // String vietnamNetLink = 'https://vietnamnet.vn/';

  final random = Random();

  int kudosCount = random.nextInt(200);
  // int disappointedCount = random.nextInt(200);
  int commentCount = random.nextInt(200);

  List<String> imageURL = getRandomImages(imageAssets, random.nextInt(5));
  String videoURL = '';

  // PostDate
  DateTime postDate = DateTime.now().add(const Duration(days: -30));

  return Post(id, username, content, imageURL, videoURL, kudosCount,
      commentCount, postDate, '', "-1");
}

class _PostHomePageContentState extends State<PostHomePageContent> {
  final ScrollController _scrollController = ScrollController();
  int numberOfContainers = 10;
  bool isLoading = false;

  List<Post> listPost = [];
  late Store<AntiFakeBookState> store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AntiFakeBookState>(context);
    reloadContainers();
  }

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
    // store = StoreProvider.of<AntiFakeBookState>(context);
    // reloadContainers();
    listPost = List.generate(numberOfContainers, (index) {
      return FakePost();
    });
  }

  void loadMoreContainers() {
    if (isLoading) return;

    loadMorePostList();
  }

  Future<void> loadMorePostList() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    GetListPostsRequestDTO getListPosts = GetListPostsRequestDTO(
        token: store.state.token,
        in_campaign: "1",
        campaign_id: "1",
        latitude: "1.0",
        longitude: "1.0",
        last_id: "0",
        index: "0",
        count: (numberOfContainers + 10).toString());

    Completer<void> completer = Completer<void>();

    store.dispatch(
      GetListPostsAction(
        postData: getListPosts,
        onSuccess: () {
          completer.complete();
        },
        onPending: () {},
      ),
    );

    // Wait for the action to complete
    await completer.future;

    setState(() {
      numberOfContainers += 10;
      isLoading = false;
    });
    for (int i = numberOfContainers - 10; i < numberOfContainers; i++) {
      listPost.add(getPostState(i, store));
    }
  }

  void reloadContainers() {
    if (isLoading) return;

    reloadPostList();
  }

  Future<void> reloadPostList() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    GetListPostsRequestDTO getListPosts = GetListPostsRequestDTO(
        token: store.state.token,
        in_campaign: "1",
        campaign_id: "1",
        latitude: "1.0",
        longitude: "1.0",
        last_id: "0",
        index: "0",
        count: "10");

    Completer<void> completer = Completer<void>();

    // Dispatch the action and listen for completion
    store.dispatch(
      GetListPostsAction(
        postData: getListPosts,
        onSuccess: () {
          completer.complete();
        },
        onPending: () {},
      ),
    );

    // Wait for the action to complete
    await completer.future;

    setState(() {
      numberOfContainers = 10;
      isLoading = false;
    });
    listPost = [];
    for (int i = 0; i < numberOfContainers; i++) {
      listPost.add(getPostState(i, store));
    }
  }

  void handleLikeButtonPress(int index) {
    if (listPost[index].is_felt == "0") {
      // If the button is currently pressed (liked), decrement kudosCount
      setState(() {
        listPost[index].kudosCount -= 1;
        listPost[index].is_felt = "-1";
      });
    } else {
      // If the button is not pressed (not liked), increment kudosCount
      setState(() {
        listPost[index].kudosCount += 1;
        listPost[index].is_felt = "0";
      });
    }
  }

  void updateStore(int index) {
    // Update the store with the modified post
    EachPostPayloadDTO updatedPost = EachPostPayloadDTO(
      id: listPost[index].id,
      isFelt: listPost[index].is_felt,
      // Include other properties that might be updated
    );

    store.dispatch(UpdateListPostAction(updatedPost, index));
  }

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
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
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
                        GoRouter.of(context).go('/create-post');
                      },
                      child: const Text('Tạo bài viết'),
                    );
                  } else if (index < numberOfContainers) {
                    if (listPost[index].textSpans.length <= 30) {
                      listPost[index].displayedText = listPost[index].textSpans;
                    } else if (listPost[index].kudosCount < 100 &&
                        listPost[index].commentCount < 100 &&
                        listPost[index].imageURL.length <= 1) {
                      listPost[index].displayedText =
                          listPost[index].showAllText
                              ? listPost[index].textSpans
                              : listPost[index].textSpans.sublist(0, 30);
                      if (!listPost[index].showAllText) {
                        listPost[index].displayedText.add(
                              const TextSpan(
                                text: '...',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                        listPost[index].displayedText.add(
                              TextSpan(
                                text: 'Xem thêm',
                                style: const TextStyle(color: Colors.grey),
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
                                style: const TextStyle(color: Colors.grey),
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
                      listPost[index].displayedText =
                          listPost[index].showAllText
                              ? listPost[index].textSpans
                              : listPost[index].textSpans.sublist(0, 30);
                      if (!listPost[index].showAllText) {
                        listPost[index].displayedText.add(
                              const TextSpan(
                                text: '...',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                        listPost[index].displayedText.add(
                              TextSpan(
                                text: 'Xem thêm',
                                style: const TextStyle(color: Colors.grey),
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
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (listPost[index].userAvatar != '' &&
                                  listPost[index].userAvatar != null)
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      NetworkImage(listPost[index].userAvatar),
                                )
                              else
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.deepPurple,
                                ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listPost[index].userName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${listPost[index].timeAgo} • ',
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
                                key: _menuButtonKeys[index],
                                icon: const Icon(Icons.more_horiz),
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
                                          contentPadding:
                                              const EdgeInsets.all(0),
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
                            text: TextSpan(
                                children: listPost[index].displayedText),
                          ),
                          const SizedBox(height: 10),
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: listPost[index].imageURL.length,
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
                                          itemCount:
                                              listPost[index].imageURL.length,
                                          builder: (contextImage, indexImage) {
                                            return PhotoViewGalleryPageOptions(
                                              imageProvider: NetworkImage(
                                                listPost[index]
                                                    .imageURL[indexImage],
                                              ),
                                              minScale: PhotoViewComputedScale
                                                  .contained,
                                              maxScale: PhotoViewComputedScale
                                                      .covered *
                                                  2,
                                              initialScale:
                                                  PhotoViewComputedScale
                                                      .contained,
                                              heroAttributes:
                                                  PhotoViewHeroAttributes(
                                                tag: listPost[index]
                                                    .imageURL[indexImage],
                                              ),
                                            );
                                          },
                                          backgroundDecoration:
                                              const BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          scrollPhysics:
                                              const BouncingScrollPhysics(),
                                          pageController: PageController(
                                              initialPage: imageIndex),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  listPost[index].imageURL[imageIndex],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                          listPost[index].loadedVideo,
                          Row(
                            children: [
                              Container(width: 5), // 5px-width box
                              Expanded(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: listPost[index].is_felt == "0"
                                        ? Colors.blue
                                        : Colors.white,
                                    onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      handleLikeButtonPress(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: listPost[index].is_felt == "0"
                                        ? Colors.white
                                        : Colors.blue,
                                  ),
                                  label: Text(
                                    formatCount(listPost[index].kudosCount),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: listPost[index].is_felt == "0"
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
                                    formatCount(listPost[index].commentCount),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(width: 5), // 5px-width box
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        if (isLoading) LoadingWidget(),
      ]);
    });
  }
}

class PostHomePage extends StatelessWidget {
  const PostHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return PostHomePageContent();
  }
}
