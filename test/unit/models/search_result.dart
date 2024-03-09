import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/models/document.dart'; // Убедитесь, что это правильный путь к вашему классу Document
import 'package:flutter_work/models/search_result.dart'; // Убедитесь, что это правильный путь к вашему классу SearchResult

void main() {
  group('SearchResult', () {
    test('SearchResult should correctly parse JSON', () {
      final Map<String, dynamic> jsonData = {
        'start': 0,
        'numFound': 10,
        'docs': [
          {
            'title_suggest': 'Test Title',
            'edition_key': ['12345'],
            'cover_i': 1,
            'isbn': ['1234567890'],
            'has_fulltext': true,
            'author_name': ['Test Author'],
            'contributor': ['Test Contributor'],
            'author_key': ['test_author_key'],
            'first_publish_year': 2022,
            'title': 'Test Title',
            'publisher': ['Test Publisher'],
            'language': ['English']
          }
        ]
      };

      final searchResult = SearchResult.fromJson(jsonData);

      // Проверяем, что данные были правильно разобраны
      expect(searchResult.start, 0);
      expect(searchResult.numFound, 10);

      // Проверяем, что список docs состоит из объектов Document
      expect(searchResult.docs.length, 1);
      expect(searchResult.docs[0].title, 'Test Title');
      // Добавьте другие проверки, если необходимо
    });




    test('empty() should return SearchResult with empty docs list', () {
      final emptySearchResult = SearchResult.empty();

      expect(emptySearchResult.start, 0);
      expect(emptySearchResult.numFound, 0);
      expect(emptySearchResult.docs, isEmpty);
    });

    test('fromJson() should parse documents correctly', () {
      final Map<String, dynamic> jsonData = {
        'start': 0,
        'numFound': 1,
        'docs': [
          {
            'title_suggest': 'Test Title',
            'edition_key': ['12345'],
            'cover_i': 1,
            'isbn': ['1234567890'],
            'has_fulltext': true,
            'author_name': ['Test Author'],
            'contributor': ['Test Contributor'],
            'author_key': ['test_author_key'],
            'first_publish_year': 2022,
            'title': 'Test Title',
            'publisher': ['Test Publisher'],
            'language': ['English'],
          }
        ]
      };

      final searchResult = SearchResult.fromJson(jsonData);

      expect(searchResult.docs.length, 1);
      expect(searchResult.docs[0].title, 'Test Title');
      // Добавьте другие проверки, если необходимо
    });
  });
}
