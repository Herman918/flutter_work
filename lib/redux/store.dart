import 'package:flutter_work/api/client.dart';
import 'package:flutter_work/redux/middleware.dart';
import 'package:flutter_work/redux/reducer.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';

final store = Store<AppState>(
    reducer,
    initialState: AppState.create(),
    middleware: getMiddlewares(ApiClient())
);