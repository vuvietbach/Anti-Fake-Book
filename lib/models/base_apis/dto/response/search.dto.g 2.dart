// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSavedSearchResponse _$GetSavedSearchResponseFromJson(
        Map<String, dynamic> json) =>
    GetSavedSearchResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
      data: (json['data'] as List<dynamic>)
          .map((e) => SavedSearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSavedSearchResponseToJson(
    GetSavedSearchResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  val['data'] = instance.data.map((e) => e.toJson()).toList();
  return val;
}

SavedSearchData _$SavedSearchDataFromJson(Map<String, dynamic> json) =>
    SavedSearchData(
      id: const CustomStringConvert().fromJson(json['id']),
      keyword: const CustomStringConvert().fromJson(json['keyword']),
      created: const CustomStringConvert().fromJson(json['created']),
    );

Map<String, dynamic> _$SavedSearchDataToJson(SavedSearchData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', const CustomStringConvert().toJson(instance.id));
  writeNotNull('keyword', const CustomStringConvert().toJson(instance.keyword));
  writeNotNull('created', const CustomStringConvert().toJson(instance.created));
  return val;
}

DelSavedSearchResponse _$DelSavedSearchResponseFromJson(
        Map<String, dynamic> json) =>
    DelSavedSearchResponse(
      code: const CustomIntConverter().fromJson(json['code']),
      message: const CustomStringConvert().fromJson(json['message']),
    );

Map<String, dynamic> _$DelSavedSearchResponseToJson(
    DelSavedSearchResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', const CustomIntConverter().toJson(instance.code));
  writeNotNull('message', const CustomStringConvert().toJson(instance.message));
  return val;
}
