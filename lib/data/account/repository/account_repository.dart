import 'package:ar_indoor_nav_admin/data/account/data_provider/account_local_provider.dart';
import 'package:ar_indoor_nav_admin/data/account/data_provider/account_remote_provider.dart';

class AccountRepository {
  final AccountRemoteDataProvider remoteDataProvider;
  final AccountLocalDataProvider localDataProvider;

  AccountRepository({
    required this.remoteDataProvider,
    required this.localDataProvider,
  });

  Future<void> signUpAdmin(String name, String email, String password, String buildingId) async {
    String? token = await localDataProvider.readJWTToken();
    await remoteDataProvider.signUpAdmin(
        name: name, email: email, password: password, buildingId: buildingId, token: token!);

    // return _saveToken(token); // since only registering new admin not signing in with the account
  }

  Future<void> login(String email, String password) async {
    String token = await remoteDataProvider.login(email, password);
    return _saveToken(token);
  }

  Future<void> _saveToken(String token) {
    return localDataProvider.writeJWTToken(token);
  }

  Future<bool> isSignedIn() async =>
      (await localDataProvider.readJWTToken()) != null;

  Future<void> signOut() async {
    await localDataProvider.deleteJWTToken();
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    String? token = await localDataProvider.readJWTToken();
    return remoteDataProvider.changePassword(oldPassword, newPassword, token!);
  }
}
