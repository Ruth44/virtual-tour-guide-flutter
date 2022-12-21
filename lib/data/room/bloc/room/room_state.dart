part of 'room_bloc.dart';

@immutable
abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitialState extends RoomState {}

class RoomDetailLoading extends RoomState {}

class RoomDetailLoaded extends RoomState {
  final Room room;

  const RoomDetailLoaded({required this.room});
}

class ErrorRoomDetail extends RoomState {
  final String? message;
  const ErrorRoomDetail({required this.message});
}
