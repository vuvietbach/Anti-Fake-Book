// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AntiFakeBookState _$AntiFakeBookStateFromJson(Map<String, dynamic> json) {
  return _AntiFakeBookState.fromJson(json);
}

/// @nodoc
mixin _$AntiFakeBookState {
  AppState get appState => throw _privateConstructorUsedError;
  PostState get postState => throw _privateConstructorUsedError;
  UserState get userState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AntiFakeBookStateCopyWith<AntiFakeBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AntiFakeBookStateCopyWith<$Res> {
  factory $AntiFakeBookStateCopyWith(
          AntiFakeBookState value, $Res Function(AntiFakeBookState) then) =
      _$AntiFakeBookStateCopyWithImpl<$Res, AntiFakeBookState>;
  @useResult
  $Res call({AppState appState, PostState postState, UserState userState});

  $AppStateCopyWith<$Res> get appState;
  $PostStateCopyWith<$Res> get postState;
  $UserStateCopyWith<$Res> get userState;
}

/// @nodoc
class _$AntiFakeBookStateCopyWithImpl<$Res, $Val extends AntiFakeBookState>
    implements $AntiFakeBookStateCopyWith<$Res> {
  _$AntiFakeBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appState = null,
    Object? postState = null,
    Object? userState = null,
  }) {
    return _then(_value.copyWith(
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      postState: null == postState
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as PostState,
      userState: null == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<$Res> get appState {
    return $AppStateCopyWith<$Res>(_value.appState, (value) {
      return _then(_value.copyWith(appState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostStateCopyWith<$Res> get postState {
    return $PostStateCopyWith<$Res>(_value.postState, (value) {
      return _then(_value.copyWith(postState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res> get userState {
    return $UserStateCopyWith<$Res>(_value.userState, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AntiFakeBookStateImplCopyWith<$Res>
    implements $AntiFakeBookStateCopyWith<$Res> {
  factory _$$AntiFakeBookStateImplCopyWith(_$AntiFakeBookStateImpl value,
          $Res Function(_$AntiFakeBookStateImpl) then) =
      __$$AntiFakeBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppState appState, PostState postState, UserState userState});

  @override
  $AppStateCopyWith<$Res> get appState;
  @override
  $PostStateCopyWith<$Res> get postState;
  @override
  $UserStateCopyWith<$Res> get userState;
}

/// @nodoc
class __$$AntiFakeBookStateImplCopyWithImpl<$Res>
    extends _$AntiFakeBookStateCopyWithImpl<$Res, _$AntiFakeBookStateImpl>
    implements _$$AntiFakeBookStateImplCopyWith<$Res> {
  __$$AntiFakeBookStateImplCopyWithImpl(_$AntiFakeBookStateImpl _value,
      $Res Function(_$AntiFakeBookStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appState = null,
    Object? postState = null,
    Object? userState = null,
  }) {
    return _then(_$AntiFakeBookStateImpl(
      appState: null == appState
          ? _value.appState
          : appState // ignore: cast_nullable_to_non_nullable
              as AppState,
      postState: null == postState
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as PostState,
      userState: null == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$AntiFakeBookStateImpl implements _AntiFakeBookState {
  _$AntiFakeBookStateImpl(
      {required this.appState,
      required this.postState,
      required this.userState});

  factory _$AntiFakeBookStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AntiFakeBookStateImplFromJson(json);

  @override
  final AppState appState;
  @override
  final PostState postState;
  @override
  final UserState userState;

  @override
  String toString() {
    return 'AntiFakeBookState(appState: $appState, postState: $postState, userState: $userState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AntiFakeBookStateImpl &&
            (identical(other.appState, appState) ||
                other.appState == appState) &&
            (identical(other.postState, postState) ||
                other.postState == postState) &&
            (identical(other.userState, userState) ||
                other.userState == userState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appState, postState, userState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AntiFakeBookStateImplCopyWith<_$AntiFakeBookStateImpl> get copyWith =>
      __$$AntiFakeBookStateImplCopyWithImpl<_$AntiFakeBookStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AntiFakeBookStateImplToJson(
      this,
    );
  }
}

abstract class _AntiFakeBookState implements AntiFakeBookState {
  factory _AntiFakeBookState(
      {required final AppState appState,
      required final PostState postState,
      required final UserState userState}) = _$AntiFakeBookStateImpl;

  factory _AntiFakeBookState.fromJson(Map<String, dynamic> json) =
      _$AntiFakeBookStateImpl.fromJson;

  @override
  AppState get appState;
  @override
  PostState get postState;
  @override
  UserState get userState;
  @override
  @JsonKey(ignore: true)
  _$$AntiFakeBookStateImplCopyWith<_$AntiFakeBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
