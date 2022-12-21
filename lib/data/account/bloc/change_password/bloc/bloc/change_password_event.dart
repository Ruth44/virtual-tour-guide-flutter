part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

@immutable
class ChangePasswordSubmitEvent extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordSubmitEvent(
      {required this.oldPassword, required this.newPassword});

  @override
  List<Object> get props => [oldPassword, newPassword];
}
