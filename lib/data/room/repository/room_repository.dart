import 'package:ar_indoor_nav_admin/data/room/data_provider/room_data_provider.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';

class RoomRepository {
  final RoomDataProvider dataProvider;

  RoomRepository({required this.dataProvider});

  Future<Room> getRoomDetails(String roomId) async {
    return await dataProvider.getRoomDetails(roomId);
  }

  Future<Room> updateRoom(
      {required String roomId,
      required String roomName,
      required String roomCategory,
      required bool isOccupied}) async {
    return await dataProvider.updateRoom(
      roomId: roomId,
      updatedRoomName: roomName,
      updatedCategoryName: roomCategory,
      isOccupied: isOccupied,
    );
  }
}
