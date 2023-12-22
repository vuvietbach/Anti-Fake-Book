import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/HomePage/news_feed_tab.dart';
import '../screen/HomePage/friend_tab.dart';
import '../screen/HomePage/menu_tab.dart';
import '../screen/HomePage/notification_tab.dart';
import '../screen/HomePage/watch_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5, // The number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text("AntiFakebook",
                style: TextStyle(color: Colors.blue.shade900)),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  context.go('/search');
                },
                icon: const Icon(Icons.search, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message, color: Colors.black),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.black),
                ),
                Tab(
                  icon: Icon(Icons.people, color: Colors.black),
                ),
                Tab(
                  icon: Icon(Icons.video_library, color: Colors.black),
                ),
                Tab(
                  icon: Icon(Icons.notifications, color: Colors.black),
                ),
                Tab(
                  icon: Icon(Icons.menu, color: Colors.black),
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.grey[300],
            child: TabBarView(
              children: [
                PostHomePageContent(),
                FriendPageContent(),
                WatchTabContent(),
                NotificationContent(),
                MenuContent(),
              ],
            ),
          ),
        ));
  }
}
