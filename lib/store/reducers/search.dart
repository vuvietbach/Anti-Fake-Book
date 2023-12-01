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
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  return state.copyWith(
    searchState: state.searchState.copyWith(
      savedSearch: action.payload.data,
    ),
  );
}

AntiFakeBookState onDelSavedSearchPending(
    AntiFakeBookState state, PendingDelSavedSearchAction action) {
  if (action.extras['onPending'] != null) action.extras['onPending']!();
  return state;
}

AntiFakeBookState onDelSavedSearchSuccess(
    AntiFakeBookState state, SuccessDelSavedSearchAction action) {
  if (action.extras['onSuccess'] != null) {
    action.extras['onSuccess']!(action.payload);
  }
  AntiFakeBookState newState = state;
  if (isSuccessCode(action.payload.code)) {
    newState = state.copyWith(
      searchState: state.searchState.copyWith(
        savedSearch: state.searchState.savedSearch
            .where((element) => element.id != action.extras['searchId'])
            .toList(),
      ),
    );
  }
  return newState;
}
