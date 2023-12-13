import 'dart:async';

import 'package:anti_fake_book/screen/HomePage/watch_tab_subtab/detailed_video.dart';
import 'package:battery/battery.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:faker/faker.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:math';

import '../../widgets/loading_widget.dart';

final List<String> imageAssets = [
  "assets/images/PostImage_01.jpeg",
  "assets/images/PostImage_02.jpeg",
  "assets/images/PostImage_03.jpeg",
  "assets/images/PostImage_04.jpeg",
];

class WatchTabContent extends StatefulWidget {
  @override
  _WatchTabContentState createState() => _WatchTabContentState();
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

class Video {
  final String id;
  final String userName;
  final String content;
  final int kudosCount;
  final int disappointedCount;
  final int commentCount;
  final DateTime PostDate;
  final FlickManager currentFlickManager = FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    ),
  );
  late final String timeAgo;
  List<InlineSpan> displayedText = [];
  bool showAllText = false;

  Video(this.id, this.userName, this.content, this.kudosCount,
      this.disappointedCount, this.commentCount, this.PostDate) {
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
        this.displayedText.add(
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
        this.displayedText.add(
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
        this.displayedText.add(
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

Video FakeVideo() {
  String id = faker.guid.guid();
  String username = faker.person.name();
  String content = faker.lorem.words(50).join(' ');

  final random = Random();

  int kudosCount = random.nextInt(200);
  int disappointedCount = random.nextInt(200);
  int commentCount = random.nextInt(200);

  // PostDate
  DateTime start = DateTime.now().add(Duration(days: -30));
  DateTime end = DateTime.now();

  final difference = end.difference(start).inSeconds;
  final randomSeconds = random.nextInt(difference);
  DateTime PostDate = start.add(Duration(seconds: randomSeconds));

  return Video(id, username, content, kudosCount, disappointedCount,
      commentCount, PostDate);
}

class _WatchTabContentState extends State<WatchTabContent> {
  final ScrollController _scrollController = ScrollController();
  int numberOfContainers = 3;
  bool isLoading = false;
  bool isPowerSaveMode = false;

  final Battery _battery = Battery();

  Timer? autoPlayTimer;

  List<Video> listVideo = [];

  double volumeLevel = 1.0;

  void setVolume(double value) {
    setState(() {
      volumeLevel = value;
      listVideo.forEach((video) {
        video.currentFlickManager.flickControlManager?.setVolume(value);
      });
    });
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
      } else {
        autoPlayTimer?.cancel();
      }
    });

    listVideo = List.generate(numberOfContainers, (index) {
      return FakeVideo();
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      final batteryLevel = await _battery.batteryLevel;
      setState(() {
        // Customize this logic based on your requirements
        isPowerSaveMode =
            state == BatteryState.discharging && _isLowBattery(batteryLevel);
      });
    });
  }

  bool _isLowBattery(int batteryLevel) {
    // Customize this logic based on what you consider as a low battery
    return batteryLevel <= 20;
  }

  void startAutoPlayTimer(FlickManager flickManager) {
    autoPlayTimer?.cancel();

    if (!isPowerSaveMode) {
      autoPlayTimer = Timer(Duration(seconds: 3), () {
        flickManager.flickControlManager?.togglePlay();
        flickManager.flickControlManager?.setVolume(volumeLevel);
      });
    }
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
      listVideo.add(FakeVideo());
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

    listVideo = [];
    for (int i = 0; i < 3; i++) {
      listVideo.add(FakeVideo());
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
              itemCount: numberOfContainers,
              itemBuilder: (BuildContext context, int index) {
                if (index < numberOfContainers) {
                  return VisibilityDetector(
                      key: Key(index.toString()),
                      onVisibilityChanged: (visibilityInfo) {
                        if (visibilityInfo.visibleFraction > 0.3) {
                          // Start auto-play timer when video becomes visible
                          startAutoPlayTimer(
                              listVideo[index].currentFlickManager);
                        } else {
                          // Reset auto-play timer when video goes off-screen
                          autoPlayTimer?.cancel();
                        }
                      },
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
                                      listVideo[index].userName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${listVideo[index].timeAgo} • ',
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

                                    final Size screenSize =
                                        window.physicalSize /
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
                            Container(
                              child: GestureDetector(
                                onDoubleTap: () {
                                  print('okok');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailedVideo(
                                          video: listVideo[index]),
                                    ),
                                  );
                                },
                                child: RichText(
                                  text: TextSpan(
                                      children: listVideo[index].displayedText),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 1280,
                              height: 720,
                              child: FlickVideoPlayer(
                                flickManager:
                                    listVideo[index].currentFlickManager,
                              ),
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
                                      'Kudos: ${formatCount(listVideo[index].kudosCount)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.comment, color: Colors.green),
                                    SizedBox(width: 5),
                                    Text(
                                      'Comments: ${formatCount(listVideo[index].commentCount)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.thumb_down, color: Colors.red),
                                    SizedBox(width: 5),
                                    Text(
                                      'Disappointed: ${formatCount(listVideo[index].disappointedCount)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.volume_up),
                                SizedBox(width: 8),
                                Slider(
                                  value: volumeLevel,
                                  onChanged: (value) {
                                    setVolume(value);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                }
              },
            ),
          ),
        ],
      ),
      if (isLoading) LoadingWidget(),
    ]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class WatchTab extends StatelessWidget {
  const WatchTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return WatchTabContent();
  }
}
