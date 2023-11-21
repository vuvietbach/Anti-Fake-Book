import 'dart:io';
import 'package:anti_fake_book/constants/base_apis.dart';
import 'package:dio/dio.dart';

import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';

import 'dto/request/index.dart';

class ApiModel {
  late final String _baseUrl;
  late final BaseOptions _baseOptions;
  late final Dio _dio;
  ApiModel() {
    _baseUrl = 'https://21207cc3-5154-4640-8809-dd9b7a2e95f8.mock.pstmn.io';
    _baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        //todo: set header to request
        options.headers[HttpHeaders.authorizationHeader] = 'Bear 123';
        return handler.next(options);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        final String? refreshToken = null;
        if (refreshToken != null &&
            e.response?.statusCode == HttpStatus.unauthorized) {
          //todo: retry call api
        }
        return handler.next(e);
      },
    ));
  }

  Future<AddPostResponseDTO> addPost(AddPostRequestDTO addPostData) async {
    final formData = FormData.fromMap({
      "image": addPostData.image.map((e) =>
          MultipartFile.fromFileSync(e.path, filename: e.path.split('/').last)),
      "video": addPostData.video.map((e) =>
          MultipartFile.fromFileSync(e.path, filename: e.path.split('/').last)),
      "described": addPostData.described,
      "status": addPostData.status,
    });
    final response = await _dio.post(PathName.addPost, data: formData);
    return AddPostResponseDTO.fromJson(response.data);
  }

  Future<GetPostResponseDTO> getPost(String id) async {
    final response = await _dio.post(PathName.getPost, data: {'id': id});
    return GetPostResponseDTO(response.data);
  }

  Future<GetPostResponseDTO> getUserInfo(String id) async {
    final response = await _dio.post(PathName.getUserInfo, data: {'id': id});
    return GetPostResponseDTO(response.data);
  }
}
