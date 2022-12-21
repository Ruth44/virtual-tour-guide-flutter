import 'package:ar_indoor_nav_admin/data/users/model/user.dart';
import 'package:ar_indoor_nav_admin/data/users/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(InitialUserState());

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
    }
  }
  }

