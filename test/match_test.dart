import 'package:best_matcher/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import './mock.dart';

void main() {

  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Home Page Smoke Test: testMainPageNavMatchesNope', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpAndSettle();
    await tester.pumpWidget(const MyApp());

    // Verify that text on home page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.people));
    await tester.pump();

    // Verify that text on home page
    await tester.pumpAndSettle();
    expect(find.text('Nope'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testMainPageNavMatchesAdd', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpAndSettle();
    await tester.pumpWidget(const MyApp());

    // Verify that text on home page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.people));
    await tester.pump();

    // Verify that text on home page
    expect(find.text('Add'), findsOneWidget);
  });
}