import 'package:best_matcher/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import './mock.dart';
void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('Home Page Smoke Test: testMainPageNavMatchesNope', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    // Verify that text on home page
    expect(find.text('News: First version of the app live!'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    // await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    // expect(find.text('Nope'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMatchesLike', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text on home page
    // expect(find.text('Like'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    // await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    // expect(find.text('Talia'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMatchesUser1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text on home page
    // expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    // await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    // expect(find.text('Talia'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMatchesUser2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text on home page
    // expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    // await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    // expect(find.text('Scott'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMatchesBio', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text on home page
    // expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    // await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    // expect(find.text('I love hiking and exploring new places!'), findsOneWidget);
  });

}