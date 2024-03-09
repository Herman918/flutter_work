import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_work/main.dart';
import 'package:flutter_work/redux/store.dart';

void main() {
  testWidgets('Test app startup', (WidgetTester tester) async {

    await tester.pumpWidget(DictionaryApp(store: store,));

    expect(find.text('Search for Books...'), findsOneWidget);

  });
}
