import 'dart:async';

import 'package:anti_fake_book/models/base_apis/dto/request/get_recommended_friends.dto.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:math';

import 'package:redux/redux.dart';

import '../../../models/base_apis/dto/response/get_recommended_friends.dto.dart';
import '../../../plugins/index.dart';
import '../../../store/actions/recommended_friends.dart';
import '../../../store/state/index.dart';

class Friend {
  final String id;
  final String name;
  final String imageUrl;
  final String sameFriends;

  Friend(this.id, this.name, this.imageUrl, this.sameFriends);
}

class RecommendedFriends extends StatefulWidget {
  const RecommendedFriends({super.key});

  @override
  _RecommendedFriendsState createState() => _RecommendedFriendsState();
}

Friend getRecommendedFriendState(int listRecommendedFriendId) {
  listRecommendedFriendId = min(
      listRecommendedFriendId,
      (Plugins.antiFakeBookStore?.state.recommendedFriendsState.requests
                  .length ??
              0) -
          1);
  RecommendedFriendsPayloadDTO? user = Plugins.antiFakeBookStore?.state
      .recommendedFriendsState.requests[listRecommendedFriendId];

  print('here');
  print(user);

  String userId = user?.id ?? "";
  String username = user?.username ?? "";
  String avatar = user?.avatar ?? "";
  String sameFriends = user?.sameFriends ?? "";

  return Friend(userId, username, avatar, sameFriends);
}

class _RecommendedFriendsState extends State<RecommendedFriends> {
  List<Friend> recommendedFriends = [];
  int numberOfContainers = 100;
  late Store<AntiFakeBookState> store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AntiFakeBookState>(context);
    reloadListRecommendedFriend();
  }

  List<bool> sendRequest = List.generate(100, (index) => false);
  List<bool> cancelRequest = List.generate(100, (index) => false);

  Future<void> reloadListRecommendedFriend() async {
    GetRecommendedFriendsRequestDTO getRecommendedFriends =
        GetRecommendedFriendsRequestDTO(
            token: store.state.token, index: "0", count: "100");

    Completer<void> completer = Completer<void>();

    // Dispatch the action and listen for completion
    store.dispatch(
      GetRecommendedFriendsAction(
        listUsers: getRecommendedFriends,
        onSuccess: () {
          completer.complete();
        },
        onPending: () {},
      ),
    );

    await completer.future;

    setState(() {
      numberOfContainers = store.state.recommendedFriendsState.requests.length;
    });
    recommendedFriends = [];

    for (int i = 0; i < numberOfContainers; i++) {
      recommendedFriends.add(getRecommendedFriendState(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
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
            icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                    itemCount: recommendedFriends.length + 1,
                    itemBuilder: (BuildContext context, int indexOfListView) {
                      int index = indexOfListView - 1;
                      if (index == -1) {
                        return const Column(
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
                                      CircleAvatar(
                                        radius: 48,
                                        backgroundImage: NetworkImage(
                                            recommendedFriends[index].imageUrl),
                                      ),
                                      const SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 16),
                                          Row(children: [
                                            Text(
                                              recommendedFriends[index].name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                          (cancelRequest[index])
                                              ? const Row(children: [
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
                                                        title: const Text(
                                                            "Xác nhận"),
                                                        content: Text(
                                                            "Bạn có đồng ý gửi lời mời kết bạn tới ${recommendedFriends[index].name} không?"),
                                                        actions: [
                                                          TextButton(
                                                            child: const Text(
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
                                                            child: const Text(
                                                                "Hủy"),
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
                                                  minimumSize:
                                                      const Size(130, 38),
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
                                                        title: const Text(
                                                            "Xác nhận"),
                                                        content: Text(
                                                            "Bạn có muốn không đề xuất kết bạn với ${recommendedFriends[index].name} nữa không?"),
                                                        actions: [
                                                          TextButton(
                                                            child: const Text(
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
                                                            child: const Text(
                                                                "Hủy"),
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
                                                  minimumSize:
                                                      const Size(130, 38),
                                                  backgroundColor:
                                                      Colors.grey[300],
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
                        } else if (sendRequest[index]) {
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
                                      CircleAvatar(
                                        radius: 48,
                                        backgroundImage: NetworkImage(
                                            recommendedFriends[index].imageUrl),
                                      ),
                                      const SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 16),
                                          Row(children: [
                                            Text(
                                              recommendedFriends[index].name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                          const Row(
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
                                                        title: const Text(
                                                            "Xác nhận"),
                                                        content: Text(
                                                            "Bạn có đồng ý hủy lời mời kết bạn tới ${recommendedFriends[index].name} không?"),
                                                        actions: [
                                                          TextButton(
                                                            child: const Text(
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
                                                            child: const Text(
                                                                "Hủy"),
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
                                                  minimumSize:
                                                      const Size(270, 38),
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                ),
                                                child: const Text(
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
                      return null;
                    },
                  ),
                ),
              ],
            )));
  }
}
