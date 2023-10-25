import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String imageUrl;

  Friend(this.name, this.imageUrl);
}

class FriendPageContent extends StatefulWidget {
  @override
  _FriendPageContentState createState() => _FriendPageContentState();
}

class _FriendPageContentState extends State<FriendPageContent> {
  final List<Friend> friendRequests = [
    Friend('Friend 1', 'assets/images/PostImage_01.jpeg'),
    Friend('Nguyen Van A', 'assets/images/PostImage_02.jpeg'),
    // Danh sách lời mời kết bạn
  ];

  final List<Friend> allFriends = [
    Friend('Friend 3', 'assets/images/PostImage_03.jpeg'),
    Friend('Friend 4', 'assets/images/PostImage_04.jpeg'),
    // Danh sách tất cả bạn bè
  ];

  @override
  Widget build(BuildContext context) {
    int totalFriendRequests = friendRequests.length;

    return Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Lời mời kết bạn: $totalFriendRequests',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: ListView.builder(
                itemCount: friendRequests.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index < friendRequests.length) {
                    return Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User avatar and name
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 48,
                                  backgroundImage: AssetImage(
                                      friendRequests[index].imageUrl),
                                ),
                                SizedBox(width: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 16),
                                    Container(
                                      width: 270,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              friendRequests[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '2 ngày',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle button press here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(130,
                                                38), // Đặt độ dài và chiều cao của nút
                                          ),
                                          child: Text(
                                            'Chấp nhận',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle button press here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(130, 38),
                                            backgroundColor: Colors.grey[300],
                                          ),
                                          child: Text(
                                            'Xóa',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors
                                                  .black, // Đổi màu chữ sang màu đen
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ));
                  }
                },
              ),
            ),
          ],
        ));
  }
}
