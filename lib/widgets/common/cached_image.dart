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
  Future<Uint8List> loadImage() async {
    try {
      var response = await cachedRequest.get(widget.url,
          options: Options(responseType: ResponseType.bytes));
      return Uint8List.fromList(response.data as List<int>);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: loadImage(),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(); // or a loading spinner
        } else if (snapshot.hasError) {
          return Image.asset(
            'assets/images/default_cached_image.png',
            fit: BoxFit.fill,
          );
        } else {
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.fill,
          );
        }
      },
    );
  }
}
