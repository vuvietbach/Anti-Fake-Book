// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchStateImpl _$$SearchStateImplFromJson(Map<String, dynamic> json) =>
    _$SearchStateImpl(
      savedSearch: (json['savedSearch'] as List<dynamic>?)
              ?.map((e) => SavedSearchData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SearchStateImplToJson(_$SearchStateImpl instance) =>
    <String, dynamic>{
      'savedSearch': instance.savedSearch,
    };
