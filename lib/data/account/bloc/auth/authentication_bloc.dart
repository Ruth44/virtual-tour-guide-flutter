import 'dart:async';
import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AccountRepository accountRepository;
  AuthenticationBloc({required this.accountRepository}) : super(UnknownState());
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    switch (event) {
      case AuthenticationEvent.getAuthState:
        {
          if (await isSignedIn) {
            yield AuthenticatedState();
          } else {
            yield UnAuthenticatedState();
          }
          break;
        }
      case AuthenticationEvent.authenticate:
        yield AuthenticatedState();
        break;
      case AuthenticationEvent.unAuthenticate:
        await accountRepository.signOut();
        yield UnAuthenticatedState();
        break;
    }
  }

  Future<bool> get isSignedIn async => await accountRepository.isSignedIn();
}
