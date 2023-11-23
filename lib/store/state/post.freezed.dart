// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostState _$PostStateFromJson(Map<String, dynamic> json) {
  return _PostState.fromJson(json);
}

/// @nodoc
mixin _$PostState {
  PostPayloadDTO? get selected => throw _privateConstructorUsedError;
  set selected(PostPayloadDTO? value) => throw _privateConstructorUsedError;
  List<PostPayloadDTO>? get listSelections =>
      throw _privateConstructorUsedError;
  set listSelections(List<PostPayloadDTO>? value) =>
      throw _privateConstructorUsedError;
  int? get totalSelections => throw _privateConstructorUsedError;
  set totalSelections(int? value) => throw _privateConstructorUsedError;
  bool get isPosting => throw _privateConstructorUsedError;
  set isPosting(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
  @useResult
  $Res call(
      {PostPayloadDTO? selected,
      List<PostPayloadDTO>? listSelections,
      int? totalSelections,
      bool isPosting});

  $PostPayloadDTOCopyWith<$Res>? get selected;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = freezed,
    Object? listSelections = freezed,
    Object? totalSelections = freezed,
    Object? isPosting = null,
  }) {
    return _then(_value.copyWith(
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as PostPayloadDTO?,
      listSelections: freezed == listSelections
          ? _value.listSelections
          : listSelections // ignore: cast_nullable_to_non_nullable
              as List<PostPayloadDTO>?,
      totalSelections: freezed == totalSelections
          ? _value.totalSelections
          : totalSelections // ignore: cast_nullable_to_non_nullable
              as int?,
      isPosting: null == isPosting
          ? _value.isPosting
          : isPosting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostPayloadDTOCopyWith<$Res>? get selected {
    if (_value.selected == null) {
      return null;
    }

    return $PostPayloadDTOCopyWith<$Res>(_value.selected!, (value) {
      return _then(_value.copyWith(selected: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostStateImplCopyWith<$Res>
    implements $PostStateCopyWith<$Res> {
  factory _$$PostStateImplCopyWith(
          _$PostStateImpl value, $Res Function(_$PostStateImpl) then) =
      __$$PostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PostPayloadDTO? selected,
      List<PostPayloadDTO>? listSelections,
      int? totalSelections,
      bool isPosting});

  @override
  $PostPayloadDTOCopyWith<$Res>? get selected;
}

/// @nodoc
class __$$PostStateImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostStateImpl>
    implements _$$PostStateImplCopyWith<$Res> {
  __$$PostStateImplCopyWithImpl(
      _$PostStateImpl _value, $Res Function(_$PostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = freezed,
    Object? listSelections = freezed,
    Object? totalSelections = freezed,
    Object? isPosting = null,
  }) {
    return _then(_$PostStateImpl(
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as PostPayloadDTO?,
      listSelections: freezed == listSelections
          ? _value.listSelections
          : listSelections // ignore: cast_nullable_to_non_nullable
              as List<PostPayloadDTO>?,
      totalSelections: freezed == totalSelections
          ? _value.totalSelections
          : totalSelections // ignore: cast_nullable_to_non_nullable
              as int?,
      isPosting: null == isPosting
          ? _value.isPosting
          : isPosting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostStateImpl implements _PostState {
  _$PostStateImpl(
      {this.selected = const PostPayloadDTO(),
      this.listSelections = const [],
      this.totalSelections = 0,
      this.isPosting = false});

  factory _$PostStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostStateImplFromJson(json);

  @override
  @JsonKey()
  PostPayloadDTO? selected;
  @override
  @JsonKey()
  List<PostPayloadDTO>? listSelections;
  @override
  @JsonKey()
  int? totalSelections;
  @override
  @JsonKey()
  bool isPosting;

  @override
  String toString() {
    return 'PostState(selected: $selected, listSelections: $listSelections, totalSelections: $totalSelections, isPosting: $isPosting)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      __$$PostStateImplCopyWithImpl<_$PostStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostStateImplToJson(
      this,
    );
  }
}

abstract class _PostState implements PostState {
  factory _PostState(
      {PostPayloadDTO? selected,
      List<PostPayloadDTO>? listSelections,
      int? totalSelections,
      bool isPosting}) = _$PostStateImpl;

  factory _PostState.fromJson(Map<String, dynamic> json) =
      _$PostStateImpl.fromJson;

  @override
  PostPayloadDTO? get selected;
  set selected(PostPayloadDTO? value);
  @override
  List<PostPayloadDTO>? get listSelections;
  set listSelections(List<PostPayloadDTO>? value);
  @override
  int? get totalSelections;
  set totalSelections(int? value);
  @override
  bool get isPosting;
  set isPosting(bool value);
  @override
  @JsonKey(ignore: true)
  _$$PostStateImplCopyWith<_$PostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
