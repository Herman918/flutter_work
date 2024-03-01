
import 'dart:convert';

import 'package:flutter_work/models/search_result.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_work/utils/constants.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({
    this.baseUrl = Constants.BASE_URL
  });

  Future<SearchResult> fetchSearchResults(String term, int page) async {
    final int pageSize = 10; // Количество книг на странице
    final int offset = (page - 1) * pageSize; // Смещение для текущей страницы

    final uri = Uri.parse("${baseUrl}search.json?q=$term&offset=$offset&limit=$pageSize");
    print("Request URL: $uri");

    final response = await http.get(uri);
    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");

    return SearchResult.fromJson(json.decode(response.body));
  }
}
