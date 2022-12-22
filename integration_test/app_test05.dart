import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:virtual_tour_guide_manager/main.dart' as app;

void main() {
  group('App test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    // testWidgets('TS05 TS01: Check login with valid email and valid password',
    //     (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();

    //   final emailField = find.byKey(const Key("emailField"));
    //   final passwordField = find.byKey(const Key("passwordField"));
    //   final loginButton = find.byKey(const Key("loginButton"));

    //   await tester.pumpAndSettle();
    //   await tester.enterText(emailField, 'abe@gmail.com');
    //   await tester.enterText(passwordField, '12345678Aa!');

    //   // await tester.pumpAndSettle();

    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 5));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 5));
    //   final buildingListHeaderText =
    //       find.byKey(const Key("buildingListHeader"));
    //   expect(buildingListHeaderText, findsOneWidget);
    //   // expect(buildingListHeaderText.data, "Buildings");

    //   // expect(emailField, findsOneWidget);
    //   // expect(passwordField, findsOneWidget);
    // });

    // testWidgets('TS05 TS02', (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();

    //   final emailField = find.byKey(const Key("emailField"));
    //   final passwordField = find.byKey(const Key("passwordField"));
    //   final loginButton = find.byKey(const Key("loginButton"));

    //   await tester.pumpAndSettle();
    //   await tester.enterText(emailField, 'abcd');
    //   await tester.enterText(passwordField, '123456');

    //   // await tester.pumpAndSettle();

    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 5));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 5));
    //   // final buildingListHeaderText =
    //   //     find.byKey(const Key("buildingListHeader"));
    //   // expect(buildingListHeaderText, findsOneWidget);

    //   expect(find.text('Invalid email address.'), findsOneWidget);

    //   // expect(buildingListHeaderText.data, "Buildings");

    //   // expect(emailField, findsOneWidget);
    //   // expect(passwordField, findsOneWidget);

    // });

    // testWidgets('TS05 TC03', (tester) async {
    //   const String errorMessageSnackBar = "incorrect email or password";

    //   app.main();
    //   await tester.pumpAndSettle();

    //   final emailField = find.byKey(const Key("emailField"));
    //   final passwordField = find.byKey(const Key("passwordField"));
    //   final loginButton = find.byKey(const Key("loginButton"));

    //   await tester.pumpAndSettle();
    //   await tester.enterText(emailField, 'abe@gmail.com');
    //   await tester.enterText(passwordField, '12345678Ad!');

    //   // await tester.pumpAndSettle();

    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 3));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 3));

    //   expect(find.text(errorMessageSnackBar), findsOneWidget);
    // });

    // testWidgets('TS05 TC04', (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();

    //   final emailField = find.byKey(const Key("emailField"));
    //   final passwordField = find.byKey(const Key("passwordField"));
    //   final loginButton = find.byKey(const Key("loginButton"));

    //   await tester.pumpAndSettle();
    //   await tester.enterText(emailField, 'abcd');
    //   await tester.enterText(passwordField, '123');

    //   // await tester.pumpAndSettle();

    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 3));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 3));
    //   // final buildingListHeaderText =
    //   //     find.byKey(const Key("buildingListHeader"));
    //   // expect(buildingListHeaderText, findsOneWidget);

    //   expect(find.text('Invalid email address.'), findsOneWidget);
    //   expect(
    //       find.text(
    //           'Password must be at least 8 characters and contain a number, a  special character, a capital and a small letter.'),
    //       findsOneWidget);
    // });
    // testWidgets('TS05 TC05', (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();

    //   final emailField = find.byKey(const Key("emailField"));
    //   final passwordField = find.byKey(const Key("passwordField"));
    //   final loginButton = find.byKey(const Key("loginButton"));

    //   await tester.pumpAndSettle();
    //   await tester.enterText(emailField, '');
    //   await tester.enterText(passwordField, '');

    //   // await tester.pumpAndSettle();

    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 3));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 3));
    //   // final buildingListHeaderText =
    //   //     find.byKey(const Key("buildingListHeader"));
    //   // expect(buildingListHeaderText, findsOneWidget);

    //   expect(find.text('Email is required! Can\'t be null'), findsOneWidget);
    //   expect(find.text('Password is required!'), findsOneWidget);

    //   // expect(buildingListHeaderText.data, "Buildings");

    //   // expect(emailField, findsOneWidget);
    //   // expect(passwordField, findsOneWidget);

    //   // Password is required!
    // });

    // testWidgets('TS05 TC06', (tester) async {
    //   const String errorMessageSnackBar = "incorrect email or password";

    //   app.main();
    //   await tester.pumpAndSettle();

    //   final emailField = find.byKey(const Key("emailField"));
    //   final passwordField = find.byKey(const Key("passwordField"));
    //   final loginButton = find.byKey(const Key("loginButton"));

    //   await tester.pumpAndSettle();
    //   await tester.enterText(emailField,
    //       'nonexistingcredential@gmail.com'); // credentials that don't exist
    //   await tester.enterText(passwordField, '123@!Abcd');

    //   // await tester.pumpAndSettle();

    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 3));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 3));

    //   expect(find.text(errorMessageSnackBar), findsOneWidget);
    // });

    testWidgets('TS05 TC07', (tester) async {
      const String errorMessageSnackBar = "some error happened while logging";

      app.main();
      await tester.pumpAndSettle();

      final emailField = find.byKey(const Key("emailField"));
      final passwordField = find.byKey(const Key("passwordField"));
      final loginButton = find.byKey(const Key("loginButton"));

      await tester.pumpAndSettle();
      await tester.enterText(emailField, 'ABE@gmail.com');
      await tester.enterText(passwordField, '12345678Aa!');

      // await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 3));

      await Future.delayed(const Duration(seconds: 5));
      final buildingListHeaderText =
          find.byKey(const Key("buildingListHeader"));
      expect(buildingListHeaderText, findsOneWidget);
    });
  });
}
