import 'dart:convert';
import 'dart:io';
import 'package:anti_fake_book/constants/base_apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/sign_in.dto.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/sign_in.dto.dart';
import 'package:dio/dio.dart';

import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';

import 'dto/request/get_list_posts.dart';
import 'dto/request/index.dart';
import 'dto/response/get_list_posts.dto.dart';

class ApiModel {
  late final String _baseUrl;
  late final BaseOptions _baseOptions;
  late final Dio _dio;
  ApiModel() {
    _baseUrl = 'https://f2782c39-9f02-4230-9c31-8f458430943c.mock.pstmn.io';
    _baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        //todo: set header to request
        options.headers[HttpHeaders.authorizationHeader] = 'Bear 123';
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
    final formData = FormData.fromMap({
      "image": addPostData.image
          .map((e) => MultipartFile.fromBytes(e, filename: e.toString())),
      "video": addPostData.video
          .map((e) => MultipartFile.fromBytes(e, filename: e.toString())),
      "described": addPostData.described,
      "status": addPostData.status,
    });
    final response = await _dio.post(PathName.addPost, data: formData);
    AddPostResponseDTO addPostResponseDTO =
        AddPostResponseDTO.fromJson(response.data);
    return addPostResponseDTO;
  }

  Future<GetPostResponseDTO> getPost(String id) async {
    final response = await _dio.post(PathName.getPost, data: {'id': id});
    return GetPostResponseDTO(data: response.data);
  }

  Future<GetPostResponseDTO> getUserInfo(String id) async {
    final response = await _dio.post(PathName.getUserInfo, data: {'id': id});
    return GetPostResponseDTO(data: response.data);
  }

  Future<SignInResponse> signIn(SignInRequestDTO data) async {
    final response = await _dio.post(PathName.signIn, data: {
      'email': data.email,
      'password': data.password,
    });
    SignInResponse signInResponse = SignInResponse.fromJson(response.data);
    return signInResponse;
  }

  Future<GetListPostsResponseDTO> GetListPosts(
      GetListPostsRequestDTO data) async {
    final response = await _dio.post(PathName.getListPosts, data: {
      'token': data.token,
      'user_id': data.user_id,
      'in_campaign': data.in_campaign,
      'latitude': data.latitude,
      'longitude': data.longitude,
      'last_id': data.last_id,
      'index': data.index,
      'count': data.count,
    });

    print('getListPosts');
    // print(response.data);
    // final responseDTO = GetListPostsResponseDTO.fromJson(response.data);
    // print(responseDTO.code);
    return GetListPostsResponseDTO.fromJson(response.data);
  }
}
