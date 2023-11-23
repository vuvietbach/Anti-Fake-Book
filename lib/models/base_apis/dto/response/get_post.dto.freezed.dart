// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_post.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPostResponseDTO _$GetPostResponseDTOFromJson(Map<String, dynamic> json) {
  return _GetPostResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$GetPostResponseDTO {
  PostPayloadDTO get data => throw _privateConstructorUsedError;
  set data(PostPayloadDTO value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPostResponseDTOCopyWith<GetPostResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostResponseDTOCopyWith<$Res> {
  factory $GetPostResponseDTOCopyWith(
          GetPostResponseDTO value, $Res Function(GetPostResponseDTO) then) =
      _$GetPostResponseDTOCopyWithImpl<$Res, GetPostResponseDTO>;
  @useResult
  $Res call({PostPayloadDTO data});

  $PostPayloadDTOCopyWith<$Res> get data;
}

/// @nodoc
class _$GetPostResponseDTOCopyWithImpl<$Res, $Val extends GetPostResponseDTO>
    implements $GetPostResponseDTOCopyWith<$Res> {
  _$GetPostResponseDTOCopyWithImpl(this._value, this._then);

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
              as PostPayloadDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostPayloadDTOCopyWith<$Res> get data {
    return $PostPayloadDTOCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetPostResponseDTOImplCopyWith<$Res>
    implements $GetPostResponseDTOCopyWith<$Res> {
  factory _$$GetPostResponseDTOImplCopyWith(_$GetPostResponseDTOImpl value,
          $Res Function(_$GetPostResponseDTOImpl) then) =
      __$$GetPostResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostPayloadDTO data});

  @override
  $PostPayloadDTOCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetPostResponseDTOImplCopyWithImpl<$Res>
    extends _$GetPostResponseDTOCopyWithImpl<$Res, _$GetPostResponseDTOImpl>
    implements _$$GetPostResponseDTOImplCopyWith<$Res> {
  __$$GetPostResponseDTOImplCopyWithImpl(_$GetPostResponseDTOImpl _value,
      $Res Function(_$GetPostResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetPostResponseDTOImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PostPayloadDTO,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$GetPostResponseDTOImpl implements _GetPostResponseDTO {
  _$GetPostResponseDTOImpl({required this.data});

  factory _$GetPostResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPostResponseDTOImplFromJson(json);

  @override
  PostPayloadDTO data;

  @override
  String toString() {
    return 'GetPostResponseDTO(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostResponseDTOImplCopyWith<_$GetPostResponseDTOImpl> get copyWith =>
      __$$GetPostResponseDTOImplCopyWithImpl<_$GetPostResponseDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPostResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _GetPostResponseDTO implements GetPostResponseDTO {
  factory _GetPostResponseDTO({required PostPayloadDTO data}) =
      _$GetPostResponseDTOImpl;

  factory _GetPostResponseDTO.fromJson(Map<String, dynamic> json) =
      _$GetPostResponseDTOImpl.fromJson;

  @override
  PostPayloadDTO get data;
  set data(PostPayloadDTO value);
  @override
  @JsonKey(ignore: true)
  _$$GetPostResponseDTOImplCopyWith<_$GetPostResponseDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostPayloadDTO _$PostPayloadDTOFromJson(Map<String, dynamic> json) {
  return _PostPayloadDTO.fromJson(json);
}

/// @nodoc
mixin _$PostPayloadDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  DateTime? get modified => throw _privateConstructorUsedError;
  int? get fake => throw _privateConstructorUsedError;
  int? get trust => throw _privateConstructorUsedError;
  int? get kudos => throw _privateConstructorUsedError;
  int? get disappointed => throw _privateConstructorUsedError;
  bool? get isRated => throw _privateConstructorUsedError;
  bool? get isMarked => throw _privateConstructorUsedError;
  List<ImagePayloadDTO> get images => throw _privateConstructorUsedError;
  List<VideoPayloadDTO> get video => throw _privateConstructorUsedError;
  AuthorPostPayloadDTO? get author => throw _privateConstructorUsedError;
  PostCategory? get category => throw _privateConstructorUsedError;
  int? get state => throw _privateConstructorUsedError;
  bool? get isBlock => throw _privateConstructorUsedError;
  bool? get canEdit => throw _privateConstructorUsedError;
  bool? get banned => throw _privateConstructorUsedError;
  int? get canMark => throw _privateConstructorUsedError;
  int? get canRate => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostPayloadDTOCopyWith<PostPayloadDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPayloadDTOCopyWith<$Res> {
  factory $PostPayloadDTOCopyWith(
          PostPayloadDTO value, $Res Function(PostPayloadDTO) then) =
      _$PostPayloadDTOCopyWithImpl<$Res, PostPayloadDTO>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      DateTime? created,
      DateTime? modified,
      int? fake,
      int? trust,
      int? kudos,
      int? disappointed,
      bool? isRated,
      bool? isMarked,
      List<ImagePayloadDTO> images,
      List<VideoPayloadDTO> video,
      AuthorPostPayloadDTO? author,
      PostCategory? category,
      int? state,
      bool? isBlock,
      bool? canEdit,
      bool? banned,
      int? canMark,
      int? canRate,
      String? url,
      String? messages});

  $AuthorPostPayloadDTOCopyWith<$Res>? get author;
  $PostCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$PostPayloadDTOCopyWithImpl<$Res, $Val extends PostPayloadDTO>
    implements $PostPayloadDTOCopyWith<$Res> {
  _$PostPayloadDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? created = freezed,
    Object? modified = freezed,
    Object? fake = freezed,
    Object? trust = freezed,
    Object? kudos = freezed,
    Object? disappointed = freezed,
    Object? isRated = freezed,
    Object? isMarked = freezed,
    Object? images = null,
    Object? video = null,
    Object? author = freezed,
    Object? category = freezed,
    Object? state = freezed,
    Object? isBlock = freezed,
    Object? canEdit = freezed,
    Object? banned = freezed,
    Object? canMark = freezed,
    Object? canRate = freezed,
    Object? url = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fake: freezed == fake
          ? _value.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as int?,
      trust: freezed == trust
          ? _value.trust
          : trust // ignore: cast_nullable_to_non_nullable
              as int?,
      kudos: freezed == kudos
          ? _value.kudos
          : kudos // ignore: cast_nullable_to_non_nullable
              as int?,
      disappointed: freezed == disappointed
          ? _value.disappointed
          : disappointed // ignore: cast_nullable_to_non_nullable
              as int?,
      isRated: freezed == isRated
          ? _value.isRated
          : isRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMarked: freezed == isMarked
          ? _value.isMarked
          : isMarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagePayloadDTO>,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as List<VideoPayloadDTO>,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorPostPayloadDTO?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PostCategory?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      isBlock: freezed == isBlock
          ? _value.isBlock
          : isBlock // ignore: cast_nullable_to_non_nullable
              as bool?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      banned: freezed == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool?,
      canMark: freezed == canMark
          ? _value.canMark
          : canMark // ignore: cast_nullable_to_non_nullable
              as int?,
      canRate: freezed == canRate
          ? _value.canRate
          : canRate // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorPostPayloadDTOCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $AuthorPostPayloadDTOCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $PostCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostPayloadDTOImplCopyWith<$Res>
    implements $PostPayloadDTOCopyWith<$Res> {
  factory _$$PostPayloadDTOImplCopyWith(_$PostPayloadDTOImpl value,
          $Res Function(_$PostPayloadDTOImpl) then) =
      __$$PostPayloadDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      DateTime? created,
      DateTime? modified,
      int? fake,
      int? trust,
      int? kudos,
      int? disappointed,
      bool? isRated,
      bool? isMarked,
      List<ImagePayloadDTO> images,
      List<VideoPayloadDTO> video,
      AuthorPostPayloadDTO? author,
      PostCategory? category,
      int? state,
      bool? isBlock,
      bool? canEdit,
      bool? banned,
      int? canMark,
      int? canRate,
      String? url,
      String? messages});

  @override
  $AuthorPostPayloadDTOCopyWith<$Res>? get author;
  @override
  $PostCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$PostPayloadDTOImplCopyWithImpl<$Res>
    extends _$PostPayloadDTOCopyWithImpl<$Res, _$PostPayloadDTOImpl>
    implements _$$PostPayloadDTOImplCopyWith<$Res> {
  __$$PostPayloadDTOImplCopyWithImpl(
      _$PostPayloadDTOImpl _value, $Res Function(_$PostPayloadDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? created = freezed,
    Object? modified = freezed,
    Object? fake = freezed,
    Object? trust = freezed,
    Object? kudos = freezed,
    Object? disappointed = freezed,
    Object? isRated = freezed,
    Object? isMarked = freezed,
    Object? images = null,
    Object? video = null,
    Object? author = freezed,
    Object? category = freezed,
    Object? state = freezed,
    Object? isBlock = freezed,
    Object? canEdit = freezed,
    Object? banned = freezed,
    Object? canMark = freezed,
    Object? canRate = freezed,
    Object? url = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$PostPayloadDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fake: freezed == fake
          ? _value.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as int?,
      trust: freezed == trust
          ? _value.trust
          : trust // ignore: cast_nullable_to_non_nullable
              as int?,
      kudos: freezed == kudos
          ? _value.kudos
          : kudos // ignore: cast_nullable_to_non_nullable
              as int?,
      disappointed: freezed == disappointed
          ? _value.disappointed
          : disappointed // ignore: cast_nullable_to_non_nullable
              as int?,
      isRated: freezed == isRated
          ? _value.isRated
          : isRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMarked: freezed == isMarked
          ? _value.isMarked
          : isMarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagePayloadDTO>,
      video: null == video
          ? _value._video
          : video // ignore: cast_nullable_to_non_nullable
              as List<VideoPayloadDTO>,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorPostPayloadDTO?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PostCategory?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      isBlock: freezed == isBlock
          ? _value.isBlock
          : isBlock // ignore: cast_nullable_to_non_nullable
              as bool?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      banned: freezed == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool?,
      canMark: freezed == canMark
          ? _value.canMark
          : canMark // ignore: cast_nullable_to_non_nullable
              as int?,
      canRate: freezed == canRate
          ? _value.canRate
          : canRate // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$PostPayloadDTOImpl implements _PostPayloadDTO {
  const _$PostPayloadDTOImpl(
      {this.id,
      this.name,
      this.created,
      this.modified,
      this.fake,
      this.trust,
      this.kudos,
      this.disappointed,
      this.isRated,
      this.isMarked,
      final List<ImagePayloadDTO> images = const [],
      final List<VideoPayloadDTO> video = const [],
      this.author,
      this.category,
      this.state,
      this.isBlock,
      this.canEdit,
      this.banned,
      this.canMark,
      this.canRate,
      this.url,
      this.messages})
      : _images = images,
        _video = video;

  factory _$PostPayloadDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostPayloadDTOImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final DateTime? created;
  @override
  final DateTime? modified;
  @override
  final int? fake;
  @override
  final int? trust;
  @override
  final int? kudos;
  @override
  final int? disappointed;
  @override
  final bool? isRated;
  @override
  final bool? isMarked;
  final List<ImagePayloadDTO> _images;
  @override
  @JsonKey()
  List<ImagePayloadDTO> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<VideoPayloadDTO> _video;
  @override
  @JsonKey()
  List<VideoPayloadDTO> get video {
    if (_video is EqualUnmodifiableListView) return _video;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_video);
  }

  @override
  final AuthorPostPayloadDTO? author;
  @override
  final PostCategory? category;
  @override
  final int? state;
  @override
  final bool? isBlock;
  @override
  final bool? canEdit;
  @override
  final bool? banned;
  @override
  final int? canMark;
  @override
  final int? canRate;
  @override
  final String? url;
  @override
  final String? messages;

  @override
  String toString() {
    return 'PostPayloadDTO(id: $id, name: $name, created: $created, modified: $modified, fake: $fake, trust: $trust, kudos: $kudos, disappointed: $disappointed, isRated: $isRated, isMarked: $isMarked, images: $images, video: $video, author: $author, category: $category, state: $state, isBlock: $isBlock, canEdit: $canEdit, banned: $banned, canMark: $canMark, canRate: $canRate, url: $url, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostPayloadDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.fake, fake) || other.fake == fake) &&
            (identical(other.trust, trust) || other.trust == trust) &&
            (identical(other.kudos, kudos) || other.kudos == kudos) &&
            (identical(other.disappointed, disappointed) ||
                other.disappointed == disappointed) &&
            (identical(other.isRated, isRated) || other.isRated == isRated) &&
            (identical(other.isMarked, isMarked) ||
                other.isMarked == isMarked) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._video, _video) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isBlock, isBlock) || other.isBlock == isBlock) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.canMark, canMark) || other.canMark == canMark) &&
            (identical(other.canRate, canRate) || other.canRate == canRate) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        created,
        modified,
        fake,
        trust,
        kudos,
        disappointed,
        isRated,
        isMarked,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_video),
        author,
        category,
        state,
        isBlock,
        canEdit,
        banned,
        canMark,
        canRate,
        url,
        messages
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostPayloadDTOImplCopyWith<_$PostPayloadDTOImpl> get copyWith =>
      __$$PostPayloadDTOImplCopyWithImpl<_$PostPayloadDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostPayloadDTOImplToJson(
      this,
    );
  }
}

abstract class _PostPayloadDTO implements PostPayloadDTO {
  const factory _PostPayloadDTO(
      {final String? id,
      final String? name,
      final DateTime? created,
      final DateTime? modified,
      final int? fake,
      final int? trust,
      final int? kudos,
      final int? disappointed,
      final bool? isRated,
      final bool? isMarked,
      final List<ImagePayloadDTO> images,
      final List<VideoPayloadDTO> video,
      final AuthorPostPayloadDTO? author,
      final PostCategory? category,
      final int? state,
      final bool? isBlock,
      final bool? canEdit,
      final bool? banned,
      final int? canMark,
      final int? canRate,
      final String? url,
      final String? messages}) = _$PostPayloadDTOImpl;

  factory _PostPayloadDTO.fromJson(Map<String, dynamic> json) =
      _$PostPayloadDTOImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  DateTime? get created;
  @override
  DateTime? get modified;
  @override
  int? get fake;
  @override
  int? get trust;
  @override
  int? get kudos;
  @override
  int? get disappointed;
  @override
  bool? get isRated;
  @override
  bool? get isMarked;
  @override
  List<ImagePayloadDTO> get images;
  @override
  List<VideoPayloadDTO> get video;
  @override
  AuthorPostPayloadDTO? get author;
  @override
  PostCategory? get category;
  @override
  int? get state;
  @override
  bool? get isBlock;
  @override
  bool? get canEdit;
  @override
  bool? get banned;
  @override
  int? get canMark;
  @override
  int? get canRate;
  @override
  String? get url;
  @override
  String? get messages;
  @override
  @JsonKey(ignore: true)
  _$$PostPayloadDTOImplCopyWith<_$PostPayloadDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostCategory _$PostCategoryFromJson(Map<String, dynamic> json) {
  return _PostCategory.fromJson(json);
}

/// @nodoc
mixin _$PostCategory {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get hasName => throw _privateConstructorUsedError;
  set hasName(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCategoryCopyWith<PostCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCategoryCopyWith<$Res> {
  factory $PostCategoryCopyWith(
          PostCategory value, $Res Function(PostCategory) then) =
      _$PostCategoryCopyWithImpl<$Res, PostCategory>;
  @useResult
  $Res call({String? id, String? name, String? hasName});
}

/// @nodoc
class _$PostCategoryCopyWithImpl<$Res, $Val extends PostCategory>
    implements $PostCategoryCopyWith<$Res> {
  _$PostCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hasName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      hasName: freezed == hasName
          ? _value.hasName
          : hasName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostCategoryImplCopyWith<$Res>
    implements $PostCategoryCopyWith<$Res> {
  factory _$$PostCategoryImplCopyWith(
          _$PostCategoryImpl value, $Res Function(_$PostCategoryImpl) then) =
      __$$PostCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? hasName});
}

/// @nodoc
class __$$PostCategoryImplCopyWithImpl<$Res>
    extends _$PostCategoryCopyWithImpl<$Res, _$PostCategoryImpl>
    implements _$$PostCategoryImplCopyWith<$Res> {
  __$$PostCategoryImplCopyWithImpl(
      _$PostCategoryImpl _value, $Res Function(_$PostCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hasName = freezed,
  }) {
    return _then(_$PostCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      hasName: freezed == hasName
          ? _value.hasName
          : hasName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$PostCategoryImpl implements _PostCategory {
  _$PostCategoryImpl({this.id, this.name, this.hasName});

  factory _$PostCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostCategoryImplFromJson(json);

  @override
  String? id;
  @override
  String? name;
  @override
  String? hasName;

  @override
  String toString() {
    return 'PostCategory(id: $id, name: $name, hasName: $hasName)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCategoryImplCopyWith<_$PostCategoryImpl> get copyWith =>
      __$$PostCategoryImplCopyWithImpl<_$PostCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostCategoryImplToJson(
      this,
    );
  }
}

abstract class _PostCategory implements PostCategory {
  factory _PostCategory({String? id, String? name, String? hasName}) =
      _$PostCategoryImpl;

  factory _PostCategory.fromJson(Map<String, dynamic> json) =
      _$PostCategoryImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get name;
  set name(String? value);
  @override
  String? get hasName;
  set hasName(String? value);
  @override
  @JsonKey(ignore: true)
  _$$PostCategoryImplCopyWith<_$PostCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthorPostPayloadDTO _$AuthorPostPayloadDTOFromJson(Map<String, dynamic> json) {
  return _AuthorPostPayloadDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthorPostPayloadDTO {
  List<String> get listing => throw _privateConstructorUsedError;
  set listing(List<String> value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError;
  set coins(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorPostPayloadDTOCopyWith<AuthorPostPayloadDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorPostPayloadDTOCopyWith<$Res> {
  factory $AuthorPostPayloadDTOCopyWith(AuthorPostPayloadDTO value,
          $Res Function(AuthorPostPayloadDTO) then) =
      _$AuthorPostPayloadDTOCopyWithImpl<$Res, AuthorPostPayloadDTO>;
  @useResult
  $Res call({List<String> listing, String id, String name, int coins});
}

/// @nodoc
class _$AuthorPostPayloadDTOCopyWithImpl<$Res,
        $Val extends AuthorPostPayloadDTO>
    implements $AuthorPostPayloadDTOCopyWith<$Res> {
  _$AuthorPostPayloadDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listing = null,
    Object? id = null,
    Object? name = null,
    Object? coins = null,
  }) {
    return _then(_value.copyWith(
      listing: null == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorPostPayloadDTOImplCopyWith<$Res>
    implements $AuthorPostPayloadDTOCopyWith<$Res> {
  factory _$$AuthorPostPayloadDTOImplCopyWith(_$AuthorPostPayloadDTOImpl value,
          $Res Function(_$AuthorPostPayloadDTOImpl) then) =
      __$$AuthorPostPayloadDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> listing, String id, String name, int coins});
}

/// @nodoc
class __$$AuthorPostPayloadDTOImplCopyWithImpl<$Res>
    extends _$AuthorPostPayloadDTOCopyWithImpl<$Res, _$AuthorPostPayloadDTOImpl>
    implements _$$AuthorPostPayloadDTOImplCopyWith<$Res> {
  __$$AuthorPostPayloadDTOImplCopyWithImpl(_$AuthorPostPayloadDTOImpl _value,
      $Res Function(_$AuthorPostPayloadDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listing = null,
    Object? id = null,
    Object? name = null,
    Object? coins = null,
  }) {
    return _then(_$AuthorPostPayloadDTOImpl(
      listing: null == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$AuthorPostPayloadDTOImpl implements _AuthorPostPayloadDTO {
  _$AuthorPostPayloadDTOImpl(
      {required this.listing,
      required this.id,
      required this.name,
      required this.coins});

  factory _$AuthorPostPayloadDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorPostPayloadDTOImplFromJson(json);

  @override
  List<String> listing;
  @override
  String id;
  @override
  String name;
  @override
  int coins;

  @override
  String toString() {
    return 'AuthorPostPayloadDTO(listing: $listing, id: $id, name: $name, coins: $coins)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorPostPayloadDTOImplCopyWith<_$AuthorPostPayloadDTOImpl>
      get copyWith =>
          __$$AuthorPostPayloadDTOImplCopyWithImpl<_$AuthorPostPayloadDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorPostPayloadDTOImplToJson(
      this,
    );
  }
}

abstract class _AuthorPostPayloadDTO implements AuthorPostPayloadDTO {
  factory _AuthorPostPayloadDTO(
      {required List<String> listing,
      required String id,
      required String name,
      required int coins}) = _$AuthorPostPayloadDTOImpl;

  factory _AuthorPostPayloadDTO.fromJson(Map<String, dynamic> json) =
      _$AuthorPostPayloadDTOImpl.fromJson;

  @override
  List<String> get listing;
  set listing(List<String> value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  int get coins;
  set coins(int value);
  @override
  @JsonKey(ignore: true)
  _$$AuthorPostPayloadDTOImplCopyWith<_$AuthorPostPayloadDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ImagePayloadDTO _$ImagePayloadDTOFromJson(Map<String, dynamic> json) {
  return _ImagePayloadDTO.fromJson(json);
}

/// @nodoc
mixin _$ImagePayloadDTO {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  set url(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagePayloadDTOCopyWith<ImagePayloadDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePayloadDTOCopyWith<$Res> {
  factory $ImagePayloadDTOCopyWith(
          ImagePayloadDTO value, $Res Function(ImagePayloadDTO) then) =
      _$ImagePayloadDTOCopyWithImpl<$Res, ImagePayloadDTO>;
  @useResult
  $Res call({String id, String url});
}

/// @nodoc
class _$ImagePayloadDTOCopyWithImpl<$Res, $Val extends ImagePayloadDTO>
    implements $ImagePayloadDTOCopyWith<$Res> {
  _$ImagePayloadDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagePayloadDTOImplCopyWith<$Res>
    implements $ImagePayloadDTOCopyWith<$Res> {
  factory _$$ImagePayloadDTOImplCopyWith(_$ImagePayloadDTOImpl value,
          $Res Function(_$ImagePayloadDTOImpl) then) =
      __$$ImagePayloadDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String url});
}

/// @nodoc
class __$$ImagePayloadDTOImplCopyWithImpl<$Res>
    extends _$ImagePayloadDTOCopyWithImpl<$Res, _$ImagePayloadDTOImpl>
    implements _$$ImagePayloadDTOImplCopyWith<$Res> {
  __$$ImagePayloadDTOImplCopyWithImpl(
      _$ImagePayloadDTOImpl _value, $Res Function(_$ImagePayloadDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$ImagePayloadDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$ImagePayloadDTOImpl implements _ImagePayloadDTO {
  _$ImagePayloadDTOImpl({required this.id, required this.url});

  factory _$ImagePayloadDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagePayloadDTOImplFromJson(json);

  @override
  String id;
  @override
  String url;

  @override
  String toString() {
    return 'ImagePayloadDTO(id: $id, url: $url)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePayloadDTOImplCopyWith<_$ImagePayloadDTOImpl> get copyWith =>
      __$$ImagePayloadDTOImplCopyWithImpl<_$ImagePayloadDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagePayloadDTOImplToJson(
      this,
    );
  }
}

abstract class _ImagePayloadDTO implements ImagePayloadDTO {
  factory _ImagePayloadDTO({required String id, required String url}) =
      _$ImagePayloadDTOImpl;

  factory _ImagePayloadDTO.fromJson(Map<String, dynamic> json) =
      _$ImagePayloadDTOImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get url;
  set url(String value);
  @override
  @JsonKey(ignore: true)
  _$$ImagePayloadDTOImplCopyWith<_$ImagePayloadDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoPayloadDTO _$VideoPayloadDTOFromJson(Map<String, dynamic> json) {
  return _VideoPayloadDTO.fromJson(json);
}

/// @nodoc
mixin _$VideoPayloadDTO {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  set url(String value) => throw _privateConstructorUsedError;
  String get thumb => throw _privateConstructorUsedError;
  set thumb(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoPayloadDTOCopyWith<VideoPayloadDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPayloadDTOCopyWith<$Res> {
  factory $VideoPayloadDTOCopyWith(
          VideoPayloadDTO value, $Res Function(VideoPayloadDTO) then) =
      _$VideoPayloadDTOCopyWithImpl<$Res, VideoPayloadDTO>;
  @useResult
  $Res call({String id, String url, String thumb});
}

/// @nodoc
class _$VideoPayloadDTOCopyWithImpl<$Res, $Val extends VideoPayloadDTO>
    implements $VideoPayloadDTOCopyWith<$Res> {
  _$VideoPayloadDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumb = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoPayloadDTOImplCopyWith<$Res>
    implements $VideoPayloadDTOCopyWith<$Res> {
  factory _$$VideoPayloadDTOImplCopyWith(_$VideoPayloadDTOImpl value,
          $Res Function(_$VideoPayloadDTOImpl) then) =
      __$$VideoPayloadDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String url, String thumb});
}

/// @nodoc
class __$$VideoPayloadDTOImplCopyWithImpl<$Res>
    extends _$VideoPayloadDTOCopyWithImpl<$Res, _$VideoPayloadDTOImpl>
    implements _$$VideoPayloadDTOImplCopyWith<$Res> {
  __$$VideoPayloadDTOImplCopyWithImpl(
      _$VideoPayloadDTOImpl _value, $Res Function(_$VideoPayloadDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumb = null,
  }) {
    return _then(_$VideoPayloadDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@customJsonSerializable
class _$VideoPayloadDTOImpl implements _VideoPayloadDTO {
  _$VideoPayloadDTOImpl(
      {required this.id, required this.url, required this.thumb});

  factory _$VideoPayloadDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoPayloadDTOImplFromJson(json);

  @override
  String id;
  @override
  String url;
  @override
  String thumb;

  @override
  String toString() {
    return 'VideoPayloadDTO(id: $id, url: $url, thumb: $thumb)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoPayloadDTOImplCopyWith<_$VideoPayloadDTOImpl> get copyWith =>
      __$$VideoPayloadDTOImplCopyWithImpl<_$VideoPayloadDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoPayloadDTOImplToJson(
      this,
    );
  }
}

abstract class _VideoPayloadDTO implements VideoPayloadDTO {
  factory _VideoPayloadDTO(
      {required String id,
      required String url,
      required String thumb}) = _$VideoPayloadDTOImpl;

  factory _VideoPayloadDTO.fromJson(Map<String, dynamic> json) =
      _$VideoPayloadDTOImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get url;
  set url(String value);
  @override
  String get thumb;
  set thumb(String value);
  @override
  @JsonKey(ignore: true)
  _$$VideoPayloadDTOImplCopyWith<_$VideoPayloadDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
