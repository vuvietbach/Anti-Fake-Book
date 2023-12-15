import 'dart:convert';
import 'dart:io';
import 'package:anti_fake_book/constants/base_apis.dart';
import 'package:dio/dio.dart';

import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';

import 'dto/request/get_list_posts.dart';
import 'dto/request/index.dart';
import 'dto/response/get_list_posts.dto.dart';
import 'dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';

class ApiModel {
  late final String _baseUrl;
  late final BaseOptions _baseOptions;
  late final Dio _dio;
  static String token = "";
  ApiModel() {
    _baseUrl =
        'https://1985-2001-ee0-4a77-2bf0-8593-5c3e-c34f-60ed.ngrok-free.app';
    _baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        //todo: set header to request
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        const String? refreshToken = null;
        if (refreshToken != null &&
            e.response?.statusCode == HttpStatus.unauthorized) {
          //todo: retry call api
        }

        return handler.next(e);
      },
    ));
  }

  String convertDioRequestToCurl(RequestOptions options) {
    // Extract headers
    final headers = options.headers
            ?.map((key, value) => MapEntry(key, '-H "$key: $value"')) ??
        '';

    // Extract request method
    final method = options.method ?? 'GET';

    // Extract request body if it exists
    final data = options.data != null ? '-d \'${options.data}\' ' : '';

    // Combine everything to create the curl command
    return 'curl -X $method $headers $data${options.baseUrl}${options.path}';
  }

  void update(String token) {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      //todo: set header to request
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      return handler.next(options);
    }, onError: (DioException e, ErrorInterceptorHandler handler) {
      const String? refreshToken = null;
      if (refreshToken != null &&
          e.response?.statusCode == HttpStatus.unauthorized) {
        //todo: retry call api
      }
      /*
        if loi = 400
          EmptyLayout.handleError();
        */
      return handler.next(e);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }));
  }

  static ApiModel api = ApiModel();

  Future<AddPostResponseDTO> addPost(AddPostRequestDTO addPostData) async {
    //Chuyển addPostData thành FormDataf
    final formData = convertUint8ListToMultipartFile(addPostData.toJson());
    final response = await _dio.post(PathName.addPost, data: formData);
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
    final jsonData = convertUint8ListToMultipartFile(editPostRequest.toJson());
    final formData = FormData.fromMap(jsonData);
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
    final rawResponse = await _dio.post(PathName.getMarkComment,
        data: bodyRequest) as Map<String, dynamic>;
    return GetMarkCommentResponseDto.fromJson(rawResponse);
  }

  Future<ResponseDTO> feelPost(String postId) async {
    final rawResponse = await _dio.post(PathName.feelPost, data: {"id": postId})
        as Map<String, dynamic>;
    return ResponseDTO.fromJson(rawResponse);
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

  Future<GetNotificationReponseDto> getNotification(int index, int count) {
    return _dio.post(PathName.getNotification).then(
        (rawResponse) => GetNotificationReponseDto.fromJson(rawResponse.data));
  }

  Future<SignUpResponse> signUp(SignUpRequest data) async {
    final response = await _dio.post(PathName.signUp, data: data.toJson());
    SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
    return signUpResponse;
  }

  Future<SignInResponse> signIn(SignInRequest data) async {
    final response = await _dio.post(PathName.signIn, data: data.toJson());
    SignInResponse signInResponse = SignInResponse.fromJson(response.data);
    if (signInResponse.code == 1000) {
      token = signInResponse.data.token;
    }
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
      formData.files.add(MapEntry(
          'avatar',
          await MultipartFile.fromFile(
            data.avatar!,
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
      formData.files.add(MapEntry(
          'avatar',
          await MultipartFile.fromFile(
            data.avatar!,
            filename: 'avatar',
          )));
    }
    if (data.coverImage != null) {
      formData.files.add(MapEntry(
          'coverImage',
          await MultipartFile.fromFile(
            data.coverImage!,
            filename: 'coverImage',
          )));
    }
    var options = Options(
      contentType: 'multipart/form-data',
    );

    final response =
        await _dio.post(PathName.setUserInfo, data: formData, options: options);
    SetUserInfoResponse setUserInfoResponse =
        SetUserInfoResponse.fromJson(response.data);
    return setUserInfoResponse;
  }

  Future<SearchResponse> search(String token, SearchRequest data) async {
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    final response =
        await _dio.post(PathName.search, options: options, data: data.toJson());
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

  Future<GetListPostsResponseDTO> GetListPosts(
      GetListPostsRequestDTO data) async {
    final response = await _dio.post(
      PathName.getListPosts,
      data: {
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
}

void main() async {
  final data = AddPostRequestDTO();
  final rs = await ApiModel.api.addPost(data).catchError((e) {
    print(e);
  });
  print(rs.toJson());
}
