part of 'authentication_bloc.dart';
// enum AuthenticationState { authenticated, unauthenticated, unknown }

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UnknownState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class UnAuthenticatedState extends AuthenticationState {}

class ErrorAuthenticatedState extends AuthenticationState {
  final String message;

  const ErrorAuthenticatedState(this.message);
}
