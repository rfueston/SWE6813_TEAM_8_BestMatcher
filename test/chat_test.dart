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
  testWidgets('Home Page Smoke Test: testMainPageNavChat', (WidgetTester tester) async {
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
}