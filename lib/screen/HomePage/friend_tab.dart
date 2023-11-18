import 'package:anti_fake_book/screen/HomePage/friend_subtab/recommended_friends.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'dart:math';
import 'friend_subtab/all_friends.dart';

class Friend {
  final String name;
  final String imageUrl;
  final String friendRequestFromMonth;
  final String friendRequestFromYear;

  Friend(this.name, this.imageUrl, this.friendRequestFromMonth,
      this.friendRequestFromYear);
}

class FriendPageContent extends StatefulWidget {
  @override
  _FriendPageContentState createState() => _FriendPageContentState();
}

class _FriendPageContentState extends State<FriendPageContent> {
  int currentIndex = 0;

  List<bool> acceptInvite = List.generate(15, (index) => false);
  List<bool> rejectInvite = List.generate(15, (index) => false);

  final List<Friend> friendRequests = List.generate(15, (index) {
    final faker = Faker();
    final name = faker.person.name();
    final friendRequestFromMonth =
        (1 + faker.randomGenerator.integer(11)).toString();
    final friendRequestFromYear =
        (2017 + faker.randomGenerator.integer(6)).toString();

    final random = Random();
    final imageIndex = random.nextInt(4);

    final imagePaths = [
      'assets/images/PostImage_01.jpeg',
      'assets/images/PostImage_02.jpeg',
      'assets/images/PostImage_03.jpeg',
      'assets/images/PostImage_04.jpeg',
    ];

    final imageUrl = imagePaths[imageIndex];
    return Friend(
        name, imageUrl, friendRequestFromMonth, friendRequestFromYear);
  });

  @override
  Widget build(BuildContext context) {
    int totalFriendRequests = friendRequests.length;

    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                    friendRequests.length + 1, // 1 item là phần text trên cùng
                itemBuilder: (BuildContext context, int index_of_list_view) {
                  int index = index_of_list_view - 1;
                  if (index == -1) {
                    return Column(children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bạn bè',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(Icons.search, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecommendedFriends(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              backgroundColor: Colors.grey[300],
                            ),
                            child: Text(
                              'Gợi ý',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllFriends(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              backgroundColor: Colors.grey[300],
                            ),
                            child: Text(
                              'Tất cả bạn bè',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                      Row(children: [
                        Text(
                          'Lời mời kết bạn: $totalFriendRequests',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ]);
                  } else if (index < friendRequests.length) {
                    if (rejectInvite[index]) {
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
                                        friendRequests[index].imageUrl),
                                  ),
                                  SizedBox(width: 14),
                                  Container(
                                      width: 270,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    friendRequests[index].name,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Đã gỡ lời mời kết',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.more_horiz),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        // BottomSheet content goes here
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            ListTile(
                                                              leading: Icon(
                                                                  Icons.delete),
                                                              title: Text(
                                                                  'Bạn thấy sao về lời mời kết bạn này',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  )),
                                                              subtitle: Text(
                                                                  '${friendRequests[index].name} sẽ không nhận được thông báo',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                              onTap: () {
                                                                // Xử lý khi nhấn vào tùy chọn "Hủy kết bạn"
                                                                // Đóng BottomSheet sau khi xử lý
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Icon(
                                                                  Icons.block),
                                                              title: Text(
                                                                  'Chặn ${friendRequests[index].name}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  )),
                                                              subtitle: Text(
                                                                  '${friendRequests[index].name} sẽ không thể nhìn thấy bạn hoặc liên hệ với bạn qua AntiFakebook',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                              onTap: () {
                                                                // Xử lý khi nhấn vào tùy chọn "Hủy kết bạn"
                                                                // Đóng BottomSheet sau khi xử lý
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ));
                    } else if (!acceptInvite[index] && !rejectInvite[index]) {
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
                                        friendRequests[index].imageUrl),
                                  ),
                                  SizedBox(width: 14),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text("Xác nhận"),
                                                    content: Text(
                                                        "Bạn có đồng ý lời mời kết bạn của ${friendRequests[index].name}?"),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Xác nhận"),
                                                        onPressed: () {
                                                          setState(() {
                                                            acceptInvite[
                                                                index] = true;
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text("Hủy"),
                                                        onPressed: () {
                                                          // Xử lý hủy
                                                          Navigator.of(context)
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
                                                        "Bạn có đồng ý gỡ lời mời kết bạn của ${friendRequests[index].name}?"),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Xác nhận"),
                                                        onPressed: () {
                                                          setState(() {
                                                            rejectInvite[
                                                                index] = true;
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text("Hủy"),
                                                        onPressed: () {
                                                          Navigator.of(context)
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
                                              backgroundColor: Colors.grey[300],
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
                    } else if (acceptInvite[index]) {
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
                                        friendRequests[index].imageUrl),
                                  ),
                                  SizedBox(width: 14),
                                  Container(
                                      width: 270,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    friendRequests[index].name,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Đã chấp nhận lời mời kết',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
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
        ));
  }
}
