// To parse this JSON data, do
//
//     final bldgDetail = bldgDetailFromMap(jsonString);

import 'package:ar_indoor_nav_admin/data/room/models/room.dart';

class BldgDetail {
  BldgDetail({
    required this.id,
    required this.name,
    required this.rooms,
  });

  final String id;
  final String name;
  final List<Room> rooms;

  BldgDetail copyWith({
    required String id,
    required String name,
    required List<Room> rooms,
  }) =>
      BldgDetail(
        id: id,
        name: name,
        rooms: rooms,
      );

  factory BldgDetail.fromMap(Map<String, dynamic> json) => BldgDetail(
        id: json["_id"],
        name: json["name"],
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "rooms": List<dynamic>.from(rooms.map((x) => x.toMap())),
      };
}
