import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:anti_fake_book/constants/base_apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/friend.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/post.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/friend.dto.dart';
import 'package:anti_fake_book/plugins/index.dart';
import 'package:dio/dio.dart';

import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:http_parser/http_parser.dart';

import 'dto/request/get_list_posts.dart';
import 'dto/request/get_list_videos.dart';
import 'dto/request/get_recommended_friends.dto.dart';
import 'dto/request/index.dart';
import 'dto/request/set_accept_friend.dto.dart';
import 'dto/request/set_request_friend.dto.dart';
import 'dto/response/get_list_posts.dto.dart';
import 'dto/response/get_list_videos.dto.dart';
import 'dto/response/get_recommended_friends.dto.dart';
import 'dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';
import 'package:anti_fake_book/global_type/user/user_summary.entity.dart';

import 'dto/response/set_accept_friend.dto.dart';

class ApiModel {
  late final String _baseUrl;
  late final BaseOptions _baseOptions;
  late final Dio _dio;
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZGV2aWNlX2lkIjoic3RyaW5nIiwiaWF0IjoxNzAzMjY0NTUxfQ.HK-FmxVfCSjaRNaKs_IlVQyU-2PMJ1hjtEljYQI9NmI';
  ApiModel() {
    _baseUrl = 'https://it4788.catan.io.vn';
    _baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        //todo: set header to request
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        if (e.response?.statusCode == HttpStatus.unauthorized ||
            e.response?.data['code'] == '9998') {
          Plugins.goRouter.go('/welcome');
        }

        return handler.next(e);
      },
    ));
  }

  String convertDioRequestToCurl(RequestOptions options) {
    // Extract headers
    final headers = options.headers
            .map((key, value) => MapEntry(key, '-H "$key: $value"')) ??
        '';

    // Extract request method
    final method = options.method ?? 'GET';

    // Extract request body if it exists
    final data = options.data != null ? '-d \'${options.data}\' ' : '';

    // Combine everything to create the curl command
    return 'curl -X $method $headers $data${options.baseUrl}${options.path}';
  }

  static ApiModel api = ApiModel();

  Future<AddPostResponseDTO> addPost(AddPostRequestDTO addPostData) async {
    //Chuyển addPostData thành FormDataf
    final formData = FormData.fromMap({
      'status': addPostData.status,
      'described': addPostData.described,
    });
    addPostData.video.forEach((element) {
      formData.files.add(MapEntry(
          'video',
          MultipartFile.fromBytes(
            element,
            contentType: MediaType('video', 'mp4'),
            filename: 'video.mp4',
          )));
    });
    addPostData.image.forEach((element) {
      formData.files.add(MapEntry(
          'image',
          MultipartFile.fromBytes(
            element,
            contentType: MediaType('image', 'jpg'),
            filename: 'image.jpg',
          )));
    });
    final response = await _dio.post(PathName.addPost, data: formData);
    print(response);
    AddPostResponseDTO addPostResponseDTO =
        AddPostResponseDTO.fromJson(response.data);
    return addPostResponseDTO;
  }

  Future<GetPostResponseDTO> getPost(String id) async {
    final response = await _dio.post(PathName.getPost, data: {'id': id});
    return GetPostResponseDTO(data: response.data);
  }

  Future<ModifiedPostResponseDto> editPost(
      EditPostRequestDto editPostRequest) async {
    // final jsonData = convertUint8ListToMultipartFile(editPostRequest.toJson());
    final formData = FormData.fromMap({
      'id': editPostRequest.id,
      'described': editPostRequest.described,
      'status': editPostRequest.status,
      'imageDel': editPostRequest.imageDel,
      'imageSort': editPostRequest.imageSort,
      'autoAccept': editPostRequest.autoAccept,
    });
    final response = await _dio.post(PathName.editPost, data: formData);
    ModifiedPostResponseDto modifiedPostResponseDto =
        ModifiedPostResponseDto.fromJson(response.data);
    return modifiedPostResponseDto;
  }

  Future<ModifiedPostResponseDto> deletePost(String id) async {
    final response = await _dio.post(PathName.deletePost, data: {'id': id});
    ModifiedPostResponseDto deletePostResponseDto =
        ModifiedPostResponseDto.fromJson(response.data);
    return deletePostResponseDto;
  }

  Future<ResponseDTO> reportPost(
      ReportPostRequestDto reportPostRequestDto) async {
    final bodyRequest = reportPostRequestDto.toJson();
    final rawResponse = await _dio.post(PathName.reportPost, data: bodyRequest);
    ResponseDTO response = ResponseDTO.fromJson(rawResponse.data);
    return response;
  }

  Future<GetMarkCommentResponseDto> getMarkComment(
      GetMarkCommentRequestDto request) async {
    final bodyRequest = request.toJson();
    final rawResponse =
        await _dio.post(PathName.getMarkComment, data: bodyRequest);
    print(rawResponse.data);
    GetMarkCommentResponseDto rs =
        GetMarkCommentResponseDto.fromJson(rawResponse.data);
    return rs;
  }

  Future<SetMarkCommentResponseDto> setMarkComment(
      SetMarkCommentRequest request) async {
    final bodyRequest = request.toJson();
    final rawResponse =
        await _dio.post(PathName.setMarkComment, data: bodyRequest);
    print(rawResponse.data);
    SetMarkCommentResponseDto rs =
        SetMarkCommentResponseDto.fromJson(rawResponse.data);
    return rs;
  }

  Future<ResponseDTO> feelPost(String postId, bool isKudos) async {
    final rawResponse = await _dio
        .post(PathName.feelPost, data: {"id": postId, "type": isKudos ? 0 : 1});
    return ResponseDTO.fromJson(rawResponse.data);
  }

  Future<ResponseDTO> setPushSetting(SetPushSettingRequest request) {
    final bodyRequest = request.toJson();
    return _dio
        .post(PathName.setPushSettings, data: bodyRequest)
        .then((rawResponse) => ResponseDTO.fromJson(rawResponse.data));
  }

  Future<ResponseDTO> changePassword(String password, String newPassword) {
    return _dio.post(PathName.changePassword, data: {
      'password': password,
      'newPassword': newPassword,
    }).then((rawResponse) => ResponseDTO.fromJson(rawResponse.data));
  }

  Future<GetPushSettingResponseDto> getPushSetting() {
    return _dio.post(PathName.getPushSettings).then(
        (rawResponse) => GetPushSettingResponseDto.fromJson(rawResponse.data));
  }

  Future<CheckNewVersionReponseDto> checkNewVersion() {
    return _dio.post(PathName.checkNewVersion).then(
        (rawResponse) => CheckNewVersionReponseDto.fromJson(rawResponse.data));
  }

  Future<ResponseDTO> setBlockUser(String userId, bool isBlock) {
    return _dio.post(PathName.setBlock, data: {
      'userId': userId,
      'type': isBlock ? 1 : 0,
    }).then((rawResponse) => ResponseDTO.fromJson(rawResponse.data));
  }

  Future<GetNotificationReponseDto> getNotification(
      int index, int count) async {
    final rs = await _dio.post(PathName.getNotification, data: {
      'index': index,
      'count': count,
    });
    final rawRs = rs.data;
    GetNotificationReponseDto finalRs =
        GetNotificationReponseDto.fromJson(rawRs);
    return finalRs;
  }

  Future<SignUpResponse> signUp(SignUpRequest data) async {
    final response = await _dio.post(PathName.signUp, data: data.toJson());
    SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
    return signUpResponse;
  }

  Future<SignInResponse> signIn(SignInRequest data) async {
    final response = await _dio.post(PathName.signIn, data: data.toJson());
    SignInResponse signInResponse = SignInResponse.fromJson(response.data);
    // token = signInResponse.data.token;
    return signInResponse;
  }

  Future<LogOutResponse> logOut(LogOutRequest data) async {
    final response = await _dio.post(PathName.logOut, data: data.toJson());
    LogOutResponse logOutResponse = LogOutResponse.fromJson(response.data);
    return logOutResponse;
  }

  Future<GetVerifyCodeResponse> getVerifyCode(GetVerifyCodeRequest data) async {
    final response =
        await _dio.post(PathName.getVerifyCode, data: data.toJson());
    GetVerifyCodeResponse getVerifyCodeResponse =
        GetVerifyCodeResponse.fromJson(response.data);
    return getVerifyCodeResponse;
  }

  Future<CheckVerifyCodeResponse> checkVerifyCode(
      CheckVerifyCodeRequest data) async {
    final response =
        await _dio.post(PathName.checkVerifyCode, data: data.toJson());
    CheckVerifyCodeResponse checkVerifyCodeResponse =
        CheckVerifyCodeResponse.fromJson(response.data);
    return checkVerifyCodeResponse;
  }

  Future<ChangeProfileAfterSignUpResponse> changeProfileAfterSignUp(
      ChangeProfileAfterSignUpRequest data) async {
    FormData formData = FormData.fromMap({
      'username': data.username,
    });
    if (data.avatar != null) {
      final avatar = await File(data.avatar!).readAsBytes();
      formData.files.add(MapEntry(
          'avatar',
          MultipartFile.fromBytes(
            avatar,
            contentType: MediaType('image', 'jpg'),
            filename: 'avatar',
          )));
    }
    var options = Options(
      contentType: 'multipart/form-data',
    );
    final response = await _dio.post(PathName.changeProfileAfterSignUp,
        data: formData, options: options);
    ChangeProfileAfterSignUpResponse changeInfoAfterSignUpResponse =
        ChangeProfileAfterSignUpResponse.fromJson(response.data);
    return changeInfoAfterSignUpResponse;
  }

  Future<GetSavedSearchResponse> getSavedSearch(
      GetSavedSearchRequest data) async {
    final response =
        await _dio.post(PathName.getSavedSearch, data: data.toJson());
    GetSavedSearchResponse getSavedSearchResponse =
        GetSavedSearchResponse.fromJson(response.data);
    return getSavedSearchResponse;
  }

  Future<DelSavedSearchResponse> delSavedSearch(
      DelSavedSearchRequest data) async {
    final response =
        await _dio.post(PathName.delSavedSearch, data: data.toJson());
    DelSavedSearchResponse delSavedSearchResponse =
        DelSavedSearchResponse.fromJson(response.data);
    return delSavedSearchResponse;
  }

  Future<GetUserFriendsResponse> getUserFriends(
      GetUserFriendsRequest data) async {
    final response =
        await _dio.post(PathName.getUserFriends, data: data.toJson());
    GetUserFriendsResponse getUserFriendsResponse =
        GetUserFriendsResponse.fromJson(response.data['data']);
    return getUserFriendsResponse;
  }

  Future unfriend(UnfriendRequest data) async {
    await _dio.post(PathName.unfriend, data: data.toJson());
  }

  // Future<SetDevtokenResponse> setDevtoken(SetDevtokenRequest data) async {
  //   final response = await _dio.post(PathName.setDevToken, data: data.toJson());
  //   SetDevtokenResponse setDevtokenResponse =
  //       SetDevtokenResponse.fromJson(response.data);
  //   return setDevtokenResponse;
  // }

  Future<GetUserInfoResponse> getUserInfo(GetUserInfoRequest data) async {
    final response = await _dio.post(PathName.getUserInfo, data: data.toJson());
    GetUserInfoResponse getUserInfoResponse =
        GetUserInfoResponse.fromJson(response.data);
    return getUserInfoResponse;
  }

  Future<SetUserInfoResponse> setUserInfo(SetUserInfoRequest data) async {
    FormData formData = FormData.fromMap(data.toJson());
    if (data.avatar != null) {
      final Uint8List avatar = await File(data.avatar!).readAsBytes();
      formData.files.add(MapEntry(
          'avatar',
          MultipartFile.fromBytes(
            avatar,
            contentType: MediaType('image', 'jpg'),
            filename: 'avatar.jpg',
          )));
    }
    if (data.coverImage != null) {
      print(data.coverImage!);
      final Uint8List coverImage = await File(data.coverImage!).readAsBytes();
      formData.files.add(MapEntry(
          'cover_image',
          MultipartFile.fromBytes(
            coverImage,
            contentType: MediaType('image', 'jpg'),
            filename: 'coverImage.jpg',
          )));
    }
    var options = Options(
      contentType: 'multipart/form-data',
    );

    final response =
        await _dio.post(PathName.setUserInfo, data: formData, options: options);
    SetUserInfoResponse setUserInfoResponse =
        SetUserInfoResponse.fromJson(response.data);
    print("ok");
    return setUserInfoResponse;
  }

  Future<SearchResponse> search(SearchRequest data) async {
    final response = await _dio.post(PathName.search, data: data.toJson());
    SearchResponse searchResponse = SearchResponse.fromJson(response.data);
    return searchResponse;
  }

  Future<GetListConversationResponse> getListConversation(
      GetListConversationRequest data) async {
    final response =
        await _dio.post(PathName.getListConversation, data: data.toJson());
    GetListConversationResponse getListConversationResponse =
        GetListConversationResponse.fromJson(response.data);
    return getListConversationResponse;
  }

  Future<GetConversationResponse> getConversation(
      GetConversationRequest data) async {
    final response =
        await _dio.post(PathName.getConversation, data: data.toJson());
    // rprint(response);
    GetConversationResponse getConversationResponse =
        GetConversationResponse.fromJson(response.data);
    return getConversationResponse;
  }

  Future<SetReadMessageResponse> setReadMessage(
      SetReadMessageRequest data) async {
    final response =
        await _dio.post(PathName.setReadMessage, data: data.toJson());
    SetReadMessageResponse setReadMessageResponse =
        SetReadMessageResponse.fromJson(response.data);
    return setReadMessageResponse;
  }

  Future<DeleteMessageResponse> deleteMessage(DeleteMessageRequest data) async {
    final response =
        await _dio.post(PathName.deleteMessage, data: data.toJson());
    DeleteMessageResponse deleteMessageResponse =
        DeleteMessageResponse.fromJson(response.data);
    return deleteMessageResponse;
  }

  Future<DeleteConversationResponse> deleteConversation(
      DeleteConversationRequest data) async {
    final response =
        await _dio.post(PathName.deleteConversation, data: data.toJson());
    DeleteConversationResponse deleteConversationResponse =
        DeleteConversationResponse.fromJson(response.data);
    return deleteConversationResponse;
  }

  Future<GetListPostsResponseDTO> getListPosts(GetListPostsRequest data) async {
    final response = await _dio.post(
      PathName.getListPosts,
      data: data.toJson(),
    );
    // print('getListPosts');
    // print(response.statusCode);
    // print(response.realUri);
    // print(ApiModel.api.convertDioRequestToCurl(response.requestOptions));
    // print(response.requestOptions);
    // print(response.data);
    // print(response.data.runtimeType);
    return GetListPostsResponseDTO.fromJson(response.data);
  }

  Future<GetRequestedFriendsResponseDTO> GetRequestedFriends(
      GetRequestedFriendsRequestDTO data) async {
    final response = await _dio.post(
      PathName.getRequestedFriends,
      data: {
        'index': data.index,
        'count': data.count,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer ${data.token}',
        },
      ),
    );
    // print('ok');
    // print(response.statusCode);
    // print(response.data);
    // print(GetRequestedFriendsResponseDTO.fromJson(response.data));

    return GetRequestedFriendsResponseDTO.fromJson(response.data);
  }

  Future<ResponseDTO> setBlock(String userId, bool isBlock) {
    return _dio.post(isBlock ? PathName.setBlock : PathName.unblock, data: {
      'user_id': userId,
    }).then((rawResponse) => ResponseDTO.fromJson(rawResponse.data));
  }

  Future<List<UserSummaryEntity>> getListBlocks(int index, int count) async {
    var rawResponse = await _dio.post(PathName.getListBlocks, data: {
      'index': index,
      'count': count,
    }).then((rawResponse) => rawResponse.data['data']) as List<dynamic>;
    final data = rawResponse.map((e) => UserSummaryEntity.fromJson(e)).toList();
    return data;
  }

  Future<GetListVideosResponseDTO> GetListVideos(
      GetListVideosRequestDTO data) async {
    final response = await _dio.post(
      PathName.getListVideos,
      data: {
        'user_id': data.user_id,
        'in_campaign': data.in_campaign,
        'campaign_id': data.campaign_id,
        'latitude': data.latitude,
        'longitude': data.longitude,
        'last_id': data.last_id,
        'index': data.index,
        'count': data.count,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer ${data.token}',
        },
      ),
    );

    // print('getListPosts');
    // print(response.statusCode);
    // print(response.data);
    // print(response.realUri);
    // print(ApiModel.api.convertDioRequestToCurl(response.requestOptions));
    // print(response.requestOptions);
    // print(response.data);
    // print(response.data.runtimeType);
    return GetListVideosResponseDTO.fromJson(response.data);
  }

  Future<GetRecommendedFriendsResponseDTO> GetRecommendedFriends(
      GetRecommendedFriendsRequestDTO data) async {
    final response = await _dio.post(
      PathName.getRecommendedFriends,
      data: {
        'index': data.index,
        'count': data.count,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer ${data.token}',
        },
      ),
    );
    // print('ok');
    // print(response.statusCode);
    // print(response.data);
    // print(GetRecommendedFriendsResponseDTO.fromJson(response.data));

    return GetRecommendedFriendsResponseDTO.fromJson(response.data);
  }

  Future<SetAcceptFriendResponseDTO> SetAcceptFriend(
      SetAcceptFriendRequestDTO data) async {
    // try {
    //   final response = await _dio.post(
    //     PathName.setAcceptFriend,
    //     data: {
    //       'user_id': data.user_id,
    //       'is_accept': data.is_accept,
    //     },
    //     options: Options(
    //       headers: {
    //         'Authorization': 'Bearer ${data.token}',
    //       },
    //     ),
    //   );
    //
    //   final requestUrl = response.requestOptions.uri.toString();
    //   print('Request URL: $requestUrl');
    //   print('Status Code: ${response.statusCode}');
    //
    //   return SetAcceptFriendResponseDTO.fromJson(response.data);
    // } catch (error) {
    //   // Print the error message from the server response
    //   if (error is DioError && error.response != null) {
    //     print('Error Status Code: ${error.response!.statusCode}');
    //     print('Error Message: ${error.response!.data}');
    //   } else {
    //     print('Unexpected Error: $error');
    //   }
    //
    //   // You might want to throw or handle the error accordingly
    //   throw error;
    // }

    final response = await _dio.post(
      PathName.setAcceptFriend,
      data: {
        'user_id': data.user_id,
        'is_accept': data.is_accept,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer ${data.token}',
        },
      ),
    );

    // print('here');
    // print(response.statusCode);

    return SetAcceptFriendResponseDTO.fromJson(response.data);
  }

  Future<SetRequestFriendResponseDTO> SetRequestFriend(
      SetRequestFriendRequestDTO data) async {
    final response = await _dio.post(
      PathName.setRequestFriend,
      data: {
        'user_id': data.user_id,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer ${data.token}',
        },
      ),
    );

    print('here');
    print(response.statusCode);

    return SetRequestFriendResponseDTO.fromJson(response.data);
  }
}

void main() async {
  ApiModel.token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDcxLCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDMxNTI0Mjl9.bSPonlcYIbVaYy7WGSY_zzdkRgeqYzDFIUpZOJwv_fQ';
  final response = await ApiModel.api
      .search(SearchRequest(keyword: "hello", index: 0, count: 10));
  print(response.toJson());
}
