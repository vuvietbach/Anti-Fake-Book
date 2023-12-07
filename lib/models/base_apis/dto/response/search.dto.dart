import 'package:anti_fake_book/utils.dart';
part 'search.dto.g.dart';

// @customJsonSerializable
// class SearchResponse {

// }

@customJsonSerializable
class GetSavedSearchResponse {
  final int code;
  final String message;
  List<SavedSearchData> data;
  GetSavedSearchResponse(
      {required this.code, required this.message, required this.data});
  factory GetSavedSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSavedSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetSavedSearchResponseToJson(this);
}

@customJsonSerializable
class SavedSearchData {
  final String id;
  final String code;
  final String created;

  SavedSearchData(
      {required this.id, required this.code, required this.created});
  factory SavedSearchData.fromJson(Map<String, dynamic> json) =>
      _$SavedSearchDataFromJson(json);
  Map<String, dynamic> toJson() => _$SavedSearchDataToJson(this);
}

@customJsonSerializable
class DelSavedSearchResponse {
  final int code;
  final String message;
  DelSavedSearchResponse({required this.code, required this.message});
  factory DelSavedSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$DelSavedSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DelSavedSearchResponseToJson(this);
}
