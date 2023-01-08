import 'dart:io';

import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/users/model/user.dart';
import 'package:virtual_tour_guide_manager/data/users/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final AccountRepository accountRepository;

  UserBloc({required this.userRepository, required this.accountRepository}) : super(InitialUserState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUsers) {
      try {
        yield UserLoadingState();
        final List<User> usersResult =
            await userRepository.getAllUsers();
        yield AllUserLoadedState(usersResult);
      } catch (e) {
        print(e);
        yield const ErrorUserState("error while getting all users");
      }
    }else  if (event is GetUserDetailEvent) {
      try {
        yield UserDetailLoading();
        final User user = await userRepository.getUserDetails(event.id);
        yield UserDetailLoaded(user: user);
      } catch (e) {
        print(e);
        yield ErrorUserDetail(
            message: "error while getting user details for ${event.id}");
      }
    } else if (event is UpdateUserDetailEvent) {
      try {
        yield UserDetailLoading();
        final User user = await userRepository.updateUser(
          userId: event.userId,
          userName: event.userName,
          email: event.email,
        );
        print("user## " + user.toString());
        yield UserDetailLoaded(user: user);
      } catch (e) {
        print(e);
        yield ErrorUserDetail(
            message: "error while updating user details for ${event.userId}");
      }
    }else if (event is UserDelete) {
      try {
       
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await userRepository.deleteUser(
            event.user.id, token!);
    
        yield UserDetailLoaded(user: event.user);
      } on SocketException catch (e) {
        yield const UsersOperationError(message: "Connection issues");
      } on Exception catch (e) {
        // yield const UsersOperationError(
        //     message: "User selected being used");
        yield UsersOperationError(
            message: "${e.toString().substring(11)}");
        // yield const UsersOperationError(
        //     message: "failed to delete user!");
      } 
    }else if (event is UserCreate) {
      try {
        yield UserDetailLoading();
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await userRepository.createUser(
            event.user, event.bldgId,event.password, token!);
        final usersList =
            await userRepository.getAllUsers();
        yield UserDetailLoaded(user: event.user);
      } catch (_) {
        yield const UsersOperationError(
            message: "failed to create user!");
      }
    }
  }
  }

