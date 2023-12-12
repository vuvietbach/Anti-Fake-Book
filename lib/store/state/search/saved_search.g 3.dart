// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedSearchImpl _$$SavedSearchImplFromJson(Map<String, dynamic> json) =>
    _$SavedSearchImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SavedSearchData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SavedSearchImplToJson(_$SavedSearchImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
