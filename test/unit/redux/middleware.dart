import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/models/search_result.dart';
import 'package:flutter_work/redux/reducer.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_work/api/client.dart';
import 'package:flutter_work/redux/actions.dart';
import 'package:flutter_work/redux/app_state.dart';
import 'package:flutter_work/redux/middleware.dart';
import 'package:redux/redux.dart';

// Mock для ApiClient
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

      // Используйте anyNamed для именованных аргументов
      when(apiClient.fetchSearchResults(anyNamed('query'), anyNamed('page')))
          .thenAnswer((_) async => Future.value(expectedResult));






      // Диспатчим экшен DoSearch с каким-то запросом
      store.dispatch(DoSearch('Test Query'));

      // Проверяем, что был вызван метод fetchSearchResults у apiClient с нужными аргументами
      verify(apiClient.fetchSearchResults('Test Query', 1)).called(1);

      // Проверяем, что после успешной загрузки результатов был диспатчен экшен GotSearchResults
      await untilCalled(apiClient.fetchSearchResults('Test Query', 1));
      expect(store.state.searchResults, equals(expectedResult));
    });

    // Добавьте дополнительные тесты для обработки других сценариев, таких как обработка ошибок и т. д.
  });
}
