import 'package:anti_fake_book/store/state/search/saved_search_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'saved_search.freezed.dart';
part 'saved_search.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SavedSearch with _$SavedSearch {
  const SavedSearch._();
  const factory SavedSearch({@Default([]) List<SavedSearchData> data}) =
      _SavedSearch;

  factory SavedSearch.fromJson(Map<String, dynamic> json) =>
      _$SavedSearchFromJson(json);
}
