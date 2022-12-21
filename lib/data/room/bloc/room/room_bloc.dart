import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
import 'package:ar_indoor_nav_admin/data/room/repository/room_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepository roomRepository;

  RoomBloc({required this.roomRepository}) : super(RoomInitialState());

  @override
  Stream<RoomState> mapEventToState(
    RoomEvent event,
  ) async* {
    if (event is GetRoomDetailEvent) {
      try {
        yield RoomDetailLoading();
        final Room room = await roomRepository.getRoomDetails(event.id);
        yield RoomDetailLoaded(room: room);
      } catch (e) {
        print(e);
        yield ErrorRoomDetail(
            message: "error while getting room details for ${event.id}");
      }
    } else if (event is UpdateRoomDetailEvent) {
      try {
        yield RoomDetailLoading();
        final Room room = await roomRepository.updateRoom(
          roomId: event.roomId,
          roomName: event.roomName,
          roomCategory: event.roomCategory,
          isOccupied: event.isOccupied,
        );
        print("room## " + room.toString());
        yield RoomDetailLoaded(room: room);
      } catch (e) {
        print(e);
        yield ErrorRoomDetail(
            message: "error while updating room details for ${event.roomId}");
      }
    }
  }
}


// GetRoomsEvent
// GetRoomDetailEvent
// UpdateRoomDetailEvent
// UnoccupyRoomEvent
// OccupyRoomEvent


// RoomInitialState
// RoomDetailLoading
// RoomDetailLoaded
// ErrorRoomDetail