import 'package:flutter_work/api/client.dart';
import 'package:flutter_work/redux/actions.dart';
import 'package:flutter_work/redux/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> getMiddlewares(ApiClient apiClient) {
  return [
    TypedMiddleware<AppState, DoSearch>(_doSearchMiddleware(apiClient))
  ];
}

Middleware<AppState> _doSearchMiddleware(ApiClient apiClient) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    if (action is DoSearch) {
      print('Middleware: DoSearch action with query: ${action.query}');
      int page = 1; // Начинаем с первой страницы

      // Функция для загрузки книг с сервера
      void fetchBooks() {
        apiClient.fetchSearchResults(action.query, page).then((value) {
          print('Middleware: Got search results: $value');
          store.dispatch(GotSearchResults(results: value));
          page++; // Увеличиваем номер страницы для следующего запроса
        }).catchError((error) {
          store.dispatch(SearchFailed());
        });
      }

      fetchBooks(); // Загружаем первую страницу сразу при начале поиска

      // Далее, можно определить логику для загрузки следующих страниц при прокрутке, если это необходимо
      // Например, можно добавить слушателя для прокрутки и загружать следующую страницу по мере необходимости
    }
  };
}
