import 'dart:convert';
import 'package:ar_indoor_nav_admin/data/building/model/building.dart';
import 'package:ar_indoor_nav_admin/data/categories/data_provider/category_data.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
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
        'name': updatedRoomName,
        'isEmpty': !isOccupied,
        'category': updatedCategoryName,
      }),
    );
    if (response.statusCode == 200) {
      final roomResponse = jsonDecode(response.body)["data"];
      final roomResult = Room.fromMap(roomResponse);
      return roomResult;
    }
    throw Exception('Failed to update room.');
  }
}
