import 'dart:async';

import 'package:anti_fake_book/screen/HomePage/watch_tab_subtab/detailed_video.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:battery/battery.dart';
import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:redux/redux.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:faker/faker.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:math';

import '../../models/base_apis/dto/request/get_list_videos.dart';
import '../../models/base_apis/dto/request/set_request_friend.dto.dart';
import '../../models/base_apis/dto/response/get_list_videos.dto.dart';
import '../../plugins/index.dart';
import '../../store/actions/listvideos.dart';
import '../../store/actions/set_request_friend.dart';
import '../../widgets/loading_widget.dart';

final List<String> imageAssets = [
  "https://it4788.catan.io.vn/files/image-1703013217511-26499064.jpg",
  "https://it4788.catan.io.vn/files/image-1703010349974-901183860.jpg",
  "https://it4788.catan.io.vn/files/image-1703010350019-240406983.jpg",
  "https://it4788.catan.io.vn/files/image-1703008899334-936284309.png",
];

class WatchTabContent extends StatefulWidget {
  const WatchTabContent({super.key});

  @override
  _WatchTabContentState createState() => _WatchTabContentState();
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

class Video {
  final String id;
  final String userId;
  final String userName;
  final String content;
  // final String youtubeLink;
  // final String vietnamNetLink;
  final String videoURL;
  late int kudosCount;
  // final int disappointedCount;
  final int commentCount;
  final DateTime postDate;
  late final String timeAgo;
  List<InlineSpan> textSpans = [];
  bool showAllText = false;
  List<InlineSpan> displayedText = [];
  final String userAvatar;
  late Widget loadedVideo;
  late String is_felt;

  Video(
      this.id,
      this.userId,
      this.userName,
      this.content,
      // this.youtubeLink,
      this.videoURL,
      // this.vietnamNetLink,
      this.kudosCount,
      // this.disappointedCount,
      this.commentCount,
      this.postDate,
      this.userAvatar,
      this.is_felt) {
    timeAgo = calculateTimeAgo(postDate);

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

Video getPostState(int listPostId, Store<AntiFakeBookState> store) {
  listPostId = min(listPostId, store.state.listVideosState.post.length - 1);
  EachVideoPayloadDTO post = store.state.listVideosState.post[listPostId];
  String id = post.id ?? "";
  String userId = post.author?.id ?? "";
  String username = post.author?.name ?? "";
  String content = post.described ?? "";

  int kudosCount = int.parse(post.feel ?? "0");
  // int disappointedCount = random.nextInt(200);
  int commentCount = int.parse(post.commentMark ?? "0");

  String? videoURL = post.video?.url;

  DateTime postDate = DateTime.parse(post.created ?? "");
  String userAvatar = post.author?.avatar ?? '';

  String? isFelt = post.isFelt;

  return Video(id, userId, username, content, videoURL ?? '', kudosCount,
      commentCount, postDate, userAvatar, isFelt ?? "-1");
}

Video FakeVideo() {
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

  String videoURL = '';

  // PostDate
  DateTime postDate = DateTime.now().add(const Duration(days: -30));

  return Video(id, id, username, content, videoURL, kudosCount, commentCount,
      postDate, '', "-1");
}

class VideoWidget extends StatefulWidget {
  final Video post;
  final bool isDetailedPost;

  const VideoWidget({
    required this.post,
    this.isDetailedPost = false,
    Key? key,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
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

class _VideoWidgetState extends State<VideoWidget> {
  late List<Map<String, dynamic>> menuOptions;
  @override
  void initState() {
    super.initState();
    initializeMenuOptions();
  }

  void initializeMenuOptions() {
    menuOptions = [
      {
        'icon': Icons.flag,
        'title': "Báo cáo video",
        'action': () {
          // Implement action for reporting video
        },
      },
      {
        'icon': Icons.person_add,
        'title': "Kết bạn chủ của video",
        'action': sendRequestFriend,
      },
      {
        'icon': Icons.block,
        'title': "Chặn người chủ của video",
        'action': () {
          // Implement action for blocking the video owner
        },
      },
    ];
  }

  Future<void> sendRequestFriend() async {
    SetRequestFriendRequestDTO setRequestFriends = SetRequestFriendRequestDTO(
        token: Plugins.antiFakeBookStore!.state.token,
        user_id: widget.post.userId);

    Completer<void> completer = Completer<void>();

    // Dispatch the action and listen for completion
    Plugins.antiFakeBookStore?.dispatch(
      SetRequestInviteAction(
        requestInfo: setRequestFriends,
        onSuccess: () {
          completer.complete();
        },
        onPending: () {},
      ),
    );

    await completer.future;
  }

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
    } else if (widget.post.kudosCount < 100 && widget.post.commentCount < 100) {
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
                    builder: (context) => DetailedVideo(post: widget.post),
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
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: menuOptions.map((option) {
                            return ListTile(
                              leading: Icon(option['icon']),
                              title: Text(option['title']),
                              onTap: () {
                                option[
                                    'action'](); // Execute the corresponding action
                                Navigator.pop(
                                    context); // Close the bottom sheet after action
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
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

class ListVideo extends StatelessWidget {
  final List<Video> listVideo;
  final Function? onReload;
  final Function? onAddMore;

  const ListVideo({
    super.key,
    required this.listVideo,
    this.onReload,
    this.onAddMore,
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

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: listVideo.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedVideo(post: listVideo[index]),
                ),
              );
            },
            child: VideoWidget(
              post: listVideo[index],
            ),
          );
        },
      ),
    );
  }
}

class _WatchTabContentState extends State<WatchTabContent> {
  final ScrollController _scrollController = ScrollController();
  int numberOfContainers = 10;
  bool isLoading = false;

  List<Video> listVideo = [];
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
    listVideo = List.generate(numberOfContainers, (index) {
      return FakeVideo();
    });
  }

  void loadMoreContainers() {
    if (isLoading) return;

    loadMoreVideoList();
  }

  Future<void> loadMoreVideoList() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    GetListVideosRequestDTO getListVideos = GetListVideosRequestDTO(
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
      GetListVideosAction(
        videoData: getListVideos,
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
      listVideo.add(getPostState(i, store));
    }
  }

  void reloadContainers() {
    if (isLoading) return;

    reloadVideoList();
  }

  Future<void> reloadVideoList() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    GetListVideosRequestDTO getListVideos = GetListVideosRequestDTO(
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
      GetListVideosAction(
        videoData: getListVideos,
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
    listVideo = [];
    for (int i = 0; i < numberOfContainers; i++) {
      listVideo.add(getPostState(i, store));
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

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<AntiFakeBookState> store) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Stack(
            children: [
              Column(
                children: [
                  ListVideo(
                    listVideo: listVideo,
                    onReload: reloadContainers,
                    onAddMore: loadMoreContainers,
                  ),
                ],
              ),
              if (isLoading) const LoadingWidget(),
            ],
          ),
        );
      },
    );
  }
}

class WatchTab extends StatelessWidget {
  const WatchTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return const WatchTabContent();
  }
}
