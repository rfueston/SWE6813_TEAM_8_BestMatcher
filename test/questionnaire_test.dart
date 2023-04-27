import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_matcher/main.dart';
import './mock.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Quest Smoke Test: testQuestFindsInstruct', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Make your gaming profile'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestFindsQ1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Rate the following statements about your playing style '
        'from 0 to 5, with 0 being the least and 5 being the '
        'most.'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestSendOptionPresent', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.byIcon(Icons.outgoing_mail), findsOneWidget);
  });


  testWidgets('Quest Smoke Test: testQuestfindsQuestions1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Rate your aggression when you play:'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestfindsQuestions2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Rate how seriously you take the game:'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestfindsQuestions3', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Rate your skill at the game:'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestfindsQuestions4', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Rate how much you strategize when you play the game:'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestfindsQuestions5', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    await tester.pumpAndSettle();
    expect(find.text('News: First version of the app live!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    expect(find.text('Rate how well you work in a team:'), findsOneWidget);
  });
}
