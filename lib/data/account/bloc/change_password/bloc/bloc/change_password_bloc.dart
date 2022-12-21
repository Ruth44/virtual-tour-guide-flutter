import 'package:ar_indoor_nav_admin/data/account/account.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AccountRepository accountRepository;

  ChangePasswordBloc({required this.accountRepository})
      : super(ChangePasswordInitialState());

  @override
  Stream<ChangePasswordState> mapEventToState(
    ChangePasswordEvent event,
  ) async* {
    if (event is ChangePasswordSubmitEvent) {
      try {
        yield ChangePasswordLoading();
        await (accountRepository.changePassword(
            event.oldPassword, event.newPassword));
        yield ChangePasswordSuccess();
      } on Exception catch (e) {
        yield ChangePasswordErrorState(message: "error: ${e.toString()}");
      } catch (e) {
        print(e);
        yield ChangePasswordErrorState(
            message: "error while changing password");
      }
    }
  }
}
