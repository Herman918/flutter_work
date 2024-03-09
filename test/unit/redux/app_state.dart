import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/models/search_result.dart';
import 'package:flutter_work/redux/app_state.dart';
 // Подставьте ваш путь и имя файла

void main() {
  group('AppState', () {
    test('Create AppState with default values', () {
      final appState = AppState.create();

      expect(appState.searchResults, isNotNull);
      expect(appState.searchState, SearchState.IDLE);
      expect(appState.searchResults.docs, isEmpty); // Проверка пустого SearchResult
    });

    test('Copy AppState with new values', () {
      final originalSearchResults = SearchResult();
      final originalAppState = AppState(searchResults: originalSearchResults, searchState: SearchState.SUCCESS);

      final newSearchResults = SearchResult(); // Создание нового SearchResult
      final newAppState = originalAppState.copy(searchResults: newSearchResults, searchState: SearchState.LOADING);

      expect(newAppState.searchResults, newSearchResults); // Проверка, что searchResults был изменен
      expect(newAppState.searchState, SearchState.LOADING); // Проверка, что searchState был изменен
    });

    test('Copy AppState without changes', () {
      final originalSearchResults = SearchResult();
      final originalAppState = AppState(searchResults: originalSearchResults, searchState: SearchState.SUCCESS);

      final newAppState = originalAppState.copy();

      expect(newAppState.searchResults, originalSearchResults); // Проверка, что searchResults остался неизменным
      expect(newAppState.searchState, SearchState.SUCCESS); // Проверка, что searchState остался неизменным
    });
  });
}
