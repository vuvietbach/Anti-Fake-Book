import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/apis.dart';
import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/search.dto.dart';
import 'package:flutter/material.dart';

Future<void> search(BuildContext context, SearchRequest data,
    {Function(SearchResponse)? onSuccess}) async {
  Future getData() async {
    SearchResponse response = await ApiModel.api.search(data);
    onSuccess?.call(response);
  }

  callAPI(context, getData);
}
