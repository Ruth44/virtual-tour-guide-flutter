import 'dart:math';

import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:ar_indoor_nav_admin/data/users/data_provider/user_data_provider.dart';
import 'package:ar_indoor_nav_admin/data/users/model/user.dart';

class UserRepository {
  final UserDataProvider userDataProvider;

  UserRepository({
    required this.userDataProvider,
  });

  Future<List<User>> getAllUsers() async {
    return await userDataProvider.getAllUsers();
  }
    Future<User> getUserDetails(String userId) async {
    return await userDataProvider.getUserDetails(userId);
  }
 Future<User> updateUser(
      {required String userId,
      required String userName,
      required String email,
   }) async {
    return await userDataProvider.updateUser(
      userId: userId,
      updatedUserName: userName,
      updatedEmail: email,
    );
  }
  // Future<UserDetail> getUserDetails(String userId) async {
  //   return await userDataProvider.getUserDetails(userId);
  // }
}
