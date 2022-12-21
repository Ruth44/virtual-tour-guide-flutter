import 'dart:async';
import 'dart:io';

import 'package:ar_indoor_nav_admin/data/account/repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AccountRepository accountRepository;

  LoginBloc({required this.accountRepository}) : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield LoggingInState();
      await accountRepository.login(event.email, event.password);
      yield LoggedInState();
    } on SocketException catch (e) {
      print(e);
      yield const ErrorLoggingInState("some error happened while logging");
    } catch (e) {
      print(e);
      yield const ErrorLoggingInState("incorrect email or password");
      // yield const ErrorLoggingInState("some error happened while logging");
    }
  }
}
