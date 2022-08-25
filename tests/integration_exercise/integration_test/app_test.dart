// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ideast/main.dart';
import 'package:ideast/model/idea_model.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testando as nossas páginas com integration test', () {
    testWidgets('Login', (WidgetTester tester) async {
      await login(tester);
    });

    testWidgets('SignUp', (WidgetTester tester) async {
      await signUpAndLogin(tester);
    });

    testWidgets('Create Idea', (WidgetTester tester) async {
      await login(tester);
      await addIdeaFromHomePage(tester);
    });

    testWidgets('Login, add idea and signout', (WidgetTester tester) async {
      await login(tester);
      await addIdeaFromHomePage(tester);
      await signOutFromHome(tester);
    });

    testWidgets('Login, add idea, exclude idea and signout', (WidgetTester tester) async {
      await login(tester);
      await addIdeaFromHomePage(tester);
      await excludeIdea(tester);
      await signOutFromHome(tester);
    });
  });
}

Future login(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('emailLoginField')), 'gui@gmail.com');
  await tester.enterText(find.byKey(const Key('passwordLoginField')), '132137213981');
  await tester.tap(find.byKey(const Key('goToHomePage')));
  await tester.pumpAndSettle();
}

Future addIdeaFromHomePage(WidgetTester tester) async {
  await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
  sleep(const Duration(seconds: 2));
  await tester.pumpAndSettle();
  sleep(const Duration(seconds: 2));
  await tester.enterText(find.byKey(const ValueKey('newIdeaField')), 'New Idea');
  sleep(const Duration(seconds: 2));
  await tester.enterText(find.byKey(const ValueKey('inspirationField')), 'Inspiration Idea');
  sleep(const Duration(seconds: 2));
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();
  sleep(const Duration(seconds: 2));
  await tester.tap(find.byKey(const Key('addIdeaButton')));
  await tester.pumpAndSettle();
  sleep(const Duration(seconds: 5));
}

Future signUpAndLogin(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('goToSignUpPage')));
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('text_field_signup_email')), 'gui@gmail.com');
  await tester.enterText(find.byKey(const Key('text_field_signup_password')), 'oioioioi');
  await tester.enterText(find.byKey(const Key('text_field_signup_confirm_password')), 'oioioioi');
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
  sleep(const Duration(seconds: 2));
  await tester.tap(find.byKey(const Key('SignUpButton')));
  await tester.pumpAndSettle();
  expect(find.byKey(const Key('addButton')), findsOneWidget);
  sleep(const Duration(seconds: 5));
}

Future signOutFromHome(WidgetTester tester) async {
  await tester.tap(find.byKey(const ValueKey('LogoutKey')));
  await tester.pumpAndSettle();
}

Future excludeIdea(WidgetTester tester) async {
  final state = tester.state(find.byType(Scaffold));

  final title = Provider.of<IdeasModel>(state.context, listen: false).getAllIdeas[0].title;

  sleep(const Duration(seconds: 2));

  final tempTitle = title!;
  
  await tester.drag(find.byKey(ValueKey(title.toString())), const Offset(-600, 0));
  
  sleep(const Duration(seconds: 2));
  
  await tester.pumpAndSettle();
  
  expect(find.text(tempTitle), findsNothing);
}
