import 'package:anti_fake_book/helper/helper.dart';
import 'package:anti_fake_book/models/base_apis/dto/response/index.dart';
import 'package:anti_fake_book/store/actions/search.dart';
import 'package:anti_fake_book/store/state/index.dart';
import 'package:anti_fake_book/utils.dart';

AntiFakeBookState onGetSavedSearchPending(
    AntiFakeBookState state, PendingGetSavedSearchAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onGetSavedSearchSuccess(
    AntiFakeBookState state, SuccessGetSavedSearchAction action) {
  if (isSuccessCode(action.payload.code)) {
    if (action.extras['onSuccess'] != null) {
      action.extras['onSuccess']!(action.payload);
    }
    List<SavedSearchData> newSavedSearch = [...action.payload.data];
    newSavedSearch.sort((a, b) {
      DateTime aTime = DateTime.parse(a.created);
      DateTime bTime = DateTime.parse(b.created);
      return aTime.isAfter(bTime) ? -1 : 1;
    });
    return state.copyWith(
      searchState: state.searchState.copyWith(
        savedSearch: newSavedSearch,
      ),
    );
  } else {
    showErrorDialog(action.extras["context"], action.payload.code);
    return state;
  }
}

AntiFakeBookState onDelSavedSearchPending(
    AntiFakeBookState state, PendingDelSavedSearchAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onDelSavedSearchSuccess(
    AntiFakeBookState state, SuccessDelSavedSearchAction action) {
  if (isSuccessCode(action.payload.code)) {
    if (action.extras['onSuccess'] != null) {
      action.extras['onSuccess']!(action.payload);
    }
    List<SavedSearchData> newSavedSearch = [...state.searchState.savedSearch];
    if (action.extras['request'].all == "1") {
      newSavedSearch = [];
    } else {
      newSavedSearch.removeWhere(
          (element) => element.id == action.extras['request'].searchId);
    }
    return state.copyWith(
      searchState: state.searchState.copyWith(
        savedSearch: newSavedSearch,
      ),
    );
  } else {
    showErrorDialog(action.extras["context"], action.payload.code);
    return state;
  }
}
