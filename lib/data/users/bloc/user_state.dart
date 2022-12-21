part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

// class UserInitial extends UserState {}
class InitialUserState extends UserState {}

class UserLoadingState extends UserState {}

class AllUserLoadedState extends UserState {
  List<User> fetchedusers;
  AllUserLoadedState(this.fetchedusers);

  @override
  List<Object> get props => [fetchedusers];
}
class UserDetailLoading extends UserState {}

class UserDetailLoaded extends UserState {
  final User user;

  const UserDetailLoaded({required this.user});
}
class ErrorUserState extends UserState {
  final String message;
  const ErrorUserState(this.message);
}
class ErrorUserDetail extends UserState {
  final String? message;
  const ErrorUserDetail({required this.message});
}