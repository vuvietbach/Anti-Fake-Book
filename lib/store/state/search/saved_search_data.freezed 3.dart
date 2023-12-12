// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_search_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedSearchData _$SavedSearchDataFromJson(Map<String, dynamic> json) {
  return _SavedSearchData.fromJson(json);
}

/// @nodoc
mixin _$SavedSearchData {
  String get id => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedSearchDataCopyWith<SavedSearchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedSearchDataCopyWith<$Res> {
  factory $SavedSearchDataCopyWith(
          SavedSearchData value, $Res Function(SavedSearchData) then) =
      _$SavedSearchDataCopyWithImpl<$Res, SavedSearchData>;
  @useResult
  $Res call({String id, String keyword, String created});
}

/// @nodoc
class _$SavedSearchDataCopyWithImpl<$Res, $Val extends SavedSearchData>
    implements $SavedSearchDataCopyWith<$Res> {
  _$SavedSearchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keyword = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedSearchDataImplCopyWith<$Res>
    implements $SavedSearchDataCopyWith<$Res> {
  factory _$$SavedSearchDataImplCopyWith(_$SavedSearchDataImpl value,
          $Res Function(_$SavedSearchDataImpl) then) =
      __$$SavedSearchDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String keyword, String created});
}

/// @nodoc
class __$$SavedSearchDataImplCopyWithImpl<$Res>
    extends _$SavedSearchDataCopyWithImpl<$Res, _$SavedSearchDataImpl>
    implements _$$SavedSearchDataImplCopyWith<$Res> {
  __$$SavedSearchDataImplCopyWithImpl(
      _$SavedSearchDataImpl _value, $Res Function(_$SavedSearchDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keyword = null,
    Object? created = null,
  }) {
    return _then(_$SavedSearchDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedSearchDataImpl extends _SavedSearchData {
  const _$SavedSearchDataImpl(
      {required this.id, required this.keyword, required this.created})
      : super._();

  factory _$SavedSearchDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedSearchDataImplFromJson(json);

  @override
  final String id;
  @override
  final String keyword;
  @override
  final String created;

  @override
  String toString() {
    return 'SavedSearchData(id: $id, keyword: $keyword, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedSearchDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, keyword, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedSearchDataImplCopyWith<_$SavedSearchDataImpl> get copyWith =>
      __$$SavedSearchDataImplCopyWithImpl<_$SavedSearchDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedSearchDataImplToJson(
      this,
    );
  }
}

abstract class _SavedSearchData extends SavedSearchData {
  const factory _SavedSearchData(
      {required final String id,
      required final String keyword,
      required final String created}) = _$SavedSearchDataImpl;
  const _SavedSearchData._() : super._();

  factory _SavedSearchData.fromJson(Map<String, dynamic> json) =
      _$SavedSearchDataImpl.fromJson;

  @override
  String get id;
  @override
  String get keyword;
  @override
  String get created;
  @override
  @JsonKey(ignore: true)
  _$$SavedSearchDataImplCopyWith<_$SavedSearchDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
