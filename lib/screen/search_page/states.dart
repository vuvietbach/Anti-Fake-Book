import 'package:anti_fake_book/constants/constants.dart';
import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/search.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:flutter/material.dart';

class SearchState {
  final List<SearchResultItem> searchResults;
  SearchState({this.searchResults = const []});
  void search(BuildContext context, String keyword,
      {Function(SearchState)? callback,
      bool isFirstTime = true,
      String? userId}) {
    int index = isFirstTime ? 0 : searchResults.length;
    SearchRequest data = SearchRequest(
        index: index,
        count: NUM_QUERY_PER_REQUEST,
        keyword: keyword,
        userId: userId);
    callAPI(context, () async {
      final response = await ApiModel.api.search(data);
      final newState = SearchState(searchResults: response.data);
      callback?.call(newState);
    });
  }

  bool isEmpty() {
    return searchResults.isEmpty;
  }
}
