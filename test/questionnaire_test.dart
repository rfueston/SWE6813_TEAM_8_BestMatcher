import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:best_matcher/main.dart';

void main() {
  testWidgets('Quest Smoke Test: testQuestFindsQ1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    // Verify that Question is present on selected page
    expect(find.text('How serious do you take online gaming?'), findsOneWidget);
  });

  testWidgets('Quest Smoke Test: testQuestSendOptionPresent', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that text starts on default page
    expect(find.text('News will go here!'), findsOneWidget);
    await tester.pump();

    // Tap icon for navigation
    await tester.tap(find.byIcon(Icons.add_chart_rounded));
    await tester.pump();

    // Verify that text has changed to selected page
    expect(find.byIcon(Icons.outgoing_mail), findsOneWidget);
  });
}
