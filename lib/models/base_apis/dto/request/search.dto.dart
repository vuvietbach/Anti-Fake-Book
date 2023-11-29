import 'package:json_annotation/json_annotation.dart';

part 'search.dto.g.dart';

@JsonSerializable()
class SearchRequest {
  final String token;
  final String keyword;
  @JsonKey(name: "user_id")
  final String userId;
  final int index;
  final int count;
  SearchRequest(
      {required this.token,
      required this.keyword,
      required this.userId,
      required this.index,
      required this.count});
  
  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);

}

@JsonSerializable()
class GetSavedSearchRequest {
  final String token;
  final int index;
  final int count;
  GetSavedSearchRequest({required this.token, required this.index, required this.count});
  
  factory GetSavedSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSavedSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSavedSearchRequestToJson(this);
}

@JsonSerializable()
class DelSavedSearchRequest {
  final String token;
  @JsonKey(name: "search_id")
  final String? searchId;
  final String? all; 

  DelSavedSearchRequest({required this.token, this.searchId, this.all});
  
  factory DelSavedSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$DelSavedSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DelSavedSearchRequestToJson(this);

}

