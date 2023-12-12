// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedSearch _$SavedSearchFromJson(Map<String, dynamic> json) {
  return _SavedSearch.fromJson(json);
}

/// @nodoc
mixin _$SavedSearch {
  List<SavedSearchData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedSearchCopyWith<SavedSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedSearchCopyWith<$Res> {
  factory $SavedSearchCopyWith(
          SavedSearch value, $Res Function(SavedSearch) then) =
      _$SavedSearchCopyWithImpl<$Res, SavedSearch>;
  @useResult
  $Res call({List<SavedSearchData> data});
}

/// @nodoc
class _$SavedSearchCopyWithImpl<$Res, $Val extends SavedSearch>
    implements $SavedSearchCopyWith<$Res> {
  _$SavedSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SavedSearchData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedSearchImplCopyWith<$Res>
    implements $SavedSearchCopyWith<$Res> {
  factory _$$SavedSearchImplCopyWith(
          _$SavedSearchImpl value, $Res Function(_$SavedSearchImpl) then) =
      __$$SavedSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SavedSearchData> data});
}

/// @nodoc
class __$$SavedSearchImplCopyWithImpl<$Res>
    extends _$SavedSearchCopyWithImpl<$Res, _$SavedSearchImpl>
    implements _$$SavedSearchImplCopyWith<$Res> {
  __$$SavedSearchImplCopyWithImpl(
      _$SavedSearchImpl _value, $Res Function(_$SavedSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SavedSearchImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SavedSearchData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedSearchImpl extends _SavedSearch {
  const _$SavedSearchImpl({this.data = const []}) : super._();

  factory _$SavedSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedSearchImplFromJson(json);

  @override
  @JsonKey()
  final List<SavedSearchData> data;

  @override
  String toString() {
    return 'SavedSearch(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedSearchImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedSearchImplCopyWith<_$SavedSearchImpl> get copyWith =>
      __$$SavedSearchImplCopyWithImpl<_$SavedSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedSearchImplToJson(
      this,
    );
  }
}

abstract class _SavedSearch extends SavedSearch {
  const factory _SavedSearch({final List<SavedSearchData> data}) =
      _$SavedSearchImpl;
  const _SavedSearch._() : super._();

  factory _SavedSearch.fromJson(Map<String, dynamic> json) =
      _$SavedSearchImpl.fromJson;

  @override
  List<SavedSearchData> get data;
  @override
  @JsonKey(ignore: true)
  _$$SavedSearchImplCopyWith<_$SavedSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
