import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ar_indoor_nav_admin/main.dart' as app;
import 'dart:math';

void main() {
  group('App test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets(
        'TS06 TC01 Check edit room with valid room name and valid room category',
        (tester) async {
      const String errorMessageSnackBar = "some error happened while logging";

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

      //click room

      final roomListView = find.byKey(const Key("roomListView"));
      final gamezoneRoom = find.byKey(const Key('Room0'));

      await tester.tap(gamezoneRoom);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      final roomNameField = find.byKey(const Key('roomNameField'));

      await tester.tap(roomNameField);

      // await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      //click it here to focus on it
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
      await tester.testTextInput.receiveAction(TextInputAction.done);

      String possibles = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      Random rnd = new Random();
      int idx = rnd.nextInt(possibles.length);
      String newText = 'Updatedfield' + possibles[idx];

      await tester.enterText(roomNameField, newText);
      await Future.delayed(const Duration(seconds: 10));

      final editRoomSaveButton = find.byKey(const Key('editRoomSaveButton'));

      await tester.tap(editRoomSaveButton);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 10));

      //check it's updated
      final gamezoneRoom2 = find.byKey(const Key('Room0'));

      await tester.tap(gamezoneRoom2);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      final roomNameField2 = find.byKey(const Key('roomNameField'));

      expect(roomNameField2, findsOneWidget);
      // expect(find.text("Updatedfield"), findsOneWidget);
      expect(find.text(newText), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
    });

    // testWidgets(
    //     'TS06 TC02 Check edit room with invalid room name and valid room category',
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

    //   //click room

    //   final roomListView = find.byKey(const Key("roomListView"));
    //   final gamezoneRoom = find.byKey(const Key('Room0'));

    //   await tester.tap(gamezoneRoom);
    //   await tester.pumpAndSettle();
    //   await Future.delayed(const Duration(seconds: 5));

    //   final roomNameField = find.byKey(const Key('roomNameField'));

    //   await tester.tap(roomNameField);

    //   // await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
    //   //click it here to focus on it
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.backspace);
    //   await tester.testTextInput.receiveAction(TextInputAction.done);

    //   // String possibles = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    //   // Random rnd = new Random();
    //   // int idx = rnd.nextInt(possibles.length);
    //   // String newText = 'Updatedfield' + possibles[idx];

    //   // await tester.enterText(roomNameField, newText);
    //   await tester.enterText(roomNameField, '');
    //   await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
    //   await Future.delayed(const Duration(seconds: 10));

    //   final editRoomSaveButton = find.byKey(const Key('editRoomSaveButton'));

    //   await tester.tap(editRoomSaveButton);
    //   await tester.pumpAndSettle();

    //   expect(find.text('Name is required! Can\'t be null'), findsOneWidget);

    //   await Future.delayed(const Duration(seconds: 15));
    // });
  });
}


/// flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart