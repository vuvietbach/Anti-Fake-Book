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
  "https://it4788.catan.io.vn/files/image-1703013217511-26499064.jpg",
  "https://it4788.catan.io.vn/files/image-1703010349974-901183860.jpg",
  "https://it4788.catan.io.vn/files/image-1703010350019-240406983.jpg",
  "https://it4788.catan.io.vn/files/image-1703008899334-936284309.png",
];

class PostHomePageContent extends StatefulWidget {
  const PostHomePageContent({super.key});

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

List<Post> convertFromResponseToListPost(List<Map<String, dynamic>> response) {
  List<Post> res = [];
  // print(response);
  List<Map<String, dynamic>> rawData = response;
  int lengthListPost = rawData.length;
  for (int i = 0; i < lengthListPost; i++) {
    Map<String, dynamic> thisPost = rawData[i];
    List<String> imageUrls = thisPost['image']
        .map((item) => item['url'].toString())
        .toList()
        .cast<String>();
    res.add(Post(
        thisPost['id'],
        thisPost['author']['id'],
        thisPost['author']['name'],
        thisPost['described'],
        imageUrls,
        thisPost['video'] ?? '',
        int.parse(thisPost['feel']),
        int.parse(thisPost['comment_mark']),
        DateTime.parse(thisPost['created']),
        thisPost['author']['avatar'],
        thisPost['is_felt'] ?? '-1'));
  }
  return res;
}

class Post {
  final String id;
  final String userId;
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
      this.userId,
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

    if (videoURL != '') {
      VideoPlayerController videoPlayerController =
          VideoPlayerController.network(videoURL);

      ChewieController chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: null,
        autoPlay: false,
        looping: false,
      );

      loadedVideo = Chewie(
        controller: chewieController,
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
  String userId = post.author?.id ?? "";
  String username = post.author?.name ?? "";
  String content = post.described ?? "";

  int kudosCount = int.parse(post.feel ?? "0");
  // int disappointedCount = random.nextInt(200);
  int commentCount = int.parse(post.commentMark ?? "0");

  List<String> imageURL = [];
  for (int i = 0; i < post.image.length; i++) {
    imageURL.add(post.image[i].url ?? "");
  }

  String? videoURL = post.video?.url;

  DateTime postDate = DateTime.parse(post.created ?? "");
  String userAvatar = post.author?.avatar ?? '';

  String? isFelt = post.isFelt;

  return Post(id, userId, username, content, imageURL, videoURL ?? '',
      kudosCount, commentCount, postDate, userAvatar, isFelt ?? "-1");
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

  return Post(id, id, username, content, imageURL, videoURL, kudosCount,
      commentCount, postDate, '', "-1");
}

class PostWidget extends StatefulWidget {
  final Post post;
  final bool isDetailedPost;

