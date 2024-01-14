import 'package:anti_fake_book/models/base_apis/dto/request/index.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/search.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void getSavedSearch(BuildContext context, GetSavedSearchRequest data,
    {Function(GetSavedSearchResponse)? onSuccess}) {
  StoreProvider.of<AntiFakeBookState>(context).dispatch(
      GetSavedSearchAction(data: data, context: context, onSuccess: onSuccess));
}

void delSavedSearch(
  BuildContext context,
  DelSavedSearchRequest data,
) {
  StoreProvider.of<AntiFakeBookState>(context)
      .dispatch(DelSavedSearchAction(context: context, data: data));
}
