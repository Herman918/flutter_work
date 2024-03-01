import 'package:flutter_work/models/search_result.dart';

class DoSearch {
  final String query;

  DoSearch(this.query);
}

class GotSearchResults {
  final SearchResult results;

  GotSearchResults({required this.results});
}

class SearchFailed {}