import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ar_indoor_nav_admin/main.dart' as app;
import 'dart:math';

void main() {
  group('App test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    // testWidgets('TS07 TC01 Check add category with empty category name',
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
    //   await Future.delayed(const Duration(seconds: 3));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 3));

    //   await Future.delayed(const Duration(seconds: 5));
    //   final buildingListHeaderText =
    //       find.byKey(const Key("buildingListHeader"));
    //   expect(buildingListHeaderText, findsOneWidget);

    //   final bldgListView = find.byKey(const Key("bldgListView"));
    //   final ednaBldg = find.byKey(const Key('Bldg1'));
    //   await tester.tap(ednaBldg);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 5));

    //   final manageCategoriesButton =
    //       find.byKey(const Key('manageCategoriesButton'));
    //   await tester.tap(manageCategoriesButton);
    //   await tester.pumpAndSettle();

    //   final addCategoryBtn = find.byKey(const Key('addCategoryBtn'));
    //   await tester.tap(addCategoryBtn);
    //   await tester.pumpAndSettle();

    //   String newCategoryString = "";
    //   final categoryNameField = find.byKey(const Key('categoryNameField'));
    //   await tester.enterText(categoryNameField, newCategoryString);
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();

    //   final addCategorySubmitButton =
    //       find.byKey(const Key('addCategorySubmitButton'));
    //   await tester.tap(addCategorySubmitButton);

    //   await tester.pumpAndSettle();
    //   // await Future.delayed(const Duration(seconds: 5));

    //   const String errorMessageSnackBar = "Category name is required";

    //   expect(find.text(errorMessageSnackBar), findsOneWidget);
    //   await Future.delayed(const Duration(seconds: 15));
    // });

    testWidgets('TS07 TC02 Check add category with existing category name',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailField = find.byKey(const Key("emailField"));
      final passwordField = find.byKey(const Key("passwordField"));
      final loginButton = find.byKey(const Key("loginButton"));

      await tester.pumpAndSettle();
      await tester.enterText(emailField, 'abe@gmail.com');
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

      final bldgListView = find.byKey(const Key("bldgListView"));
      final ednaBldg = find.byKey(const Key('Bldg1'));
      await tester.tap(ednaBldg);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      final manageCategoriesButton =
          find.byKey(const Key('manageCategoriesButton'));
      await tester.tap(manageCategoriesButton);
      await tester.pumpAndSettle();

      final addCategoryBtn = find.byKey(const Key('addCategoryBtn'));
      await tester.tap(addCategoryBtn);
      await tester.pumpAndSettle();

      String existingNewCategoryString = "River";
      final categoryNameField = find.byKey(const Key('categoryNameField'));
      await tester.enterText(categoryNameField, existingNewCategoryString);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final addCategorySubmitButton =
          find.byKey(const Key('addCategorySubmitButton'));
      await tester.tap(addCategorySubmitButton);

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      const String errorMessageSnackBar = "Error: failed to create category!";
      expect(find.text(errorMessageSnackBar), findsOneWidget);
      await Future.delayed(const Duration(seconds: 15));
    });

    /////////testcase3
    // testWidgets('TS07 TC03 Check add category with valid category name',
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
    //   await Future.delayed(const Duration(seconds: 3));

    //   await tester.tap(loginButton);
    //   await tester.pumpAndSettle();

    //   await Future.delayed(const Duration(seconds: 3));

    //   await Future.delayed(const Duration(seconds: 5));
    //   final buildingListHeaderText =
    //       find.byKey(const Key("buildingListHeader"));
    //   expect(buildingListHeaderText, findsOneWidget);

    //   final bldgListView = find.byKey(const Key("bldgListView"));
    //   final ednaBldg = find.byKey(const Key('Bldg1'));
    //   await tester.tap(ednaBldg);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 5));

    //   final manageCategoriesButton =
    //       find.byKey(const Key('manageCategoriesButton'));
    //   await tester.tap(manageCategoriesButton);
    //   await tester.pumpAndSettle();

    //   final addCategoryBtn = find.byKey(const Key('addCategoryBtn'));
    //   await tester.tap(addCategoryBtn);
    //   await tester.pumpAndSettle();

    //   String possibles = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    //   Random rnd = new Random();
    //   int idx = rnd.nextInt(possibles.length);
    //   String newCategoryString = "River" + possibles[idx];
    //   final categoryNameField = find.byKey(const Key('categoryNameField'));
    //   await tester.enterText(categoryNameField, newCategoryString);
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();

    //   final addCategorySubmitButton =
    //       find.byKey(const Key('addCategorySubmitButton'));
    //   await tester.tap(addCategorySubmitButton);

    //   await tester.pumpAndSettle();
    //   // await Future.delayed(const Duration(seconds: 5));

    //   expect(find.text(newCategoryString), findsOneWidget);
    //   await Future.delayed(const Duration(seconds: 15));
    // });
  });
}


/// flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart