import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_search_data.freezed.dart';
part 'saved_search_data.g.dart';

@freezed
class SavedSearchData with _$SavedSearchData {
  const SavedSearchData._();
  const factory SavedSearchData({
    required String id,
    required String keyword,
    required String created,
  }) = _SavedSearchData;

  factory SavedSearchData.fromJson(Map<String, Object?> json) =>
      _$SavedSearchDataFromJson(json);
}
