import 'package:anti_fake_book/utils.dart';

part 'search.dto.g.dart';

@customJsonSerializable
class SearchRequest {
  final String keyword;
  final String userId;
  final int index;
  final int count;
  SearchRequest(
      {required this.keyword,
      required this.userId,
      required this.index,
      required this.count});

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}

@customJsonSerializable
class GetSavedSearchRequest {
  final int index;
  final int count;
  GetSavedSearchRequest({required this.index, required this.count});

  factory GetSavedSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSavedSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSavedSearchRequestToJson(this);
}

@customJsonSerializable
class DelSavedSearchRequest {
  final String? searchId;
  final String? all;

  DelSavedSearchRequest({this.searchId, this.all});

  factory DelSavedSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$DelSavedSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DelSavedSearchRequestToJson(this);
}
