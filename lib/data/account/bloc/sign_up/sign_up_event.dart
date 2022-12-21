part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  final String name;
  final String email;
  final String password;
  final String buildingId;

  const SignUpEvent(
      {required this.name, required this.email, required this.password, required this.buildingId});

  @override
  List<Object> get props => [name, email, password, buildingId];
}
