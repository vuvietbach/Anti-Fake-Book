import 'package:anti_fake_book/utils.dart';
part 'search.dto.g.dart';

// @customJsonSerializable
// class SearchResponse {

// }
@customJsonSerializable
class SearchResponse {
  final int code;
  final String message;
  final SearchResponseData data;
  SearchResponse(
      {required this.code, required this.message, required this.data});
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@customJsonSerializable
class SearchResponseData {
  final List<SearchResultItem> items;
  final int total;
  SearchResponseData({required this.items, required this.total});
  factory SearchResponseData.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseDataToJson(this);
}

@customJsonSerializable
class SearchResultItem {
  final String id;
  final String name;
  final List<String>? image;
  final VideoData? video;
  final int feel;
  final int markComment;
  final int isFelt;
  final AuthorData author;
  final String described;
  final String created;
  final String state;
  SearchResultItem(
      {required this.id,
      required this.name,
      required this.image,
      required this.video,
      required this.feel,
      required this.markComment,
      required this.isFelt,
      required this.author,
      required this.described,
      required this.created,
      required this.state});
  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);
}

@customJsonSerializable
class VideoData {
  final String thumb;
  final String url;
  VideoData({
    required this.url,
    required this.thumb,
  });
  factory VideoData.fromJson(Map<String, dynamic> json) =>
      _$VideoDataFromJson(json);
  Map<String, dynamic> toJson() => _$VideoDataToJson(this);
}

@customJsonSerializable
class AuthorData {
  final String id;
  final String username;
  final String avatar;
  AuthorData({
    required this.id,
    required this.username,
    required this.avatar,
  });
  factory AuthorData.fromJson(Map<String, dynamic> json) =>
      _$AuthorDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorDataToJson(this);
}

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
  final String keyword;
  final String created;

  SavedSearchData(
      {required this.id, required this.keyword, required this.created});
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
