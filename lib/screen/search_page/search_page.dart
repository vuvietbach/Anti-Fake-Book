import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/layout/default_layer.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/screen/search_page/redux_actions.dart';
import 'package:anti_fake_book/screen/search_page/utils.dart';
import 'package:anti_fake_book/screen/search_page/widgets.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/widgets/common/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SavedSearchData> savedSearch = [];
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AntiFakeBookState> store) {
      getSavedSearch(
        context,
        GetSavedSearchRequest(index: 0, count: NUM_QUERY_PER_REQUEST),
        onSuccess: (GetSavedSearchResponse response) {
          var tmpList = getDisplaySearchHistory(response.data);
          setState(() {
            savedSearch = tmpList;
          });
        },
      );
    }, builder: (BuildContext context, Store<AntiFakeBookState> store) {
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
            title: CustomSearchBar(searchCallback: () {}),
          ),
          body: Column(
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
