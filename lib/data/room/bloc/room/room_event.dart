part of 'room_bloc.dart';

@immutable
abstract class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

// class GetRoomsEvent extends RoomEvent {}

class GetRoomDetailEvent extends RoomEvent {
  final String id;

  const GetRoomDetailEvent({required this.id});
}

class UpdateRoomDetailEvent extends RoomEvent {
  // final Room payload;
  final String roomId;
  final String roomName;
  final String roomCategory;
  final bool isOccupied;

  const UpdateRoomDetailEvent({
    required this.roomId,
    required this.roomName,
    required this.roomCategory,
    required this.isOccupied,
  });
}

class RoomCreate extends RoomEvent {
  final String roomName;
  final double x;
  final double y;
  final double z;
  final String roomNumber;
  final String floorNumber;
  final bool isEmpty;
  final String category;
  final String building;

  const RoomCreate(this.roomName, this.x, this.y, this.z, this.roomNumber,
      this.floorNumber, this.isEmpty, this.category, this.building,
      {required});

  @override
  List<Object> get props =>
      [roomName, roomNumber, floorNumber, isEmpty, category, building];

  @override
  String toString() => 'Room Created ';
}
class RoomDelete extends RoomEvent {
  final Room room;

  const RoomDelete(this.room);

  @override
  List<Object> get props => [room];

  @override
  toString() => 'Room Deleted {room: $room}';
}
// Commented for now
// class UnoccupyRoomEvent extends RoomEvent {
//   final String roomId;

//   const UnoccupyRoomEvent({required this.roomId});
// }

// class OccupyRoomEvent extends RoomEvent {
//   final String roomId;
//   final String roomName;
//   final String categoryName;

//   const OccupyRoomEvent({
//     required this.roomId,
//     required this.roomName,
//     required this.categoryName,
//   });
// }
