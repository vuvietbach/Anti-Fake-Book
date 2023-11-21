import 'package:anti_fake_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const List<String> searchResults = [
    'Search Result 1',
    'Search Result 2',
    'Search Result 3',
    'Search Result 3',

    'Search Result 3',

    'Search Result 3',

    'Search Result 3',

    'Search Result 3',

    'Search Result 3',

    // Add more search results as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove AppBar shadow
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          // onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: CustomSearchBar(
            searchCallback: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchResultPage()))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tìm kiếm gần đây",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchHistory())),
                    child: const Text(
                      "Chỉnh sửa",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.w300),
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                      icon: const Icon(Icons.search), onPressed: () {}),
                  title: Text(searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  static List<String> tabs = <String>[
    "Tất cả",
    "Bài viết",
    "Mọi người",
    "Nhóm",
    "Reels",
    "Sự kiện",
    "Video",
    "Ảnh",
    "Trang",
    "Marketplace",
    "Địa điểm"
    // Add more tabs as needed
  ];

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  int selectedTab = 0;
  final bool _networkError = false;
  final bool _isSubmitting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove AppBar shadow
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: CustomSearchBar(onClear: () => Navigator.of(context).pop()),
      ),
      body: Column(children: [
        Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 40.0,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SearchResultPage.tabs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Text(
                        SearchResultPage.tabs[index],
                        style: index == selectedTab
                            ? TextStyle(color: Theme.of(context).primaryColor)
                            : const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                })),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.grey[200],
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/no_internet.jpeg"),
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: 150.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Không thể tải kết quả"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.restart_alt), Text("Thử lại")],
                  )
                ]),
          ),
        )
      ]),
    );
  }
}

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  static const List<String> searchHistory = [
    'Search Hi',
    "Search Hi",
    "Search Hi",
    "Search Hi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove AppBar shadow
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Nhật ký hoạt động",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Xoá các tìm kiếm",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          const TimestampSearchSection()
        ]),
      ),
    );
  }
}

class TimestampSearchSection extends StatelessWidget {
  const TimestampSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("7 tháng 8 2020",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        Row(
          // direction: Axis.horizontal,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.grey),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bạn đã tìm kiếm trên Anti Fake Book",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("\"sửa chữa nhà\"",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.lock,
                        color: Colors.grey,
                        size: 13,
                      )),
                      TextSpan(
                          text: "Chỉ mình tôi - Đã ẩn khỏi dòng thời gian ",
                          style: TextStyle(color: Colors.grey, fontSize: 13))
                    ],
                  ))
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.close))
          ],
        )
      ],
    );
  }
}
