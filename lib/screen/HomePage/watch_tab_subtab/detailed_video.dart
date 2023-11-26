import 'package:anti_fake_book/screen/HomePage/watch_tab.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class DetailedVideo extends StatefulWidget {
  final Video video;

  // Constructor with postId parameter
  const DetailedVideo({required this.video, Key? key}) : super(key: key);

  @override
  _DetailedVideoState createState() => _DetailedVideoState();
}

class _DetailedVideoState extends State<DetailedVideo> {
  double volumeLevel = 1.0;

  @override
  void initState() {
    super.initState();
  }

  void setVolume(double value) {
    setState(() {
      volumeLevel = value;
      widget.video.currentFlickManager.flickControlManager?.setVolume(value);
    });
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

  void _showAdvancedOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.flag),
                title: Text('Báo cáo video'),
                onTap: () {
                  // Xử lý khi người dùng chọn báo cáo video
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Kết bạn video'),
                onTap: () {
                  // Xử lý khi người dùng chọn kết bạn video
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.block),
                title: Text('Chặn người chủ của video'),
                onTap: () {
                  // Xử lý khi người dùng chọn chặn người chủ video
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  GlobalKey _menuButtonKeys = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.video.userName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Container(
                color: Colors.black,
                child: Container(
                  color: Colors.black,
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
                                widget.video.userName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${widget.video.timeAgo} • ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        color: Colors.white),
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
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _showAdvancedOptions(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          children:
                              widget.video.displayedText.map((inlineSpan) {
                            if (inlineSpan is TextSpan) {
                              return TextSpan(
                                text: inlineSpan.text,
                                style:
                                    (inlineSpan.style ?? TextStyle()).copyWith(
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return inlineSpan;
                            }
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FlickVideoPlayer(
                          flickManager: widget.video.currentFlickManager,
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
                                'Kudos: ${formatCount(widget.video.kudosCount)}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.comment, color: Colors.green),
                              SizedBox(width: 5),
                              Text(
                                'Comments: ${formatCount(widget.video.commentCount)}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.thumb_down, color: Colors.red),
                              SizedBox(width: 5),
                              Text(
                                'Disappointed: ${formatCount(widget.video.disappointedCount)}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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
                      // Add additional content
                    ],
                  ),
                )),
          ),
        ));
  }
}
