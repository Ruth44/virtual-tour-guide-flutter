import 'dart:ffi';
import 'dart:io';

import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';
import 'package:virtual_tour_guide_manager/data/room/repository/room_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepository roomRepository;
  final AccountRepository accountRepository;

  RoomBloc({required this.roomRepository, required this.accountRepository})
      : super(RoomInitialState());

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
    } else if (event is RoomCreate) {
      try {
        yield RoomDetailLoading();
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await roomRepository.createRoom(
            event.roomName,
            event.x,
            event.y,
            event.z,
            event.roomNumber,
            event.floorNumber,
            event.isEmpty,
            event.category,
            event.building,
            token!);

        yield RoomCreateSuccess();
      } catch (_) {
        yield const ErrorRoomDetail(message: "failed to create room!");
      }
    } else if (event is RoomDelete) {
      try {
        String? token =
            await accountRepository.localDataProvider.readJWTToken();
        await roomRepository.deleteRoom(event.room.id, token!);

        yield RoomDetailLoaded(room: event.room);
      } on SocketException catch (e) {
        yield const ErrorRoomDetail(message: "Connection issues");
      } on Exception catch (e) {
        // yield const UsersOperationError(
        //     message: "User selected being used");
        yield ErrorRoomDetail(message: "${e.toString().substring(11)}");
        // yield const UsersOperationError(
        //     message: "failed to delete user!");
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