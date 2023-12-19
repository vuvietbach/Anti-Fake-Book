import 'dart:async';

import 'package:anti_fake_book/models/base_apis/dto/request/get_requested_friends.dart';
import 'package:anti_fake_book/screen/HomePage/friend_subtab/recommended_friends.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:math';
import '../../models/base_apis/dto/response/get_requested_friends.dto.dart';
import '../../store/actions/requested_friends.dart';
import '../../store/state/index.dart';
import 'friend_subtab/all_friends.dart';

class Friend {
  final String id;
  final String name;
  final String imageUrl;
  final String timeAgo;
  final String sameFriends;

  Friend(this.id, this.name, this.imageUrl, this.timeAgo, this.sameFriends);
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

Friend getRequestedFriendState(
    int listRequestedFriendId, Store<AntiFakeBookState> store) {
  listRequestedFriendId = min(listRequestedFriendId,
      store.state.requestedFriendsState.requests.length - 1);
  RequestedFriendsPayloadDTO user =
      store.state.requestedFriendsState.requests[listRequestedFriendId];

  String userId = user.userId ?? "";
  String username = user.username ?? "";
  String avatar = user.avatar ?? "";
  String timeAgo = calculateTimeAgo(DateTime.parse(user.created ?? ""));
  String sameFriends = user.sameFriends ?? "";

  return Friend(userId, username, avatar, timeAgo, sameFriends);
}

class FriendPageContent extends StatefulWidget {
  @override
  _FriendPageContentState createState() => _FriendPageContentState();
}

class _FriendPageContentState extends State<FriendPageContent> {
  int currentIndex = 0;
  List<Friend> friendRequests = [];
  int numberOfContainers = 100;
  late Store<AntiFakeBookState> store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AntiFakeBookState>(context);
    reloadListRequestedFriend();
  }

  List<bool> acceptInvite = List.generate(100, (index) => false);
  List<bool> rejectInvite = List.generate(100, (index) => false);

  Future<void> reloadListRequestedFriend() async {
    GetRequestedFriendsRequestDTO getRequestedFriends =
        GetRequestedFriendsRequestDTO(
            token: store.state.token, index: "0", count: "100");

    Completer<void> completer = Completer<void>();

    // Dispatch the action and listen for completion
    store.dispatch(
      GetRequestedFriendsAction(
        listUsers: getRequestedFriends,
        onSuccess: () {
          completer.complete();
        },
        onPending: () {},
      ),
    );

    await completer.future;

    setState(() {
      numberOfContainers = store.state.requestedFriendsState.requests.length;
    });
    friendRequests = [];

    for (int i = 0; i < numberOfContainers; i++) {
      friendRequests.add(getRequestedFriendState(i, store));
    }
    // print('ok');
    // print(friendRequests[4].name);
    // print(friendRequests[4].imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    if (store == null) {
      return CircularProgressIndicator();
    }

    int totalFriendRequests = friendRequests.length;

    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: friendRequests.length + 1,
                itemBuilder: (BuildContext context, int index_of_list_view) {
                  int index = index_of_list_view - 1;
                  if (index == -1) {
                    return Column(children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Bạn bè',
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
                                    icon: const Icon(Icons.search,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
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
                                  builder: (context) =>
                                      const RecommendedFriends(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              backgroundColor: Colors.grey[300],
                            ),
                            child: const Text(
                              'Gợi ý',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
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
                            child: const Text(
                              'Tất cả bạn bè',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                      Row(children: [
                        Text(
                          'Lời mời kết bạn: $totalFriendRequests',
                          style: const TextStyle(
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
                          margin: const EdgeInsets.only(
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
                                  if (friendRequests[index].imageUrl != '' &&
                                      friendRequests[index].imageUrl != null)
                                    CircleAvatar(
                                      radius: 48,
                                      backgroundImage: NetworkImage(
                                          friendRequests[index].imageUrl),
                                    )
                                  else
                                    const CircleAvatar(
                                      radius: 48,
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                  const SizedBox(width: 14),
                                  SizedBox(
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
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              const Row(
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
                                                              leading: const Icon(
                                                                  Icons.delete),
                                                              title: const Text(
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
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                              onTap: () {
                                                                // Xử lý khi nhấn vào tùy chọn "Hủy kết bạn"
                                                                // Đóng BottomSheet sau khi xử lý
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: const Icon(
                                                                  Icons.block),
                                                              title: Text(
                                                                  'Chặn ${friendRequests[index].name}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  )),
                                                              subtitle: Text(
                                                                  '${friendRequests[index].name} sẽ không thể nhìn thấy bạn hoặc liên hệ với bạn qua AntiFakebook',
                                                                  style: const TextStyle(
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
                          margin: const EdgeInsets.only(
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
                                  if (friendRequests[index].imageUrl != '' &&
                                      friendRequests[index].imageUrl != null)
                                    CircleAvatar(
                                      radius: 48,
                                      backgroundImage: NetworkImage(
                                          friendRequests[index].imageUrl),
                                    )
                                  else
                                    const CircleAvatar(
                                      radius: 48,
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                  const SizedBox(width: 14),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: 270,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                friendRequests[index].name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                friendRequests[index].timeAgo,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                            ]),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        const Text("Xác nhận"),
                                                    content: Text(
                                                        "Bạn có đồng ý lời mời kết bạn của ${friendRequests[index].name}?"),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            "Xác nhận"),
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
                                                        child:
                                                            const Text("Hủy"),
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
                                              minimumSize: const Size(130, 38),
                                            ),
                                            child: const Text(
                                              'Chấp nhận',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        const Text("Xác nhận"),
                                                    content: Text(
                                                        "Bạn có đồng ý gỡ lời mời kết bạn của ${friendRequests[index].name}?"),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            "Xác nhận"),
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
                                                        child:
                                                            const Text("Hủy"),
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
                                              minimumSize: const Size(130, 38),
                                              backgroundColor: Colors.grey[300],
                                            ),
                                            child: const Text(
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
                          margin: const EdgeInsets.only(
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
                                  if (friendRequests[index].imageUrl != '' &&
                                      friendRequests[index].imageUrl != null)
                                    CircleAvatar(
                                      radius: 48,
                                      backgroundImage: NetworkImage(
                                          friendRequests[index].imageUrl),
                                    )
                                  else
                                    const CircleAvatar(
                                      radius: 48,
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                  const SizedBox(width: 14),
                                  SizedBox(
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
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              const Row(
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
