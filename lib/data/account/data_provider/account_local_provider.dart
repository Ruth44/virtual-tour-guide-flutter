import 'package:ar_indoor_nav_admin/util/storage/secure_storage.dart';

class AccountLocalDataProvider {
  static const TOKEN_KEY = "JWT_TOKEN";
  // static const EMAIL_KEY = "EMAIL_KEY";

  final SecureStorage secureStorage;

  AccountLocalDataProvider({required this.secureStorage});

  Future<String?> readJWTToken() async => await secureStorage.read(TOKEN_KEY);

  Future<void> writeJWTToken(String value) async =>
      await secureStorage.write(TOKEN_KEY, value);

  Future<void> deleteJWTToken() async => await secureStorage.delete(TOKEN_KEY);

  Future<void> deleteAllKeys() async => await secureStorage.deleteAll();
}
