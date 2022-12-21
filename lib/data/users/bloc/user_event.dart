part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

@immutable
class GetUsers extends UserEvent {
  const GetUsers();

  @override
  List<Object> get props => [];
}
class GetUserDetailEvent extends UserEvent {
  final String id;

  const GetUserDetailEvent({required this.id});
}

class UpdateUserDetailEvent extends UserEvent {
  // final User payload;
  final String userId;
  final String userName;
  final String email;

  const UpdateUserDetailEvent({
    required this.userId,
    required this.userName,
    required this.email,
  });
}