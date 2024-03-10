import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/api/client.dart';
import 'package:flutter_work/models/search_result.dart';
import 'package:flutter_work/redux/actions.dart';
import 'package:flutter_work/redux/app_state.dart';
import 'package:flutter_work/redux/middleware.dart';
import 'package:flutter_work/redux/reducer.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:mockito/mockito.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  group('Middleware tests', () {
    test('DoSearch middleware dispatches GotSearchResults on success', () async {
      // Создаем экземпляр MockApiClient
      final apiClient = MockApiClient();

      // Создаем хранилище Redux Store с нашим middleware
      final store = Store<AppState>(
        reducer,
        initialState: AppState.create(),
        middleware: getMiddlewares(apiClient),
      );

      // Задаем ожидаемый результат для запроса
      final expectedResult = SearchResult(); // Подставьте реальный результат, если это необходимо

      // Используем nullable переменные для query и page
      String? query = 'Test Query';
      int? page = 1;

      // Проверяем, что переменные не равны null, перед использованием
      if (query != null && page != null) {
        // Подготавливаем поведение для MockApiClient при вызове fetchSearchResults
        when(apiClient.fetchSearchResults(query, page)).thenAnswer((_) async => expectedResult);

        // Диспатчим экшен DoSearch с каким-то запросом
        store.dispatch(DoSearch(query));

        // Проверяем, что был вызван метод fetchSearchResults у apiClient с нужными аргументами
        verify(apiClient.fetchSearchResults(query, page)).called(1);

        // Проверяем, что после успешной загрузки результатов был диспатчен экшен GotSearchResults
        await untilCalled(apiClient.fetchSearchResults(query, page));
        expect(store.state.searchResults, equals(expectedResult));
      } else {
        fail('Query or page is null'); // Сообщаем, что один из аргументов равен null
      }
    });

    // Добавьте дополнительные тесты для обработки других сценариев, таких как обработка ошибок и т. д.
  });
}
