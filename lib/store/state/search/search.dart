import 'package:anti_fake_book/models/base_apis/dto/response/search.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class SearchState with _$SearchState {
  const SearchState._();
  const factory SearchState({
    @Default([]) List<SavedSearchData> savedSearch,
  }) = _SearchState;

  factory SearchState.fromJson(Map<String, dynamic> json) =>
      _$SearchStateFromJson(json);
}
