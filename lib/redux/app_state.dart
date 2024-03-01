import 'package:flutter_work/models/search_result.dart';

class AppState {
  final SearchResult searchResults;
  final SearchState searchState;

  AppState({required this.searchResults, this.searchState = SearchState.IDLE});

  factory AppState.create() => AppState(searchResults: SearchResult.empty());

  AppState copy({
    SearchResult? searchResults,
    SearchState? searchState,
  }) =>
      AppState(
        searchResults: searchResults ?? this.searchResults,
        searchState: searchState ?? this.searchState,
      );
}


enum SearchState {
  IDLE,
  LOADING,
  SUCCESS,
  FAILED
}