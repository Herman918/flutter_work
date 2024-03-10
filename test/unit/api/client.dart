import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/api/client.dart';

void main() {
  test('fetchSearchResults returns SearchResult', () async {
    // Создаем экземпляр ApiClient с базовым URL
    final apiClient = ApiClient(baseUrl: 'http://openlibrary.org/');

    // Вызываем метод fetchSearchResults
    final result = await apiClient.fetchSearchResults('test', 1);

    // Проверяем, что результат не равен null
    expect(result, isNotNull);

    // Дополнительные проверки, если необходимо
  });
}
