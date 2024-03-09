import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/main.dart';
import 'package:flutter_work/redux/store.dart';

void main() {
  testWidgets('Test presence of text field', (WidgetTester tester) async {

    await tester.pumpWidget(DictionaryApp(store: store));

    expect(find.byType(TextField), findsOneWidget);
  });
}
