import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_matcher/main.dart';

void main() {
  testWidgets('Nav Smoke Test: testNavMain', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('News will go here!'), findsOneWidget);
  });

  testWidgets('Nav Smoke Test: testNavQuest', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('Please select your reaction to getting player killed:'), findsOneWidget);
    expect(find.text('News will go here!'), findsNothing);
  });

  testWidgets('Nav Smoke Test: testNavFriends', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('You have friends:'), findsOneWidget);
    expect(find.text('News will go here!'), findsNothing);
  });

  testWidgets('Nav Smoke Test: testNavAccountProfile', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.security));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('AccountProfilePage'), findsOneWidget);
    expect(find.text('News will go here!'), findsNothing);
  });

  testWidgets('Nav Smoke Test: testNavHistory', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.history));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('HistoryPage'), findsOneWidget);
    expect(find.text('News will go here!'), findsNothing);
  });

  testWidgets('Nav Smoke Test: testNavMM', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.people));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('MatchMakingPage'), findsOneWidget);
    expect(find.text('News will go here!'), findsNothing);
  });

  testWidgets('Nav Smoke Test: testNavSettings', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.text('SettingsPage'), findsOneWidget);
    expect(find.text('News will go here!'), findsNothing);
  });
}
