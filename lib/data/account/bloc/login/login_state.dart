part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {}

class LoggingInState extends LoginState {}

class LoggedInState extends LoginState {}

class ErrorLoggingInState extends LoginState {
  final String message;

  const ErrorLoggingInState(this.message);
}
