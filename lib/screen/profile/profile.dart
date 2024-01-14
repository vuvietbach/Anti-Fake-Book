import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/screen/HomePage/news_feed_tab.dart';
import 'package:anti_fake_book/screen/profile/friend_section.dart';
import 'package:anti_fake_book/screen/profile/profile_setting.dart';
import 'package:anti_fake_book/screen/profile/redux_actions.dart';
import 'package:anti_fake_book/screen/profile/state.dart';
import 'package:anti_fake_book/screen/profile/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/loading_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CallApiWidget extends StatefulWidget {
  final bool showLoading;
  final Widget child;
  final Future<void> Function() getData;
  const CallApiWidget(
      {super.key,
      required this.child,
      required this.getData,
      this.showLoading = false});

  @override
  State<CallApiWidget> createState() => _CallApiWidgetState();
}

class _CallApiWidgetState extends State<CallApiWidget> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      setState(() {
        _loading = true;
      });
      await widget.getData();
    } on DioException catch (e) {
      showError(context, e);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading && widget.showLoading) {
      return const LoadingScreen();
    } else {
      return widget.child;
    }
  }
}

class ProfilePage extends StatelessWidget {
  final String? userId;
  const ProfilePage({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      child: StoreBuilder(
          builder: (BuildContext context, Store<AntiFakeBookState> store) {
        bool isOwner = isAccountOwner(userId, store.state);
        if (isOwner) {
          return const MyProfilePage();
        } else {
          return OtherProfilePage(userId: userId);
        }
      }),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late PostState postState;
  @override
  void initState() {
    super.initState();
    postState = PostState(
        userId: null,
        setStateCallback: (PostState state) => setState(() {
              postState = state;
            }));
    postState.getInitialPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      getUserInfo(context, GetUserInfoRequest(userId: null));
      getUserFriends(context,
          GetUserFriendsRequest(index: 0, count: NUM_QUERY_PER_REQUEST));
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return ProfilePageUi(
          userState: UserState(
              userInfo: store.state.userState.userInfo, setStateCallback: null),
          friendState: FriendState(
              userId: null,
              setStateCallback: null,
              friends: store.state.friendState.userFriends,
              total: store.state.friendState.userTotalNumFriend),
          postState: postState);
    });
  }
}

class OtherProfilePage extends StatefulWidget {
  final String? userId;
  const OtherProfilePage({super.key, this.userId});
  static const friendCardHeight = 200.0;

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  late UserState userState;
  late FriendState friendState;
  late PostState postState;
  @override
  void initState() {
    super.initState();
    userState = UserState(
        userId: widget.userId,
        setStateCallback: (UserState state) => setState(() {
              userState = state;
            }));
    friendState = FriendState(
        userId: widget.userId,
        setStateCallback: (FriendState state) => setState(() {
              friendState = state;
            }));
    postState = PostState(
        userId: widget.userId,
        setStateCallback: (PostState state) => setState(() {
              postState = state;
            }));
    userState.getUserInfo(context);
    friendState.getInitialFriends(context);
    postState.getInitialPosts(context);
  }

  // Future<void> _fetchData() async {
  //   await userState.getUserInfo(callback: (UserState state) {
  //     setState(() {
  //       userState = state;
  //     });
  //   });
  //   await friendState.getUserFriends(
  //       GetUserFriendsRequest(userId: widget.userId, index: 0, count: 6),
  //       callback: (FriendState state) {
  //     setState(() {
  //       friendState = state;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ProfilePageUi(
      userState: userState,
      friendState: friendState,
      postState: postState,
    );
  }
}

class ProfilePageUi extends StatefulWidget {
  final UserState userState;
  final FriendState friendState;
  final PostState postState;
  const ProfilePageUi(
      {super.key,
      required this.userState,
      required this.friendState,
      required this.postState});

  @override
  State<ProfilePageUi> createState() => _ProfilePageUiState();
}

class _ProfilePageUiState extends State<ProfilePageUi> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMorePosts(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
        ),
        body: ListView.builder(
            controller: _scrollController,
            itemCount: 1 + widget.postState.total,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AccountImage(
                        username: widget.userState.userInfo.username,
                        avatar: widget.userState.userInfo.avatar,
                        coverImage: widget.userState.userInfo.coverImage,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            _mainButton(context),
                            const SizedBox(
                              width: 10.0,
                            ),
                            _profileSettingButton(context),
                          ]),
                          const Divider(
                            height: 20.0,
                            thickness: 2.0,
                          ),
                          GeneralInfoSection(
                            city: widget.userState.userInfo.city,
                            country: widget.userState.userInfo.country,
                            address: widget.userState.userInfo.address,
                          ),
                          const Divider(
                            height: 20.0,
                            thickness: 2.0,
                          ),
                          FriendSection(
                            friendState: widget.friendState,
                            userState: widget.userState,
                          ),
                          // _listPost(context),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                final post = convertToPostFromPostPayload(
                    widget.postState.posts[index - 1]);
                return PostWidget(post: post);
              }
            }));
  }

  void _loadMorePosts(BuildContext context) {
    widget.postState.loadMorePosts(context);
  }

  Widget _profileSettingButton(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey)),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileSettingPage(
                    userState: widget.userState,
                  ))),
          child: const Icon(Icons.more_horiz, color: Colors.black)),
    );
  }

  Widget _mainButton(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ElevatedButton(
        onPressed: () {},
        child:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Thêm vào tin",
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
