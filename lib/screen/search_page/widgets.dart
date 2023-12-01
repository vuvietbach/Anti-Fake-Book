import 'package:anti_fake_book/models/base_apis/dto/request/search.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/search.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SearchHistoryItem extends StatelessWidget {
  final SavedSearchData data;
  const SearchHistoryItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        builder: (BuildContext context, Store<AntiFakeBookState> store) {
      return Row(
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
                Text("\"${data.keyword}\"",
                    style: const TextStyle(color: Colors.grey)),
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
          IconButton(
              onPressed: () {
                store.dispatch(DelSavedSearchAction(
                    data: DelSavedSearchRequest(
                        token: store.state.userState.token,
                        searchId: data.id)));
              },
              icon: const Icon(Icons.close))
        ],
      );
    });
  }
}
