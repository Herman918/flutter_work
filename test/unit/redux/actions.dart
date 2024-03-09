import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/models/search_result.dart';
import 'package:flutter_work/redux/actions.dart';
 // Подставьте ваш путь и имя файла

void main() {
  group('DoSearch', () {
    test('DoSearch should have correct query', () {
      final doSearch = DoSearch('Test Query');
      expect(doSearch.query, 'Test Query');
    });

    test('GotSearchResults should contain search results', () {
      final searchResult = SearchResult(); // Создайте экземпляр SearchResult по вашему желанию
      final gotSearchResults = GotSearchResults(results: searchResult);
      expect(gotSearchResults.results, searchResult);
    });

    test('SearchFailed should be instantiated', () {
      final searchFailed = SearchFailed();
      expect(searchFailed, isNotNull);
    });
  });
}

 // Подставьте ваш путь и имя файла



