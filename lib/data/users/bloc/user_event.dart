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

class UserCreate extends UserEvent {
  final String bldgId;
    final String password;
  final User user;

  const UserCreate(this.user, this.bldgId, this.password);

  @override
  List<Object> get props => [user, bldgId, password];

  @override
  String toString() =>
      'Category Created {user: $user}, bldgId: $bldgId';
}
class UserDelete extends UserEvent {
  final User user;

  const UserDelete(this.user);

  @override
  List<Object> get props => [user];

  @override
  toString() => 'User Deleted {user: $user}';
}
