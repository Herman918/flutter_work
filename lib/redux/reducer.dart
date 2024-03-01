import 'package:flutter_work/models/search_result.dart';
import 'package:flutter_work/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final reducer = combineReducers<AppState>([
  TypedReducer<AppState, DoSearch>(_doSearchActionReducer),
  TypedReducer<AppState, GotSearchResults>(_gotSearchActionReducer),
  TypedReducer<AppState, SearchFailed>(_searchFailedActionReducer)
]);

AppState _doSearchActionReducer(AppState appState, DoSearch action) {
  print('Reducer: DoSearch action with query: ${action.query}');
  print('loading Current search state: ${appState.searchState}');
  print('Current search results: ${appState.searchResults}');


  // Возвращаем новое состояние после обновления
  return appState.copy(
      searchState: SearchState.LOADING,
      searchResults: SearchResult.empty()
  );
}

AppState _gotSearchActionReducer(AppState appState, GotSearchResults action) {
  print('Reducer: GotSearchResults action with results: ${action.results}');
  print('seccess Current search state: ${appState.searchState}');
  print('Current search results: ${appState.searchResults}');

  // Возвращаем новое состояние после обновления
  return appState.copy(
      searchState: SearchState.SUCCESS,
      searchResults: action.results
  );
}

AppState _searchFailedActionReducer(AppState appState, SearchFailed action) {
  print('Reducer: SearchFailed action');
  print('failed Current search state: ${appState.searchState}');
  print('Current search results: ${appState.searchResults}');

  // Возвращаем новое состояние после обновления
  return appState.copy(
      searchState: SearchState.FAILED
  );
}
