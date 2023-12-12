// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      status: $enumDecodeNullable(_$AppStatusEnumMap, json['status']) ??
          AppStatus.loaded,
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'status': _$AppStatusEnumMap[instance.status]!,
    };

const _$AppStatusEnumMap = {
  AppStatus.loading: 'loading',
  AppStatus.loaded: 'loaded',
  AppStatus.error: 'error',
};
