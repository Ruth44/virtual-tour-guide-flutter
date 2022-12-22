import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';

class CategoriesDataProvider {
  // final _baseUrl = "https://ar-indoor-navigation.herokuapp.com";
    final _baseUrl = 'http://localhost:8080';

  final http.Client httpClient;

  CategoriesDataProvider({required this.httpClient});

  Future<Category> createCategory(
      Category category, String bldgId, String token) async {
    final response = await httpClient.post(
      // Uri.parse('$_baseUrl/categories'),
      Uri.parse('$_baseUrl/buildings/$bldgId/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(<String, dynamic>{
        'name': category.name,
      }),
    );

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw Exception('Failed to create category.');
    }
  }

  Future<List<Category>> getCategories({required String bldgId}) async {
    // final response = await httpClient.get(Uri.parse('$_baseUrl/categories'));
    final response = await httpClient
        .get(Uri.parse('$_baseUrl/buildings/$bldgId/categories'));

    if (response.statusCode == 200) {
      final categoriesList = jsonDecode(response.body) as List;
      return categoriesList
          .map((currCategory) => Category.fromJson(currCategory))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> deleteCategory(String id, String bldgId, String token) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/buildings/$bldgId/categories/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      if (response.statusCode == 409 || response.statusCode == 403) {
        // throw Exception('Category selected being used');
        throw Exception('${jsonDecode(response.body)["message"].toString()}');
      } else {
        throw Exception('Failed to delete category.');
      }
    }
  }

  Future<void> updateCategory(Category category, String token) async {
    final http.Response response = await httpClient.put(
      Uri.parse('$_baseUrl/categories/${category.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(<String, dynamic>{
        'id': category.id,
        'name': category.name,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update category.');
    }
  }
}
