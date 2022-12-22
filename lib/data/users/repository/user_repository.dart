import 'dart:math';

import 'package:virtual_tour_guide_manager/data/bldg_detail/model/bldg_detail.dart';
import 'package:virtual_tour_guide_manager/data/users/data_provider/user_data_provider.dart';
import 'package:virtual_tour_guide_manager/data/users/model/user.dart';

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
