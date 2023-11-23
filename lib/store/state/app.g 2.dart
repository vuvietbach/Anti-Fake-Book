// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      status: $enumDecodeNullable(_$AppStatusEnumMap, json['status']) ??
          AppStatus.loaded,
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'status': _$AppStatusEnumMap[instance.status]!,
    };

const _$AppStatusEnumMap = {
  AppStatus.loading: 'loading',
  AppStatus.loaded: 'loaded',
  AppStatus.error: 'error',
};
