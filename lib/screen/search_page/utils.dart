import 'package:anti_fake_book/models/base_apis/dto/response/search.dto.dart';

const int MAX_DISPLAY_RESULT = 20;

List<SavedSearchData> getDisplaySearchHistory(
    final List<SavedSearchData> searchHistory1) {
  // get unique values
  var searchHistory = [...searchHistory1];
  searchHistory.sort((a, b) => a.keyword.compareTo(b.keyword));
  List<SavedSearchData> uniqueValues = [];
  for (int i = 0; i < searchHistory.length; i++) {
    if (i == 0) {
      uniqueValues.add(searchHistory[i]);
    } else {
      if (searchHistory[i].keyword != searchHistory[i - 1].keyword) {
        uniqueValues.add(searchHistory[i]);
      }
    }
  }
  // sort by time
  uniqueValues.sort((a, b) {
    DateTime aTime = DateTime.parse(a.created);
    DateTime bTime = DateTime.parse(b.created);
    return aTime.isAfter(bTime) ? -1 : 1;
  });
  // if (searchHistory.length > MAX_DISPLAY_RESULT) {
  //   uniqueValues = searchHistory.sublist(0, MAX_DISPLAY_RESULT);
  // }
  return uniqueValues;
}
