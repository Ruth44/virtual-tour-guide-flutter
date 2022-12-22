import 'package:virtual_tour_guide_manager/data/account/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart';
import 'package:virtual_tour_guide_manager/data/building/model/building.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateMocks([AccountRepository])
void main() {
  late MockAccountRepository mockAccountRepository;

  setUp(() {
    mockAccountRepository = MockAccountRepository();
    // e = Exception();
  });

  group('Login Bloc Test', () {
    blocTest(
      'emits [LoggingInState(), LoggedInState()] when successful: (Test login)',
      build: () {
        when(mockAccountRepository.login(any, any)).thenAnswer((_) async {
          return Future.delayed(const Duration(microseconds: 1));
        });

        return LoginBloc(accountRepository: mockAccountRepository);
      },
      act: (LoginBloc bloc) => bloc.add(
        const LoginEvent(
          email: 'emaildata',
          password: 'passworddata',
        ),
      ),
      expect: () => [LoggingInState(), LoggedInState()],
    );
    blocTest(
      'emits [LoggingInState(), ErrorLoggingInState()] when not successful: (Test login)',
      build: () {
        when(mockAccountRepository.login(any, any))
            .thenAnswer((_) async => throw Exception());

        return LoginBloc(accountRepository: mockAccountRepository);
      },
      act: (LoginBloc bloc) => bloc.add(
        const LoginEvent(
          email: 'emaildata',
          password: 'passworddata',
        ),
      ),
      // expect: () => [LoggingInState(), LoggedInState()],
      expect: () => [LoggingInState(), const ErrorLoggingInState('sf')],
    );
  });
}
