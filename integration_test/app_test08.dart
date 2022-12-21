import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ar_indoor_nav_admin/main.dart' as app;
import 'dart:math';

void main() {
  // group('TS08 TC01', () {
  //   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //   testWidgets('TS08 TC01 Check remove category with used category name',
  //       (tester) async {
  //     app.main();
  //     await tester.pumpAndSettle();

  //     final emailField = find.byKey(const Key("emailField"));
  //     final passwordField = find.byKey(const Key("passwordField"));
  //     final loginButton = find.byKey(const Key("loginButton"));

  //     await tester.pumpAndSettle();
  //     await tester.enterText(emailField, 'abe@gmail.com');
  //     await tester.enterText(passwordField, '12345678Aa!');

  //     // await tester.pumpAndSettle();

  //     await tester.testTextInput.receiveAction(TextInputAction.done);
  //     await tester.pumpAndSettle();
  //     await Future.delayed(const Duration(seconds: 3));

  //     await tester.tap(loginButton);
  //     await tester.pumpAndSettle();

  //     await Future.delayed(const Duration(seconds: 3));

  //     await Future.delayed(const Duration(seconds: 5));
  //     final buildingListHeaderText =
  //         find.byKey(const Key("buildingListHeader"));
  //     expect(buildingListHeaderText, findsOneWidget);

  //     final bldgListView = find.byKey(const Key("bldgListView"));
  //     final ednaBldg = find.byKey(const Key('Bldg1'));
  //     await tester.tap(ednaBldg);
  //     await tester.pumpAndSettle();
  //     await Future.delayed(const Duration(seconds: 5));

  //     final manageCategoriesButton =
  //         find.byKey(const Key('manageCategoriesButton'));
  //     await tester.tap(manageCategoriesButton);
  //     await tester.pumpAndSettle();

  //     // final addCategoryBtn = find.byKey(const Key('addCategoryBtn'));
  //     // await tester.tap(addCategoryBtn);
  //     // await tester.pumpAndSettle();

  //     // String possibles = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  //     // Random rnd = new Random();
  //     // int idx = rnd.nextInt(possibles.length);
  //     // String newCategoryString = "Riverhere" + possibles[idx];
  //     // final categoryNameField = find.byKey(const Key('categoryNameField'));
  //     // await tester.enterText(categoryNameField, newCategoryString);
  //     // await tester.testTextInput.receiveAction(TextInputAction.done);
  //     // await tester.pumpAndSettle();

  //     // final addCategorySubmitButton =
  //     //     find.byKey(const Key('addCategorySubmitButton'));
  //     // await tester.tap(addCategorySubmitButton);

  //     // await tester.pumpAndSettle();
  //     // // await Future.delayed(const Duration(seconds: 5));

  //     // expect(find.text(newCategoryString), findsOneWidget);
  //     // await Future.delayed(const Duration(seconds: 15));
  //     // await Future.delayed(const Duration(seconds: 25));

  //     //delete it now
  //     String todeleteCategoryString = "spidddd99";
  //     await tester.dragUntilVisible(
  //       find.text(todeleteCategoryString), // what you want to find
  //       find.byKey(Key('OnboardingCarousel')), // widget you want to scroll
  //       const Offset(-250, 0), // delta to move
  //     );

  //     final textWidget = find.text(todeleteCategoryString);

  //     final parentWidget =
  //         find.ancestor(of: textWidget, matching: find.byType(ListTile));
  //     final deleteBtnWidget =
  //         find.descendant(of: parentWidget, matching: find.byType(IconButton));

  //     expect(parentWidget, findsOneWidget);
  //     expect(deleteBtnWidget, findsOneWidget);

  //     await Future.delayed(const Duration(seconds: 5));
  //     await tester.tap(deleteBtnWidget);
  //     await tester.pumpAndSettle();

  //     const String errorMessageSnackBar = "Error: failed to delete category!";
  //     expect(find.text(errorMessageSnackBar), findsOneWidget);
  //     await Future.delayed(const Duration(seconds: 15));
  //   });
  // });
  group('TS08 TC02', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('TS08 TC02 Check remove category with unused category name',
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

      String possibles = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      Random rnd = new Random();
      int idx = rnd.nextInt(possibles.length);
      String newCategoryString = "Riverhere" + possibles[idx];
      final categoryNameField = find.byKey(const Key('categoryNameField'));
      await tester.enterText(categoryNameField, newCategoryString);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final addCategorySubmitButton =
          find.byKey(const Key('addCategorySubmitButton'));
      await tester.tap(addCategorySubmitButton);

      await tester.pumpAndSettle();
      // await Future.delayed(const Duration(seconds: 5));

      expect(find.text(newCategoryString), findsOneWidget);
      await Future.delayed(const Duration(seconds: 15));
      await Future.delayed(const Duration(seconds: 25));

      //delete it now
      await tester.dragUntilVisible(
        find.text(newCategoryString), // what you want to find
        find.byKey(Key('OnboardingCarousel')), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );

      // final textWidget =
      //     find.byKey(Key(newCategoryString)) as Text; // categoryListTile$idx
      // final String idxStr = textWidget.key.toString().substring(16);

      // final deleteBtnWidget = find.byKey(Key('categoryDeleteBtn$idxStr'));
      // await Future.delayed(const Duration(seconds: 15));

      final textWidget = find.text(newCategoryString);

      final parentWidget =
          find.ancestor(of: textWidget, matching: find.byType(ListTile));
      final deleteBtnWidget =
          find.descendant(of: parentWidget, matching: find.byType(IconButton));

      expect(parentWidget, findsOneWidget);
      expect(deleteBtnWidget, findsOneWidget);

      await Future.delayed(const Duration(seconds: 5));
      await tester.tap(deleteBtnWidget);

      await Future.delayed(const Duration(seconds: 15));
    });
  });
}


/// flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart