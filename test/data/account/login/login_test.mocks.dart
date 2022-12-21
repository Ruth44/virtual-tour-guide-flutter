// Mocks generated by Mockito 5.0.14 from annotations
// in ar_indoor_nav_admin/test/data/account/login/login_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:ar_indoor_nav_admin/data/account/data_provider/account_local_provider.dart'
    as _i3;
import 'package:ar_indoor_nav_admin/data/account/data_provider/account_remote_provider.dart'
    as _i2;
import 'package:ar_indoor_nav_admin/data/account/repository/account_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAccountRemoteDataProvider_0 extends _i1.Fake
    implements _i2.AccountRemoteDataProvider {}

class _FakeAccountLocalDataProvider_1 extends _i1.Fake
    implements _i3.AccountLocalDataProvider {}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i4.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AccountRemoteDataProvider get remoteDataProvider =>
      (super.noSuchMethod(Invocation.getter(#remoteDataProvider),
              returnValue: _FakeAccountRemoteDataProvider_0())
          as _i2.AccountRemoteDataProvider);
  @override
  _i3.AccountLocalDataProvider get localDataProvider =>
      (super.noSuchMethod(Invocation.getter(#localDataProvider),
              returnValue: _FakeAccountLocalDataProvider_1())
          as _i3.AccountLocalDataProvider);
  @override
  _i5.Future<void> signUpAdmin(String? name, String? email, String? password, String? buildingId) =>
      (super.noSuchMethod(
          Invocation.method(#signUpAdmin, [name, email, password,buildingId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> login(String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#login, [email, password]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<bool> isSignedIn() =>
      (super.noSuchMethod(Invocation.method(#isSignedIn, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<bool> changePassword(String? oldPassword, String? newPassword) =>
      (super.noSuchMethod(
          Invocation.method(#changePassword, [oldPassword, newPassword]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}
