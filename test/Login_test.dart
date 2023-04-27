import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_matcher/main.dart';
import './mock.dart';
void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('Login Smoke Test: testLogInScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppLogin());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);

    //log in page is present
    // expect(find.text('Username'), findsOneWidget);
    // expect(find.text('Password'), findsOneWidget);
  });

  testWidgets('Login Smoke Test: testLogInScreenButtonsPresent', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppLogin());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);

    //icons for navigation are present
    // expect(find.byIcon(Icons.login), findsOneWidget);
    expect(find.byIcon(Icons.account_box), findsOneWidget);
  });

  testWidgets(
      'Login Smoke Test: testLogInWithAccount', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppLogin());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);

    // enter text
    await tester.enterText(find.byKey(Key('loginusername')), 'test');
    await tester.pump();
    await tester.enterText(find.byKey(Key('loginpassword')), 'test1');
    await tester.pump();

    expect(find.byIcon(Icons.login), findsOneWidget);
  });

  testWidgets(
      'Login Smoke Test: testLogInWithToManyCharacters', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppLogin());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);

    // enter text
    await tester.enterText(find.byKey(Key('loginusername')), 'abcdefghijklmnopqrstuvwxyz');
    await tester.pump();

    expect(find.text('abcdefghijklmnopqrstuvwxyz'), findsNothing);
    expect(find.text('abcdefghijklmnopqrst'), findsOneWidget);
  });

  testWidgets(
      'Login Smoke Test: testLogInUsernameNotObscured', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppLogin());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);

    expect((tester.firstWidget(find.byType(TextField)) as TextField).obscureText, false);

  });
}

