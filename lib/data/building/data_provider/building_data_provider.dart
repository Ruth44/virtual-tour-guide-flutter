import 'dart:convert';
import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:ar_indoor_nav_admin/data/building/model/building.dart';
import 'package:http/http.dart' as http;

class BuildingDataProvider {
  // final _baseURL = "http://192.168.1.160:8080";
  // final _baseURL = 'http://web-production-197f.up.railway.app';
   final _baseURL = 'http://localhost:8080';

  final http.Client httpClient;

  BuildingDataProvider({required this.httpClient});

  Future<List<Building>> getAllBuildings() async {
    // const urlPath = "/buildings";
    final response = await httpClient.get(
      Uri.parse('$_baseURL/buildings'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final buildings = data as List;
      // return buildings.map((currBldg) => Building.fromJson(currBldg)).toList();
      return buildings.map((currBldg) => Building.fromMap(currBldg)).toList();
    }

    throw Exception('Failed to get list of buildings');
  }

  Future<BldgDetail> getBuildingDetails(String bldgId) async {
    final response = await httpClient.get(
      Uri.parse('$_baseURL/buildings/$bldgId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return BldgDetail.fromMap(jsonDecode(response.body)["data"]);
    }

    throw Exception('Failed to get detail of building $bldgId');
  }
}