  const PostWidget({
    required this.post,
    this.isDetailedPost = false,
    Key? key,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
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

List<Map<String, dynamic>> menuOptions = [
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

class _PostWidgetState extends State<PostWidget> {
  void handleLikeButtonPress() {
    if (widget.post.is_felt == "0") {
      setState(() {
        widget.post.kudosCount -= 1;
        widget.post.is_felt = "-1";
      });
    } else {
      setState(() {
        widget.post.kudosCount += 1;
        widget.post.is_felt = "0";
      });
    }
    // EachPostPayloadDTO updatedPost = EachPostPayloadDTO(
    //   id: widget.post.id,
    //   isFelt: widget.post.is_felt,
    // );
    //
    // store.dispatch(UpdateListPostAction(updatedPost, index));
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey menuButtonKeys = GlobalKey();

    if (widget.post.textSpans.length <= 30) {
      widget.post.displayedText = widget.post.textSpans;
    } else if (widget.post.kudosCount < 100 &&
        widget.post.commentCount < 100 &&
        widget.post.imageURL.length <= 1) {
      widget.post.displayedText = widget.post.showAllText
          ? widget.post.textSpans
          : widget.post.textSpans.sublist(0, 30);
      if (!widget.post.showAllText) {
        widget.post.displayedText.add(
          const TextSpan(
            text: '...',
            style: TextStyle(color: Colors.black),
          ),
        );
        widget.post.displayedText.add(
          TextSpan(
            text: 'Xem thêm',
            style: const TextStyle(color: Colors.grey),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  widget.post.showAllText = true;
                });
              },
          ),
        );
      } else {
        widget.post.displayedText.add(
          TextSpan(
            text: ' Thu gọn',
            style: const TextStyle(color: Colors.grey),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  widget.post.showAllText = false;
                });
              },
          ),
        );
      }
    } else {
      widget.post.displayedText = widget.post.showAllText
          ? widget.post.textSpans
          : widget.post.textSpans.sublist(0, 30);
      if (!widget.post.showAllText) {
        widget.post.displayedText.add(
          const TextSpan(
            text: '...',
            style: TextStyle(color: Colors.black),
          ),
        );
        widget.post.displayedText.add(
          TextSpan(
            text: 'Xem thêm',
            style: const TextStyle(color: Colors.grey),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedPost(post: widget.post),
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
              if (widget.post.userAvatar != '')
                GestureDetector(
                  onTap: () {
                    context.go(
                      '/profile/${widget.post.userId}',
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.post.userAvatar),
                  ),
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
                    widget.post.userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.post.timeAgo} • ',
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
                key: menuButtonKeys,
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  final RenderBox buttonBox = menuButtonKeys.currentContext
                      ?.findRenderObject() as RenderBox;
                  final Offset offset = buttonBox.localToGlobal(Offset.zero);

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
          RichText(
            text: TextSpan(children: widget.post.displayedText),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              minScale: PhotoViewComputedScale.contained,
                              maxScale: PhotoViewComputedScale.covered * 2,
                              initialScale: PhotoViewComputedScale.contained,
                              heroAttributes: PhotoViewHeroAttributes(
                                tag: widget.post.imageURL[indexImage],
                              ),
                            );
                          },
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          scrollPhysics: const BouncingScrollPhysics(),
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
              Container(width: 5), // 5px-width box
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        widget.post.is_felt == "0" ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      handleLikeButtonPress();
                    });
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color:
                        widget.post.is_felt == "0" ? Colors.white : Colors.blue,
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
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Add functionality for the Comment button
                    // You can navigate to a chat screen or perform any other action
                  },
                  icon: const Icon(Icons.message),
                  label: Text(
                    formatCount(widget.post.commentCount),
                    style: const TextStyle(fontSize: 16),
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
}

class ListPost extends StatelessWidget {
  final List<Post> listPost;
  final Function? onReload;
  final Function? onAddMore;
  final bool createPostButton;

  const ListPost({
    super.key,
    required this.listPost,
    this.onReload,
    this.onAddMore,
    this.createPostButton = false,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          onAddMore != null) {
        onAddMore!();
      } else if (scrollController.position.pixels == 0 && onReload != null) {
        onReload!();
      }
    });
    int fl = 0;
    if (createPostButton == true) {
      fl = 1;
    }
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: listPost.length + fl,
        itemBuilder: (BuildContext context, int indexOfAll) {
          int index = indexOfAll - fl;
          if (index == -1) {
            return Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  child: const Text('Tạo bài viết'),
                  onPressed: () {
                    GoRouter.of(context).go('/create-post');
                  },
                ))
              ],
            );
          }
          return PostWidget(
            post: listPost[index],
          );
        },
      ),
    );
  }
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
        user_id: "",
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
        user_id: "",
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
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Stack(children: [
        Column(
          children: [
            ListPost(
              listPost: listPost,
              onReload: reloadContainers,
              onAddMore: loadMoreContainers,
              createPostButton: true,
            ),
          ],
        ),
        if (isLoading) const LoadingWidget(),
      ]);
    });
  }
}

class PostHomePage extends StatelessWidget {
  const PostHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PostHomePageContent();
  }
}
