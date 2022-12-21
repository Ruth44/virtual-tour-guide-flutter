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
