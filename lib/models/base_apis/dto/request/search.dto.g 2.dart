// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      keyword: const CustomStringConvert().fromJson(json['keyword']),
      userId: const CustomStringConvert().fromJson(json['user_id']),
      index: const CustomIntConverter().fromJson(json['index']),
      count: const CustomIntConverter().fromJson(json['count']),
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('keyword', const CustomStringConvert().toJson(instance.keyword));
  writeNotNull('user_id', const CustomStringConvert().toJson(instance.userId));
  writeNotNull('index', const CustomIntConverter().toJson(instance.index));
  writeNotNull('count', const CustomIntConverter().toJson(instance.count));
  return val;
}

GetSavedSearchRequest _$GetSavedSearchRequestFromJson(
        Map<String, dynamic> json) =>
    GetSavedSearchRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      index: const CustomIntConverter().fromJson(json['index']),
      count: const CustomIntConverter().fromJson(json['count']),
    );

Map<String, dynamic> _$GetSavedSearchRequestToJson(
    GetSavedSearchRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull('index', const CustomIntConverter().toJson(instance.index));
  writeNotNull('count', const CustomIntConverter().toJson(instance.count));
  return val;
}

DelSavedSearchRequest _$DelSavedSearchRequestFromJson(
        Map<String, dynamic> json) =>
    DelSavedSearchRequest(
      token: const CustomStringConvert().fromJson(json['token']),
      searchId: const CustomStringConvert().fromJson(json['search_id']),
      all: const CustomStringConvert().fromJson(json['all']),
    );

Map<String, dynamic> _$DelSavedSearchRequestToJson(
    DelSavedSearchRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', const CustomStringConvert().toJson(instance.token));
  writeNotNull(
      'search_id',
      _$JsonConverterToJson<dynamic, String>(
          instance.searchId, const CustomStringConvert().toJson));
  writeNotNull(
      'all',
      _$JsonConverterToJson<dynamic, String>(
          instance.all, const CustomStringConvert().toJson));
  return val;
}

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
