import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/models/document.dart';

void main() {
  group('Document', () {
    test('fromJson() and toJson() should match', () {
      final Map<String, dynamic> jsonData = {
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
      };

      final document = Document.fromJson(jsonData);
      final convertedJson = document.toJson();

      expect(convertedJson, jsonData);
    });

    test('getBookCover() should return correct URL', () {
      final document = Document(coverId: 123);
      final coverUrl = document.getBookCover();

      expect(coverUrl, 'http://covers.openlibrary.org/b/id/123.jpg');
    });

    test('getBookCover() should return empty string if coverId is null', () {
      final document = Document(coverId: null);
      final coverUrl = document.getBookCover();

      expect(coverUrl, '');
    });
  });
}
