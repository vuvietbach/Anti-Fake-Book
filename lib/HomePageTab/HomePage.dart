import 'package:flutter/material.dart';

class PostHomePageContent extends StatefulWidget {
  @override
  _PostHomePageContentState createState() => _PostHomePageContentState();
}

class _PostHomePageContentState extends State<PostHomePageContent> {
  ScrollController _scrollController = ScrollController();
  int numberOfContainers = 3;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreContainers();
      } else if (_scrollController.position.pixels == 0) {
        loadMoreContainers();
      }
    });
  }

  void loadMoreContainers() {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        numberOfContainers += 3;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: numberOfContainers + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < numberOfContainers) {
          return Container(
            height: 500,
            width: 200,
            color: Colors.deepPurple,
            margin: EdgeInsets.only(bottom: 5),
          );
        } else if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}

class PostHomePage extends StatelessWidget {
  const PostHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return PostHomePageContent();
  }
}
