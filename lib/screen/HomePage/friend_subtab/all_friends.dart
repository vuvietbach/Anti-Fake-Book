import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'dart:math';

class Friend {
  final String name;
  final String firstName;
  final String imageUrl;
  final String friendFromMonth;
  final String friendFromYear;

  Friend(this.firstName, this.name, this.imageUrl, this.friendFromMonth,
      this.friendFromYear);
}

class AllFriends extends StatefulWidget {
  @override
  _AllFriendsState createState() => _AllFriendsState();
}

class _AllFriendsState extends State<AllFriends> {
  bool isOptionsVisible = false;
  int currentIndex = 0;

  List<Friend> allFriends = List.generate(150, (index) {
    final faker = Faker();
    final firstName = faker.person.firstName();
    final name = '$firstName ${faker.person.lastName()}';
    final friendFromMonth = (1 + faker.randomGenerator.integer(11)).toString();
    final friendFromYear = (2017 + faker.randomGenerator.integer(6)).toString();

    final random = Random();
    final imageIndex = random.nextInt(4);

    final imagePaths = [
      'assets/images/PostImage_01.jpeg',
      'assets/images/PostImage_02.jpeg',
      'assets/images/PostImage_03.jpeg',
      'assets/images/PostImage_04.jpeg',
    ];

    final imageUrl = imagePaths[imageIndex];
    return Friend(firstName, name, imageUrl, friendFromMonth, friendFromYear);
  });

  List<Friend> defaultAllFriends = List.generate(1, (index) {
    final faker = Faker();
    final firstName = faker.person.firstName();
    final name = '$firstName ${faker.person.lastName()}';
    final friendFromMonth = (1 + faker.randomGenerator.integer(11)).toString();
    final friendFromYear = (2017 + faker.randomGenerator.integer(6)).toString();

    final random = Random();
    final imageIndex = random.nextInt(4);

    final imagePaths = [
      'assets/images/PostImage_01.jpeg',
      'assets/images/PostImage_02.jpeg',
      'assets/images/PostImage_03.jpeg',
      'assets/images/PostImage_04.jpeg',
    ];

    final imageUrl = imagePaths[imageIndex];
    return Friend(firstName, name, imageUrl, friendFromMonth, friendFromYear);
  });

  @override
  void initState() {
    super.initState();
    defaultAllFriends = List.from(allFriends);
  }

