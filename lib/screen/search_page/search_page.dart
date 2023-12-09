import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/search_page/widgets.dart';
import 'package:anti_fake_book/store/actions/search.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      store.dispatch(GetSavedSearchAction(
        token: store.state.userState.token,
        // TODO: What is the meaning of index and count?
        data: GetSavedSearchRequest(
          index: 0,
          count: 20,
        ),
      ));
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
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
            searchCallback: () => {
              // store.dispatch(GetSavedSearchAction(
              //   // TODO: What is the meaning of index and count?
              //   data: GetSavedSearchRequest(
              //     token: store.state.userState.token,
              //     index: 0,
              //     count: 20,
              //   ),
              // ))
            },
            // searchCallback: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const SearchResultPage()))
          ),
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
                itemCount: store.state.searchState.savedSearch.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: IconButton(
                        icon: const Icon(Icons.search), onPressed: () {}),
                    title: Text(
                        store.state.searchState.savedSearch[index].keyword),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
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
          const Expanded(child: TimestampSearchSection())
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
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      List<SavedSearchData> searchHistory = store.state.searchState.savedSearch;
      return ListView.builder(
          itemCount: searchHistory.length,
          itemBuilder: (context, index) {
            if (index == 0 ||
                (index > 0 &&
                    searchHistory[index].created !=
                        searchHistory[index - 1].created)) {
              DateTime date = DateTime.parse(searchHistory[index].created);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${date.day} tháng ${date.month} ${date.year}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  SearchHistoryItem(
                      data: store.state.searchState.savedSearch[index])
                ],
              );
            } else {
              return SearchHistoryItem(
                  data: store.state.searchState.savedSearch[index]);
            }
          });
    });
  }
}
