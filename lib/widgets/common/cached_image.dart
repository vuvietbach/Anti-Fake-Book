//widget load image from url
import 'dart:typed_data';

import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/cached_http_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatefulWidget {
  const CachedImageWidget(
      {Key? key, required this.url, this.width, this.height})
      : super(key: key);
  final String url;
  final double? width;
  final double? height;
  @override
  _CachedImageWidgetState createState() => _CachedImageWidgetState();
}

class _CachedImageWidgetState extends State<CachedImageWidget> {
  Uint8List? imageRaw;
  _CachedImageWidgetState() {
    //lấy ảnh từ url
    cachedRequest
        .get('https://gstatic.gvn360.com/2021/08/Hatsune-Miku_-32-scaled.jpg',
            options: Options(responseType: ResponseType.bytes))
        .then((value) {
      setState(() {
        imageRaw = Uint8List.fromList(value.data as List<int>);
      });
    }).catchError((onError) {
      print(onError);
    });
  }
  @override
  Widget build(BuildContext context) {
    if (imageRaw == null) {
      return const SizedBox();
    } else {
      return Image(
        image: MemoryImage(imageRaw!),
        fit: BoxFit.fill,
      );
    }
  }
}
