import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_work/models/search_result.dart';
import 'package:flutter_work/redux/app_state.dart';
import 'package:flutter_work/redux/middleware.dart';
import 'package:flutter_work/redux/reducer.dart';
import 'package:flutter_work/redux/store.dart';
import 'package:flutter_work/ui/search_result_widget.dart';
import 'package:redux/redux.dart';
import 'api/client.dart';
import 'redux/actions.dart';
import 'utils/constants.dart';

void main() {

  runApp(DictionaryApp(store: store));
}

class DictionaryApp extends StatelessWidget {
  final Store<AppState> store;

  const DictionaryApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: Constants.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: Constants.APP_NAME, store: store),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Store<AppState> store;

  MyHomePage({Key? key, required this.title, required this.store}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for Books...',
              ),
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "Hind",
                decoration: TextDecoration.none,
              ),
              onChanged: (string) {
                setState(() {
                  this.currentText = string;
                });
              },
            ),
          ),
          StoreConnector<AppState,_SearchScreenViewModel>(
            converter: (store) {
              print('Converter called');
              return _SearchScreenViewModel(
                state: store.state.searchState,
                results: store.state.searchResults,
              );
            },
            builder: (context, viewModel) => ElevatedButton(
              onPressed: () {
                print('Button SEARCH pressed');
                widget.store.dispatch(DoSearch(currentText));
              },
              child: Text(
                  "SEARCH"
              ),
            ),
          ),
          StoreConnector<AppState, _SearchScreenViewModel>(
            converter: (store) {
              print('Converter called');
              return _SearchScreenViewModel(
                state: store.state.searchState,
                results: store.state.searchResults,
              );
            },
            builder: (context, viewModel) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("STATUS :"),
                  Text(viewModel.state.toString())
                ],
              );
            },
          ),
          StoreConnector<AppState, _SearchScreenViewModel>(
            converter: (store) {
              return _SearchScreenViewModel(
                  state: store.state.searchState,
                  results: store.state.searchResults
              );
            },
            builder: (context, viewModel) {
              return Expanded(
                  child: viewModel.state != SearchState.SUCCESS ? Text("EMPTY LIST")
                      : ListView.builder(
                    itemCount: viewModel.results.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (viewModel.results.docs.isNotEmpty && index < viewModel.results.docs.length) {
                        return SearchResultWidget(document: viewModel.results.docs[index]);
                      } else {
                        return Container(
                          child: Text("No results found"),
                        );
                      }
                    },
                  )
              );
            },
          )
        ],
      ),
    );
  }
}

class _SearchScreenViewModel {
  final SearchState state;
  final SearchResult results;

  _SearchScreenViewModel({required this.state, required this.results});
}
