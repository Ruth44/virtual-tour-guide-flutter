import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// @immutable
class Category extends Equatable {
  const Category({
    this.id,
    required this.name,
  });

  final String? id;
  final String name;

  // @override
  // List<Object> get props => [id!, name];

  @override
  List<Object?> get props => [id, name];

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };

  @override
  String toString() => 'Categories { id: $id, name: $name }';
}
