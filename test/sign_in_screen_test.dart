import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_theme.dart';
import 'package:isango_app/screens/auth/sign_in_screen.dart';

void main() {
  group('SignInScreen', () {
    late Widget testWidget;

    setUp(() {
      testWidget = MaterialApp(
        theme: AppTheme.light(),
        routes: {
          AppRoutes.signUp: (context) => const Scaffold(body: Text('Sign Up')),
        },
        home: const SignInScreen(),
      );
    });

    testWidgets('shows inline validation errors for email and password', (tester) async {
      await tester.pumpWidget(testWidget);

      // Find the sign in button
      final signInButton = find.text('Sign In');
      expect(signInButton, findsOneWidget);

      // Tap the button without filling fields
      await tester.tap(signInButton);
      await tester.pump();

      // Check for validation errors
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('navigates to /signup when sign up link is tapped', (tester) async {
      await tester.pumpWidget(testWidget);

      // Find the sign up link text
      final signUpLink = find.widgetWithText(GestureDetector, 'Sign Up');
      expect(signUpLink, findsOneWidget);

      // Tap the link
      await tester.ensureVisible(signUpLink);
      await tester.tap(signUpLink);
      await tester.pumpAndSettle();

      // Check navigation
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('shows loading state and disables button during sign in', (tester) async {
      await tester.pumpWidget(testWidget);

      // Fill in valid email and password
      await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password');

      // Tap the sign in button
      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pump();

      // Check loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, false);

      // Wait for the simulated delay
      await tester.pump(const Duration(seconds: 2));

      // Check that loading is gone and button is enabled
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, true);
    });
  });
}