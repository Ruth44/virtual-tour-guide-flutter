// Mocks generated by Mockito 5.3.2 from annotations
// in virtual_tour_guide_manager/test/data/account/login/login_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:virtual_tour_guide_manager/data/account/data_provider/account_local_provider.dart'
    as _i3;
import 'package:virtual_tour_guide_manager/data/account/data_provider/account_remote_provider.dart'
    as _i2;
import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAccountRemoteDataProvider_0 extends _i1.SmartFake
    implements _i2.AccountRemoteDataProvider {
  _FakeAccountRemoteDataProvider_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAccountLocalDataProvider_1 extends _i1.SmartFake
    implements _i3.AccountLocalDataProvider {
  _FakeAccountLocalDataProvider_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AccountRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountRepository extends _i1.Mock implements _i4.AccountRepository {
  MockAccountRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AccountRemoteDataProvider get remoteDataProvider => (super.noSuchMethod(
        Invocation.getter(#remoteDataProvider),
        returnValue: _FakeAccountRemoteDataProvider_0(
          this,
          Invocation.getter(#remoteDataProvider),
        ),
      ) as _i2.AccountRemoteDataProvider);
  @override
  _i3.AccountLocalDataProvider get localDataProvider => (super.noSuchMethod(
        Invocation.getter(#localDataProvider),
        returnValue: _FakeAccountLocalDataProvider_1(
          this,
          Invocation.getter(#localDataProvider),
        ),
      ) as _i3.AccountLocalDataProvider);
  @override
  _i5.Future<void> signUpAdmin(
    String? name,
    String? email,
    String? password,
    String? buildingId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUpAdmin,
          [
            name,
            email,
            password,
            buildingId,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool> isSignedIn() => (super.noSuchMethod(
        Invocation.method(
          #isSignedIn,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool> changePassword(
    String? oldPassword,
    String? newPassword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [
            oldPassword,
            newPassword,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
