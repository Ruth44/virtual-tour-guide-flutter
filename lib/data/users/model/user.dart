import 'package:equatable/equatable.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final Building = BuildingFromMap(jsonString);

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.mainManager,
  });

  final String id;
  final String name;
  final String email;
  final bool mainManager;

  User copyWith({
    String? id,
    required String name,
    required String email,
    required bool mainManager,
  }) =>
      User(
        id: id ?? this.id,
        name: name,
        email: email,
        mainManager: mainManager,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mainManager: json["mainManager"] ,
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "mainManager": mainManager,
      };

  @override
  List<Object?> get props => [id, name, email, mainManager];
}


// https://app.quicktype.io/