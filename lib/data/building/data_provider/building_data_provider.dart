import 'dart:convert';
import 'dart:developer';
import 'package:virtual_tour_guide_manager/data/bldg_detail/model/bldg_detail.dart';
import 'package:virtual_tour_guide_manager/data/building/model/building.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';

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
      // final c = jsonDecode(response.body)['data']['rooms'] as List;
      // print(c[0]['createdAt']);
      //     jsonDecode(response.body)['data']['rooms'][0]['category'] ;
      // log(c.toString());
      // Category f = Category(name: c["name"] as String, id: c["_id"] as String);
      // log(f.toString());
      // List<Room> rm = <Room>[];
      // Room g;
      // c.forEach((element) =>
      // Category(
                  // name: element['category']['name'] as String,
                  // id: element['category']['_id'] as String),);
          // print(element['createdAt'] as DateTime));

      //     rm.add(Room(
      //         roomName: element['roomName'] as String,
      //         roomNumber: element['roomNumber'] as String,
      //         floorNumber: element['floorNumber'] as String,
      //         building: element['building'] as String,
      //         category: Category(
      //             name: element['category']['name'] as String,
      //             id: element['category']['_id'] as String),
      //         x: element['x'] as num,
      //         y: element['y'] as num,
      //         z: element['z'] as num,
      //         id: element['_id'] as String,
      //         createdAt: element['createdAt'] as DateTime,
      //         isEmpty: element['isEmpty'] as bool)));

      // print(rm);
      // log(rm.length.toString());

      // log(Room.fromMap(jsonDecode(response.body)['data']['rooms'][0])
      //     .toString());
      return BldgDetail.fromMap(jsonDecode(response.body)["data"]);
    }

    throw Exception('Failed to get detail of building $bldgId');
  }
}
