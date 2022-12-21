import 'dart:convert';

import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';

class Room {
  Room({
    required this.id,
    required this.roomName,
    required this.roomNumber,
    required this.floorNumber,
    required this.isEmpty,
    required this.category,
    required this.bldgId,
    required this.createdAt,
  });

  final String id;
  final String roomName;
  final String roomNumber;
  final String floorNumber;
  final bool isEmpty;
  final Category category;
  final String bldgId;
  final DateTime createdAt;

  // Room copyWith({
  //   required String id,
  //   required String roomName,
  //   required String roomNumber,
  //   required String floorNumber,
  //   required bool isEmpty,
  //   required Category category,
  //   required String bldgId,
  //   required DateTime createdAt,
  // }) =>
  //     Room(
  //       id: id,
  //       roomName: roomName,
  //       roomNumber: roomNumber,
  //       floorNumber: floorNumber,
  //       isEmpty: isEmpty,
  //       category: category,
  //       bldgId: bldgId,
  //       createdAt: createdAt,
  //     );

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        id: json["_id"],
        roomName: json["roomName"],
        roomNumber: json["roomNumber"],
        floorNumber: json["floorNumber"],
        isEmpty: json["isEmpty"],
        category: Category.fromJson(json["category"]),
        bldgId: json["bldgId"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "roomName": roomName,
        "roomNumber": roomNumber,
        "floorNumber": floorNumber,
        "isEmpty": isEmpty,
        "category": category.toJson(),
        "bldgId": bldgId,
        "createdAt": createdAt.toIso8601String(),
      };
}
