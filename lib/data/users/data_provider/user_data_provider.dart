import 'dart:convert';
import 'dart:developer';
import 'package:virtual_tour_guide_manager/data/users/model/user.dart';
import 'package:virtual_tour_guide_manager/data/users/model/user.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  // final _baseURL = "http://192.168.1.160:8080";
  // final _baseURL = 'http://web-production-197f.up.railway.app';
  final _baseURL = 'http://localhost:8080';

  final http.Client httpClient;

  UserDataProvider({required this.httpClient});

  Future<List<User>> getAllUsers() async {
    // const urlPath = "/users";
    final response = await httpClient.get(
      Uri.parse('$_baseURL/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final users = data as List;
      // return users.map((currBldg) => User.fromJson(currBldg)).toList();
      return users.map((currBldg) => User.fromMap(currBldg)).toList();
    }

    throw Exception('Failed to get list of users');
  }

  Future<User> getUserDetails(String userId) async {
    final response = await httpClient.get(
      Uri.parse('$_baseURL/users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final userResponse = jsonDecode(response.body)["data"];
      final fetchedUser = User.fromMap(userResponse);
      return fetchedUser;
    }
    throw Exception('Failed to get detail of user $userId');
  }

  Future<User> updateUser({
    required String userId,
    required String updatedUserName,
    required String updatedEmail,
  }) async {
    final response = await httpClient.put(
      Uri.parse('$_baseURL/users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': updatedUserName,
        'email': updatedEmail,
      }),
    );
    log(response.body);
    if (response.statusCode == 200) {
      final userResponse = jsonDecode(response.body)["data"];
      final userResult = User.fromMap(userResponse);
      return userResult;
    }
    throw Exception('Failed to update user.');
  }
  // Future<BldgDetail> getUserDetails(String usrId) async {
  //   final response = await httpClient.get(
  //     Uri.parse('$_baseURL/users/$usrId'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     return BldgDetail.fromMap(jsonDecode(response.body)["data"]);
  //   }

  //   throw Exception('Failed to get detail of user $usrId');
  // }
}
