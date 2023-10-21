import 'package:flutter/material.dart';

import 'screen/HomePage.dart';
import 'screen/FriendPage.dart';
import 'screen/Menu.dart';
import 'screen/Notification.dart';
import 'screen/VideoPage.dart';
import 'screen/ShopPage.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text("AntiFakebook", style: TextStyle(color: Colors.blue.shade900)),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
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
                icon: Icon(Icons.shop, color: Colors.black),
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
              VideoPageContent(),
              FriendPageContent(),
              ShopPageContent(),
              NotificationContent(),
              MenuContent(),
            ],
          ),
        ),
      )
    );
  }
}
