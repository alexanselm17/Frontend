import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop0koa_frontend/view/account/accounts.dart'; // Adjust this import to your file's location

void main() {
  group('AccountPage Widget Tests', () {
    testWidgets('Check if all UI elements are present',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AccountPage()));

      // Check if app bar is present
      expect(find.byType(AppBar), findsOneWidget);

      // Check if profile image is present
      expect(find.byType(Container).at(1), findsOneWidget);

      // Check if account name is present
      expect(find.text('Kahawa Sukari Naivas'), findsOneWidget);

      // Check if verified badge is present
      expect(find.text('Verified'), findsOneWidget);
      expect(find.byIcon(Icons.verified), findsOneWidget);

      // Check if "Your Balance" text is present
      expect(find.text('Your Balance'), findsOneWidget);

      // Check if visibility toggle icon button is present
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Check if balance amount text is present
      expect(find.text('Ksh 234,567.01'), findsOneWidget);

      // Check if "Withdraw From Wallet" button is present
      expect(find.text('Withdraw From Wallet'), findsOneWidget);

      // Check if ListTiles are present
      expect(find.byType(ListTile), findsNWidgets(3));
      expect(find.byIcon(Icons.call), findsOneWidget);
      expect(find.byIcon(Icons.report), findsOneWidget);
      expect(find.byIcon(Icons.feedback), findsOneWidget);
    });

    testWidgets('Toggle balance visibility', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AccountPage()));

      // Check initial state (balance should be visible)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.text('Ksh 234,567.01'), findsOneWidget);

      // Tap the visibility icon button to toggle visibility
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Check toggled state (balance should be hidden)
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.text('Ksh 234,567.01'), findsNothing);

      // Tap the visibility icon button again to toggle visibility
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Check toggled state (balance should be visible again)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.text('Ksh 234,567.01'), findsOneWidget);
    });

    testWidgets('Withdraw button press', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AccountPage()));

      // Tap the withdraw button
      await tester.tap(find.text('Withdraw From Wallet'));
      await tester.pump();

      // Verify that the button was pressed (you can add more assertions if there are expected outcomes)
    });

    testWidgets('ListTiles onTap actions', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AccountPage()));

      // Tap on the "Contact Us" ListTile
      await tester.tap(find.byIcon(Icons.call));
      await tester.pump();

      // Tap on the "Report Abuse" ListTile
      await tester.tap(find.byIcon(Icons.report));
      await tester.pump();

      // Tap on the "Submit Feedback" ListTile
      await tester.tap(find.byIcon(Icons.feedback));
      await tester.pump();
    });
  });
}
