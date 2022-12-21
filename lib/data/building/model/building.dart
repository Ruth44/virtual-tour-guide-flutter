import 'package:equatable/equatable.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final Building = BuildingFromMap(jsonString);

class Building extends Equatable {
  const Building({
    required this.id,
    required this.name,
    required this.create,
    required this.location,
  });

  final String id;
  final String name;
  final DateTime create;
  final String location;

  Building copyWith({
    String? id,
    required String name,
    required DateTime create,
    required String location,
  }) =>
      Building(
        id: id ?? this.id,
        name: name,
        create: create,
        location: location,
      );

  factory Building.fromJson(String str) => Building.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Building.fromMap(Map<String, dynamic> json) => Building(
        id: json["_id"],
        name: json["name"],
        create: DateTime.parse(json["createdAt"]),
        location: json["location"] ?? "Addis Ababa",
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "create": create.toIso8601String(),
        "location": location,
      };

  @override
  List<Object?> get props => [id, name, location, create];
}


// https://app.quicktype.io/