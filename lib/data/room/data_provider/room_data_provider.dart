import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:virtual_tour_guide_manager/data/building/model/building.dart';
import 'package:virtual_tour_guide_manager/data/categories/data_provider/category_data.dart';
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';
import 'package:http/http.dart' as http;

class RoomDataProvider {
  // final _baseURL = "https://ar-indoor-navigation.herokuapp.com";
  final _baseURL = 'http://localhost:8080';

  final http.Client httpClient;

  RoomDataProvider({required this.httpClient});

  Future<List<Room>> getAllRooms() async {
    //TODO: implement
    throw Exception('Not implemented yet');
    // throw Exception('Failed to get list of rooms');
  }

  Future<Room> getRoomDetails(String roomId) async {
    final response = await httpClient.get(
      Uri.parse('$_baseURL/rooms/$roomId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final roomResponse = jsonDecode(response.body)["data"];
      final fetchedRoom = Room.fromMap(roomResponse);
      return fetchedRoom;
    }
    throw Exception('Failed to get detail of room $roomId');
  }

  Future<Room> createRoom(
      String roomName,
      num x,
      num y,
      num z,
      String roomNumber,
      String floorNumber,
      bool isEmpty,
      String category,
      String building,
      String token) async {
    final response = await httpClient.post(
      // Uri.parse('$_baseUrl/categories'),

      Uri.parse('$_baseURL/rooms'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(<String, dynamic>{
        'roomName': roomName,
        'roomNumber': roomNumber,
        'floorNumber': floorNumber,
        'isEmpty': isEmpty,
        'x': x,
        'y': y,
        'z': z,
        'category': category,
        'building': building
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Room.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw Exception('Failed to create destination.');
    }
  }
Future<void> deleteRoom(String id, String token) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseURL/rooms/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    log(response.body);
    if (response.statusCode != 200) {
      if (response.statusCode == 409 || response.statusCode == 403) {
        // throw Exception('User selected being used');
        throw Exception('${jsonDecode(response.body)["message"].toString()}');
      } else {
        throw Exception('Failed to delete Room.');
      }
    }
  }
  Future<Room> updateRoom({
    required String roomId,
    required String updatedRoomName,
    required String updatedCategoryName,
    required bool isOccupied,
  }) async {
    final response = await httpClient.put(
      Uri.parse('$_baseURL/rooms/$roomId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'roomName': updatedRoomName,
        'isEmpty': !isOccupied,
        'category': updatedCategoryName,
      }),
    );
    log(response.body.toString());
    if (response.statusCode == 200) {
      final roomResponse = jsonDecode(response.body)["data"];
      final roomResult = Room.fromMap(roomResponse);
      return roomResult;
    }
    throw Exception('Failed to update room.');
  }
}
