import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_matcher/main.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import './mock.dart';


void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Nav Smoke Test: testNavMainTitle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('BestMatcher, Welcome '), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMainHomeWelcome', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('Have a Great Time match making'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMainQuestTitle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('questionnaire'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMainHomeTitle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMainFriendsTitle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('friends list'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMainMMTitle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('find players'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMainSettingsTitle', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('settings'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavMain', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pump();

    // Verify that text has changed to selected page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavQuest', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('News: First version of the app live!'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();
  });

  testWidgets('Nav Smoke Test: testNavFriends', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.favorite));
  });

  testWidgets('Nav Smoke Test: testNavMM', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.people));
    await tester.pump();
  });

  testWidgets('Nav Smoke Test: testNavSettings', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that text has changed to selected page
    await tester.pumpAndSettle();
    expect(find.text('Sign Out'), findsOneWidget);
  });
}
