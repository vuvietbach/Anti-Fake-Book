import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/HomePage/news_feed_tab.dart';
import 'package:anti_fake_book/screen/search_page/redux_actions.dart';
import 'package:anti_fake_book/screen/search_page/states.dart';
import 'package:anti_fake_book/screen/search_page/utils.dart';
import 'package:anti_fake_book/screen/search_page/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void _searchCallback(BuildContext context, String text) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SearchResultPage(
        keyword: text,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      getSavedSearch(
        context,
        GetSavedSearchRequest(index: 0, count: NUM_QUERY_PER_REQUEST),
      );
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
      // final savedSearch0 = store.state.searchState.savedSearch;
      // final savedSearch = getDisplaySearchHistory(savedSearch0);
      final savedSearch =
          getDisplaySearchHistory(store.state.searchState.savedSearch);
      return EmptyLayout(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: CustomSearchBar(
                searchCallback: (String text) =>
                    _searchCallback(context, text)),
          ),
          body: savedSearch.isEmpty
              ? _defaultSearchScreen(context)
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: savedSearch.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _titleAndEditButton(context);
                          } else {
                            return ListTile(
                              leading: const Icon(Icons.search),
                              title: Text(savedSearch[index - 1].keyword),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }

  Padding _titleAndEditButton(BuildContext context) {
    return Padding(
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
    );
  }

  Widget _defaultSearchScreen(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(children: [
          Image.asset(
            "assets/images/search_icon.png",
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              textAlign: TextAlign.center,
              "Hãy nhập vài từ để tìm kiếm trên Anti-Fakebook",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}

class SearchResultPage extends StatefulWidget {
  final String keyword;
  final String? userId;
  const SearchResultPage({super.key, required this.keyword, this.userId});

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
  late SearchState searchState;
  @override
  void initState() {
    super.initState();
    searchState = SearchState();
    searchState.search(context, widget.keyword,
        isFirstTime: true,
        userId: widget.userId, callback: (SearchState newState) {
      getSavedSearch(context,
          GetSavedSearchRequest(index: 0, count: NUM_QUERY_PER_REQUEST));
      setState(() {
        searchState = newState;
      });
    });
  }

  void _onAddMore() {
    searchState.search(context, widget.keyword,
        isFirstTime: false,
        userId: widget.userId, callback: (SearchState newState) {
      setState(() {
        searchState = newState;
      });
    });
  }

  Widget _listPost() {
    final listPost =
        searchState.searchResults.map((e) => convertToPost(e)).toList();
    return ListPost(
      listPost: listPost,
      onAddMore: _onAddMore,
    );
  }

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
        title: CustomSearchBar(
            placeholder: widget.keyword,
            readOnly: true,
            onClear: () => Navigator.of(context).pop()),
      ),
      body: Column(children: [
        _tab(),
        _listPost()
        // Expanded(
        //   child: _internetErrorMessage(),
        // )
      ]),
    );
  }

  Container _internetErrorMessage() {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    );
  }

  Container _tab() {
    return Container(
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
            }));
  }
}

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});
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
          InkWell(
            onTap: () => _deleteAllSearchHistory(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Xoá các tìm kiếm",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Expanded(child: _searchHistory())
        ]),
      ),
    );
  }

  _deleteAllSearchHistory(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Xoá tất cả tìm kiếm"),
            content: const Text(
                "Bạn có chắc chắn muốn xoá tất cả tìm kiếm? Thay đổi này sẽ không thể hoàn tác"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Huỷ")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    delSavedSearch(context, DelSavedSearchRequest(all: "1"));
                  },
                  child: const Text("Xoá"))
            ],
          );
        });
  }

  StoreBuilder<AntiFakeBookState> _searchHistory() {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      List<SavedSearchData> searchHistory = store.state.searchState.savedSearch;
      return ListView.builder(
          itemCount: searchHistory.length,
          itemBuilder: (context, index) {
            Widget child = Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: SearchHistoryItem(
                  data: store.state.searchState.savedSearch[index]),
            );
            bool hasTimestamp = false;
            if (index == 0) {
              hasTimestamp = true;
            } else {
              var date1 = DateTime.parse(searchHistory[index - 1].created);
              var date2 = DateTime.parse(searchHistory[index].created);
              if (date1.day != date2.day ||
                  date1.month != date2.month ||
                  date1.year != date2.year) {
                hasTimestamp = true;
              }
            }
            if (hasTimestamp) {
              DateTime date = DateTime.parse(searchHistory[index].created);
              child = Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${date.day} tháng ${date.month} ${date.year}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  child
                ],
              );
            }
            return child;
          });
    });
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
