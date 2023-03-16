import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:best_matcher/main.dart';

void main() {
  testWidgets('Login Smoke Test: testLogInScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppLogin());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);

    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.login));
    await tester.pump();
  });

  testWidgets('Login Smoke Test: testAccountCreationLogInScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppAccountPage());

    // Verify that text starts on login page
    expect(find.text('News will go here!'), findsNothing);
    expect(find.byIcon(Icons.login), findsNothing);

    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.account_box));
    await tester.pump();
  });
}
