import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/main.dart';
import 'package:flutter_work/redux/store.dart';

void main() {
  testWidgets('Test button press', (WidgetTester tester) async {

    await tester.pumpWidget(DictionaryApp(store: store,));


    expect(find.byType(ElevatedButton), findsOneWidget);


    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Button SEARCH pressed'), findsOneWidget);
  });
}
