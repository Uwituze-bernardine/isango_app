import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_theme.dart';
import 'package:isango_app/screens/auth/signup_screen.dart';

void main() {
  group('SignupScreen', () {
    late Widget testWidget;

    setUp(() {
      testWidget = MaterialApp(
        theme: AppTheme.light(),
        routes: {
          AppRoutes.login: (context) => const Scaffold(body: Text('Login')),
        },
        home: const SignupScreen(),
      );
    });

    testWidgets('shows required-field validation errors', (tester) async {
      await tester.pumpWidget(testWidget);

      final createButton = find.widgetWithText(ElevatedButton, 'Create Account');
      expect(createButton, findsOneWidget);

      await tester.ensureVisible(createButton);
      await tester.tap(createButton);
      await tester.pump();

      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
      expect(find.text('Confirm your password'), findsOneWidget);
    });

    testWidgets('shows password confirmation mismatch error', (tester) async {
      await tester.pumpWidget(testWidget);

      await tester.enterText(find.byType(TextFormField).at(0), 'Student User');
      await tester.enterText(find.byType(TextFormField).at(1), 'student@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.enterText(find.byType(TextFormField).at(3), 'password321');

      await tester.tap(find.widgetWithText(ElevatedButton, 'Create Account'));
      await tester.pump();

      expect(find.text('Passwords do not match'), findsOneWidget);
    });

    testWidgets('navigates to /login when sign in link is tapped', (tester) async {
      await tester.pumpWidget(testWidget);

      final signInLink = find.text('Sign In');
      expect(signInLink, findsOneWidget);

      await tester.ensureVisible(signInLink);
      await tester.tap(signInLink);
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
    });
  });
}
