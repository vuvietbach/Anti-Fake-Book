import 'dart:io';
import 'package:anti_fake_book/constants/base_apis.dart';
import 'package:dio/dio.dart';

import 'dto/request/index.dart';
import 'dto/response/index.dart';
import 'package:anti_fake_book/utils.dart';

class ApiModel {
  late final String _baseUrl;
  late final BaseOptions _baseOptions;
  late final Dio _dio;
  String token = "";
  ApiModel() {
    _baseUrl = 'https://it4788.catan.io.vn';
    _baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_baseOptions);
    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //     //todo: set header to request
    //     options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    //     return handler.next(options);
    //   },
    //   onError: (DioException e, ErrorInterceptorHandler handler) {
    //     const String? refreshToken = null;
    //     if (refreshToken != null &&
    //         e.response?.statusCode == HttpStatus.unauthorized) {
    //       //todo: retry call api
    //     }
    //     return handler.next(e);
    //   },
    // ));
  }
  void update(String token) {
    _dio.interceptors.clear();
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

  static ApiModel api = ApiModel();

  Future<AddPostResponseDTO> addPost(AddPostRequestDTO addPostData) async {
    //Chuyển addPostData thành FormData
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
    print(getUserInfoResponse.data.toJson());
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
}

void main() async {
  // final api = ApiModel();
  // final signIn = SignInRequest(email: "bach", password: "1234");
  // final addPostResponse = await api.signIn(signIn);
  // print(addPostResponse.code);
  // final signUp = SignUpRequest(email: "bach", password: "1234", uuid: "1234");
  // final signUpResponse = await api.signUp(signUp);
  // print(signUpResponse.code);
  // final search = GetSavedSearchRequest(token: , index: index, count: count)
  // SetUserInfoRequest req = SetUserInfoRequest();
  // // print(req.toJson());
  ApiModel.api.update(
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDcxLCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDIxMzQyODN9.3QSRupylxbMce7FDDmfqtE0FilZgSCGJ17ZGX2FK_qs");
  // print(ApiModel.api.token);
  // String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDcxLCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDIxMzQyODN9.3QSRupylxbMce7FDDmfqtE0FilZgSCGJ17ZGX2FK_qs";
  // var data = await ApiModel.api.search(
  //     token, SearchRequest(index: 0, count: 10, keyword: "hello", userId: "1"));
  // print(data);
  var data = {
    "code": "1000",
    "message": "OK",
    "data": [
      {
        "id": "330",
        "name": "",
        "image": [],
        "video": {
          "url":
              "https://it4788.catan.io.vn/files/video-1702139616722-693921236.mp4"
        },
        "described": "\"hello\"",
        "created": "2023-12-09T16:33:36.731Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "\"post with video\"",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "329",
        "name": "",
        "image": [],
        "video": {
          "url":
              "https://it4788.catan.io.vn/files/video-1702139414737-106097848.mp4"
        },
        "described": "\"hello\"",
        "created": "2023-12-09T16:30:14.745Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "\"post with video\"",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "328",
        "name": "",
        "image": [],
        "video": {
          "url":
              "https://it4788.catan.io.vn/files/video-1702139376492-556596907.mp4"
        },
        "described": "Hello world!",
        "created": "2023-12-09T16:29:36.501Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "Hyped",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "325",
        "name": "",
        "image": [],
        "video": {
          "url":
              "https://it4788.catan.io.vn/files/video-1702136624714-610355532.mp4"
        },
        "described": "\"hello\"",
        "created": "2023-12-09T15:43:44.738Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "\"post with video\"",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "324",
        "name": "",
        "image": [],
        "described": "\"hello\"",
        "created": "2023-12-09T15:37:26.942Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "\"post with image\"",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "322",
        "name": "",
        "image": [],
        "described": "\"hello\"",
        "created": "2023-12-09T15:21:38.724Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "\"hello new day\"",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "321",
        "name": "",
        "image": [
          {
            "id": "1",
            "url":
                "https://it4788.catan.io.vn/files/image-1702134163039-903369003.jpg"
          }
        ],
        "described": "Hello world!",
        "created": "2023-12-09T15:02:43.042Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "vsdvtnuy",
        "author": {
          "id": "329",
          "name": "mkml",
          "avatar":
              "https://it4788.catan.io.vn/files/avatar-1701792559489-506632748.png"
        }
      },
      {
        "id": "320",
        "name": "",
        "image": [],
        "described": "\"hello\"",
        "created": "2023-12-09T14:57:25.992Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "\"hello new day\"",
        "author": {"id": "375", "name": "ex", "avatar": ""}
      },
      {
        "id": "286",
        "name": "",
        "image": [
          {
            "id": "1",
            "url":
                "https://it4788.catan.io.vn/files/image-1702071635874-280009650.jpg"
          },
          {
            "id": "2",
            "url":
                "https://it4788.catan.io.vn/files/image-1702071635915-504601375.png"
          }
        ],
        "described": "hello",
        "created": "2023-12-08T21:40:35.919Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "",
        "author": {
          "id": "357",
          "name": "Vuhuu",
          "avatar":
              "https://it4788.catan.io.vn/files/avatar-1702006117317-92950616.jpg"
        }
      },
      {
        "id": "266",
        "name": "",
        "image": [],
        "described": "Hello !!!",
        "created": "2023-12-08T14:55:32.507Z",
        "feel": "0",
        "mark_comment": "0",
        "is_felt": "0",
        "state": "Hyped",
        "author": {
          "id": "391",
          "name": "Cristiano Ronaldo",
          "avatar":
              "https://it4788.catan.io.vn/files/avatar-1702043469783-710424970.jpg"
        }
      }
    ]
  };
  var searchResponse = SearchResponse.fromJson(data);
}
