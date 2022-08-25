import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/home_page.dart';

Widget makeTestable(Widget widget) => MaterialApp(
      home: widget,
    );

void main() {
  testWidgets('Heart smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final Finder iconFinder = find.byKey(const Key('heart'));

    expect(iconFinder, findsOneWidget);

    final Icon icon = tester.widget(iconFinder);

    expect(icon.color, Colors.black);

    expect(icon.size, 20);

    expect(icon.icon, Icons.favorite_border);

    final gestureFinder = find.byKey(const Key('heartButton'));

    await tester.tap(gestureFinder);

    await tester.pumpAndSettle();

    final Icon iconAfter = tester.widget(iconFinder);

    expect(iconAfter.size, 25);
    expect(iconAfter.color, Colors.pink);
    expect(iconAfter.icon, Icons.favorite);
  });
}
