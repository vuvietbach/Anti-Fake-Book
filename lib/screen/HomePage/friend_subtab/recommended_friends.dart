import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'dart:math';

class Friend {
  final String name;
  final String imageUrl;

  Friend(this.name, this.imageUrl);
}

class RecommendedFriends extends StatefulWidget {
  @override
  _RecommendedFriendsState createState() => _RecommendedFriendsState();
}

class _RecommendedFriendsState extends State<RecommendedFriends> {
  List<bool> sendRequest = List.generate(100, (index) => false);
  List<bool> cancelRequest = List.generate(100, (index) => false);

  final List<Friend> recommendedFriends = List.generate(100, (index) {
    final faker = Faker();
    final name = faker.person.name();

    final random = Random();
    final imageIndex = random.nextInt(4);

    final imagePaths = [
      'assets/images/PostImage_01.jpeg',
      'assets/images/PostImage_02.jpeg',
      'assets/images/PostImage_03.jpeg',
      'assets/images/PostImage_04.jpeg',
    ];

    final imageUrl = imagePaths[imageIndex];
    return Friend(name, imageUrl);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Gợi ý',
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
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: recommendedFriends.length +
                        1, // 1 item là phần text trên cùng
                    itemBuilder:
                        (BuildContext context, int index_of_list_view) {
                      int index = index_of_list_view - 1;
                      if (index == -1) {
                        return Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Những người bạn có thể biết',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ])
                          ],
                        );
                      } else if (index < recommendedFriends.length) {
                        if (!sendRequest[index]) {
                          return Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // User avatar and name
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 48,
                                        backgroundImage: AssetImage(
                                            recommendedFriends[index].imageUrl),
                                      ),
                                      SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 16),
                                          Row(children: [
                                            Text(
                                              recommendedFriends[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                          (cancelRequest[index])
                                              ? Row(children: [
                                                  Text(
                                                    'Đã hủy lời mời kết bạn',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  ),
                                                ])
                                              : Container(),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Xác nhận"),
                                                        content: Text(
                                                            "Bạn có đồng ý gửi lời mời kết bạn tới ${recommendedFriends[index].name} không?"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text(
                                                                "Xác nhận"),
                                                            onPressed: () {
                                                              setState(() {
                                                                sendRequest[
                                                                        index] =
                                                                    true;
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text("Hủy"),
                                                            onPressed: () {
                                                              // Xử lý hủy
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(130, 38),
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
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Xác nhận"),
                                                        content: Text(
                                                            "Bạn có muốn không đề xuất kết bạn với ${recommendedFriends[index].name} nữa không?"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text(
                                                                "Xác nhận"),
                                                            onPressed: () {
                                                              setState(() {
                                                                cancelRequest[
                                                                        index] =
                                                                    true;
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text("Hủy"),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(130, 38),
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                                child: Text(
                                                  'Xóa',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
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
                        } else if (sendRequest[index]) {
                          return Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // User avatar and name
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 48,
                                        backgroundImage: AssetImage(
                                            recommendedFriends[index].imageUrl),
                                      ),
                                      SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 16),
                                          Row(children: [
                                            Text(
                                              recommendedFriends[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                          Row(
                                            children: [
                                              Text(
                                                'Đã gửi lời mời kết bạn',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Xác nhận"),
                                                        content: Text(
                                                            "Bạn có đồng ý hủy lời mời kết bạn tới ${recommendedFriends[index].name} không?"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text(
                                                                "Xác nhận"),
                                                            onPressed: () {
                                                              setState(() {
                                                                sendRequest[
                                                                        index] =
                                                                    false;
                                                                cancelRequest[
                                                                        index] =
                                                                    true;
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text("Hủy"),
                                                            onPressed: () {
                                                              // Xử lý hủy
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(270, 38),
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                                child: Text(
                                                  'Hủy',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
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
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}
