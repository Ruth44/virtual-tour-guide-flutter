import 'dart:convert';
// import 'dart:ffi';

// import 'package:json_annotation/json_annotation.dart';
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';
// part 'room.g.dart';

// @JsonSerializable()
class Room {
  Room(
      {required this.id,
      required this.roomName,
      required this.roomNumber,
      required this.floorNumber,
      required this.isEmpty,
      required this.category,
      required this.building,
      required this.createdAt,
      required this.x,
      required this.y,
      required this.z});

  final String id;
  final String roomName;
  final String roomNumber;
  final String floorNumber;
  final bool isEmpty;
  final Category category;
  final String building;
  final DateTime createdAt;
  final num x;
  final num y;
  final num z;

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
        x: json["x"],
        y: json["y"],
        z: json["z"],
        isEmpty: json["isEmpty"],
        category: Category.fromJson(json["category"]),
        building: json["building"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "roomName": roomName,
        "roomNumber": roomNumber,
        "x": x,
        "y": y,
        "z": z,
        "floorNumber": floorNumber,
        "isEmpty": isEmpty,
        "category": category.toJson(),
        "building": building,
        "createdAt": createdAt.toIso8601String(),
      };

  // factory Room.fromMap(Map<String, dynamic> json) => _$RoomFromJson(json);
  // factory Room.fromMap(Map<String, dynamic> json) => Room(
  //       id: json["_id"],
  //       roomName: json["roomName"],
  //       roomNumber: json["roomNumber"],
  //       floorNumber: json["floorNumber"],
  //       isEmpty: json["isEmpty"],
  //       category: json["category"],
  //       building: json["building"],
  //       createdAt: DateTime.parse(json["createdAt"]),
  //     );
  // Map<String, dynamic> toMap() => _$RoomToJson(this);
  // Map<String, dynamic> toMap() => {
  //       "_id": id,
  //       "roomName": roomName,
  //       "roomNumber": roomNumber,
  //       "floorNumber": floorNumber,
  //       "isEmpty": isEmpty,
  //       "category": category,
  //       "building": building,
  //       "createdAt": createdAt.toIso8601String(),
  //     };
}
