// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationState _$ConversationStateFromJson(Map<String, dynamic> json) {
  return _ConversationState.fromJson(json);
}

/// @nodoc
mixin _$ConversationState {
  List<ConversationInfo> get conversations =>
      throw _privateConstructorUsedError;
  ConversationMetadata get currentConversation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationStateCopyWith<ConversationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationStateCopyWith<$Res> {
  factory $ConversationStateCopyWith(
          ConversationState value, $Res Function(ConversationState) then) =
      _$ConversationStateCopyWithImpl<$Res, ConversationState>;
  @useResult
  $Res call(
      {List<ConversationInfo> conversations,
      ConversationMetadata currentConversation});
}

/// @nodoc
class _$ConversationStateCopyWithImpl<$Res, $Val extends ConversationState>
    implements $ConversationStateCopyWith<$Res> {
  _$ConversationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? currentConversation = null,
  }) {
    return _then(_value.copyWith(
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationInfo>,
      currentConversation: null == currentConversation
          ? _value.currentConversation
          : currentConversation // ignore: cast_nullable_to_non_nullable
              as ConversationMetadata,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationStateImplCopyWith<$Res>
    implements $ConversationStateCopyWith<$Res> {
  factory _$$ConversationStateImplCopyWith(_$ConversationStateImpl value,
          $Res Function(_$ConversationStateImpl) then) =
      __$$ConversationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ConversationInfo> conversations,
      ConversationMetadata currentConversation});
}

/// @nodoc
class __$$ConversationStateImplCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$ConversationStateImpl>
    implements _$$ConversationStateImplCopyWith<$Res> {
  __$$ConversationStateImplCopyWithImpl(_$ConversationStateImpl _value,
      $Res Function(_$ConversationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? currentConversation = null,
  }) {
    return _then(_$ConversationStateImpl(
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationInfo>,
      currentConversation: null == currentConversation
          ? _value.currentConversation
          : currentConversation // ignore: cast_nullable_to_non_nullable
              as ConversationMetadata,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationStateImpl implements _ConversationState {
  _$ConversationStateImpl(
      {this.conversations = const [],
      this.currentConversation =
          const ConversationMetadata(isBlocked: 0, conversation: [])});

  factory _$ConversationStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationStateImplFromJson(json);

  @override
  @JsonKey()
  final List<ConversationInfo> conversations;
  @override
  @JsonKey()
  final ConversationMetadata currentConversation;

  @override
  String toString() {
    return 'ConversationState(conversations: $conversations, currentConversation: $currentConversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationStateImpl &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations) &&
            (identical(other.currentConversation, currentConversation) ||
                other.currentConversation == currentConversation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(conversations), currentConversation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationStateImplCopyWith<_$ConversationStateImpl> get copyWith =>
      __$$ConversationStateImplCopyWithImpl<_$ConversationStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationStateImplToJson(
      this,
    );
  }
}

abstract class _ConversationState implements ConversationState {
  factory _ConversationState(
          {final List<ConversationInfo> conversations,
          final ConversationMetadata currentConversation}) =
      _$ConversationStateImpl;

  factory _ConversationState.fromJson(Map<String, dynamic> json) =
      _$ConversationStateImpl.fromJson;

  @override
  List<ConversationInfo> get conversations;
  @override
  ConversationMetadata get currentConversation;
  @override
  @JsonKey(ignore: true)
  _$$ConversationStateImplCopyWith<_$ConversationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
