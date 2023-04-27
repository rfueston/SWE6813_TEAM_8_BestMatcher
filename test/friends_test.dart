import 'package:best_matcher/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import './mock.dart';
import 'package:best_matcher/friends_list_page.dart';

void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Home Page Smoke Test: testFriendsShow', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    // Verify that text on home page
    expect(find.text('News: First version of the app live!'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    await tester.pumpAndSettle();
    expect(find.text('You Have Friends?'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testFriendsTab', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    // Verify that text on home page
    expect(find.text('News: First version of the app live!'), findsOneWidget);

    // Tap icon for navigation to verify it is present
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.person_outline_sharp));
    await tester.pump();
  });

  testWidgets('Home Page Smoke Test: testMoreThanOneFriendsShow', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    // Verify that text on home page
    expect(find.text('News: First version of the app live!'), findsOneWidget);

    // Tap icon for navigation to verify it is present
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    expect(find.text('test user 2'), findsOneWidget);
  });


}