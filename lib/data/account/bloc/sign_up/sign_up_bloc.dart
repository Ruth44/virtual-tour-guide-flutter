import 'dart:async';

import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AccountRepository accountRepository;

  SignUpBloc({required this.accountRepository}) : super(InitialSignUpState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    try {
      yield SigningUpState();
      await accountRepository.signUpAdmin(
          event.name, event.email, event.password, event.buildingId);
      yield SignedUpState();
    } catch (e) {
      print(e);
      yield const ErrorSignUpState("some signup error happened");
    }
  }
}
