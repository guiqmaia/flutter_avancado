import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_flutter/main.dart';

sleepSec(int sec) => sleep(Duration(seconds: sec));

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Testando MyHomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Increment'));

    await tester.pumpAndSettle();

    sleepSec(2);

    expect(find.text('1'), findsOneWidget);

    sleepSec(2);

    await tester.enterText(find.byKey(const Key('text_field_login')), 'JDONIASJIDSJAODJSAOIJ2093e210932091');

    sleepSec(2);

    await tester.enterText(find.byKey(const Key('text_field_senha')), 'JDONIASJIDSJAODJSAOIJ2093e210932091');

    await tester.tap(find.byTooltip('Increment'));

    await tester.pumpAndSettle();

    sleepSec(2);
  });
}