  Widget _buildOptionsSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0.45 *
          MediaQuery.of(context).size.height, // 0.5 lần chiều cao của screen
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage:
                      AssetImage(allFriends[currentIndex].imageUrl),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allFriends[currentIndex].name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Là bạn bè từ tháng ${allFriends[currentIndex].friendFromMonth} năm ${allFriends[currentIndex].friendFromYear}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Nhắn tin cho ${allFriends[currentIndex].firstName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onTap: () {
              // Xử lý khi nhấn vào tùy chọn "Nhắn tin"
              // Đóng BottomSheet sau khi xử lý
              setState(() {
                isOptionsVisible = false;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.remove_circle),
            title: Text('Bỏ theo dõi ${allFriends[currentIndex].firstName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(
                'Không nhìn thấy bài viết của nhau nữa nhưng vẫn là bạn bè',
                style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Xử lý khi nhấn vào tùy chọn "Bỏ theo dõi"
              // Đóng BottomSheet sau khi xử lý
              setState(() {
                isOptionsVisible = false;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.block),
            title: Text('Chặn ${allFriends[currentIndex].firstName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(
                '${allFriends[currentIndex].firstName} sẽ không thể nhìn thấy bạn hoặc liên hệ với bạn trên AntiFakebook',
                style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Xử lý khi nhấn vào tùy chọn "Chặn"
              // Đóng BottomSheet sau khi xử lý
              setState(() {
                isOptionsVisible = false;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Hủy kết bạn với ${allFriends[currentIndex].firstName}',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(
                'Xóa ${allFriends[currentIndex].firstName} khỏi danh sách bạn bè',
                style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Xử lý khi nhấn vào tùy chọn "Hủy kết bạn"
              // Đóng BottomSheet sau khi xử lý
              setState(() {
                isOptionsVisible = false;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalFriendRequests = allFriends.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tất cả bạn bè',
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
                  itemCount:
                      allFriends.length + 1, // 1 item là phần text trên cùng
                  itemBuilder: (BuildContext context, int index_of_list_view) {
                    int index = index_of_list_view - 1;
                    if (index == -1) {
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '$totalFriendRequests Bạn bè',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          // BottomSheet content goes here
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.people),
                                                title: Text('Mặc định',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                onTap: () {
                                                  setState(() {
                                                    allFriends =
                                                        defaultAllFriends;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons
                                                    .arrow_upward_outlined),
                                                title: Text(
                                                    'Bạn bè mới nhất trước tiên',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                onTap: () {
                                                  setState(() {
                                                    allFriends.sort((a, b) {
                                                      final dateA = DateTime(
                                                          int.parse(
                                                              a.friendFromYear),
                                                          int.parse(a
                                                              .friendFromMonth));
                                                      final dateB = DateTime(
                                                          int.parse(
                                                              b.friendFromYear),
                                                          int.parse(b
                                                              .friendFromMonth));
                                                      return dateB
                                                          .compareTo(dateA);
                                                    });
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons
                                                    .arrow_downward_outlined),
                                                title: Text(
                                                    'Bạn bè lâu nhất trước tiên',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                onTap: () {
                                                  setState(() {
                                                    allFriends.sort((a, b) {
                                                      final dateA = DateTime(
                                                          int.parse(
                                                              a.friendFromYear),
                                                          int.parse(a
                                                              .friendFromMonth));
                                                      final dateB = DateTime(
                                                          int.parse(
                                                              b.friendFromYear),
                                                          int.parse(b
                                                              .friendFromMonth));
                                                      return dateA
                                                          .compareTo(dateB);
                                                    });
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Sắp xếp',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[300],
                                    ),
                                  ),
                                )
                              ])
                        ],
                      );
                    } else if (index < allFriends.length) {
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
                                    backgroundImage:
                                        AssetImage(allFriends[index].imageUrl),
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
                                                allFriends[index].name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.more_horiz),
                                                onPressed: () {
                                                  // Show the BottomSheet when a button or action is triggered
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
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          16.0),
                                                                  child: Row(
                                                                    children: [
                                                                      CircleAvatar(
                                                                        radius:
                                                                            36,
                                                                        backgroundImage:
                                                                            AssetImage(allFriends[index].imageUrl),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              14),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            allFriends[index].name,
                                                                            style:
                                                                                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            'Là bạn bè từ tháng ${allFriends[index].friendFromMonth} năm ${allFriends[currentIndex].friendFromYear}',
                                                                            style:
                                                                                TextStyle(fontSize: 14, color: Colors.grey),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness: 1,
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .message),
                                                                  title: Text(
                                                                      'Nhắn tin cho ${allFriends[index].firstName}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                  onTap: () {
                                                                    // Xử lý khi nhấn vào tùy chọn "Nhắn tin"
                                                                    // Đóng BottomSheet sau khi xử lý
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .remove_circle),
                                                                  title: Text(
                                                                      'Bỏ theo dõi ${allFriends[index].firstName}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                  subtitle: Text(
                                                                      'Không nhìn thấy bài viết của nhau nữa nhưng vẫn là bạn bè',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.grey)),
                                                                  onTap: () {
                                                                    // Xử lý khi nhấn vào tùy chọn "Bỏ theo dõi"
                                                                    // Đóng BottomSheet sau khi xử lý
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .block),
                                                                  title: Text(
                                                                      'Chặn ${allFriends[index].firstName}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                  subtitle: Text(
                                                                      '${allFriends[index].firstName} sẽ không thể nhìn thấy bạn hoặc liên hệ với bạn trên AntiFakebook',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.grey)),
                                                                  onTap: () {
                                                                    // Xử lý khi nhấn vào tùy chọn "Chặn"
                                                                    // Đóng BottomSheet sau khi xử lý
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .delete),
                                                                  title: Text(
                                                                      'Hủy kết bạn với ${allFriends[index].firstName}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                  subtitle: Text(
                                                                      'Xóa ${allFriends[index].firstName} khỏi danh sách bạn bè',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.grey)),
                                                                  onTap: () {
                                                                    // Xử lý khi nhấn vào tùy chọn "Hủy kết bạn"
                                                                    // Đóng BottomSheet sau khi xử lý
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ]),
                                      ),
                                      SizedBox(height: 5),
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
          )),
      bottomSheet: isOptionsVisible ? _buildOptionsSheet() : null,
    );
  }
}
