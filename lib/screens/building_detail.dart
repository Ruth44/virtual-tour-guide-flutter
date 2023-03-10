import 'dart:developer';

import 'package:virtual_tour_guide_manager/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:virtual_tour_guide_manager/data/bldg_detail/model/bldg_detail.dart';
import 'package:virtual_tour_guide_manager/data/building/bloc/bldg_bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/bloc/room/room_bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';
import 'package:virtual_tour_guide_manager/screens/category_list.dart';
import 'package:virtual_tour_guide_manager/screens/destination_add.dart';
import 'package:virtual_tour_guide_manager/screens/room_edit.dart';
import 'package:virtual_tour_guide_manager/util/category_argument.dart';
import 'package:virtual_tour_guide_manager/util/room_edit_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_tour_guide_manager/util/user_argument.dart';

class BuildingDetail extends StatelessWidget {
  static const routeName = "/buildingDetail";
  String bldgId;
  BuildingDetail({Key? key, required this.bldgId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<BldgBloc>(context).add(const GetBuildings());
        return true;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xFF1A1820),
        // ),
        backgroundColor: const Color(0xFF1A1820),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<BldgDetailBloc>(context).add(
                GetBuildingDetails(id: bldgId),
              );
            },
            child: Stack(
              children: [
                ListView(),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 80),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            key: Key('manageCategoriesButton'),
                            onPressed: () {
                              BlocProvider.of<CategoriesBloc>(context)
                                  .add(CategoriesLoad(
                                bldgId: bldgId,
                              ));
                              Navigator.of(context).pushNamed(
                                CategoriesList.routeName,
                                arguments: CategoryArgument(bldgId: bldgId),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Text(
                                'Manage Categories',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            // textColor: Colors.white,
                            style: TextButton.styleFrom(
                              primary: const Color(0xFFF9C35C),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xFFF9C35C),
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            key: Key('addRoomButton'),
                            onPressed: () {
                              // BlocProvider.of<CategoriesBloc>(context)
                              //     .add(CategoriesLoad(
                              //   bldgId: bldgId,
                              // ));
                              Navigator.of(context).pushNamed(
                                AddDestination.routeName,
                                arguments: UserArgument(bldgId: bldgId),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Text(
                                'Add Destination',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            // textColor: Colors.white,
                            style: TextButton.styleFrom(
                              primary: const Color(0xFFF9C35C),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xFFF9C35C),
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          'Rooms',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BlocBuilder<BldgDetailBloc, BldgDetailState>(
                        builder: (context, state) {
                          if (state is BldgDetailsLoadedState) {
                            log(state.fetchedBldgDetails.name);
                            final BldgDetail allBldgDetails =
                                state.fetchedBldgDetails;
                            final List<Room> rooms = allBldgDetails.rooms;
                            // return Text("found # ${rooms.length} amount of rooms");
                            return Flexible(
                              child: ListView.builder(
                                  key: const Key("roomListView"),
                                  itemCount: rooms.length,
                                  itemBuilder: (context, index) {
                                    final currRoom = rooms[index];
                                    return RoomRow(
                                      key: Key('Room$index'),
                                      room: currRoom,
                                      isOccupied: !currRoom.isEmpty,
                                    );
                                  }),
                            );
                          } else if (state is ErrorBldgDetailState) {
                            // log(state.message);
                            return const Text(
                              "error loading details. Swipe to refresh.",
                              style: TextStyle(color: Colors.white),
                            );
                          } else if (state is BldgDetailLoadingState) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          // InitialBldgState
                          return const Text("HI",
                              style: TextStyle(color: Colors.white));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoomRow extends StatefulWidget {
  final Room room;
  bool isOccupied;
  RoomRow({
    Key? key,
    required this.room,
    required this.isOccupied,
  }) : super(key: key);

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  // bool isOccupied = true;
  // bool isOccupied = isOccupied;

  @override
  Widget build(BuildContext context) {
    print(widget.room);
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: Text(
          " ${widget.room.roomName}",
          style: const TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          "#${widget.room.roomNumber}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
           Container(
            height: 25,
            padding: const EdgeInsets.only(bottom: 9),
             child: IconButton(
              
              iconSize: 16,
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                
              ),
              onPressed: () {
                context.read<RoomBloc>().add(RoomDelete(widget.room));
              }),
           ),
            Container(
              height: 30,
              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  
                  primary: widget.isOccupied
                      ? const Color(0x408A77FF)
                      : const Color(0x40F9C35C),
                ),
                child: Text(
                  widget.isOccupied ? "occupied" : "unoccupied",
                  style: TextStyle(
                      color: widget.isOccupied
                          ? const Color(0xFFB4ADFF)
                          : const Color(0xFFF9C35C)),
                ),
                onPressed: () {
                  setState(() {
                    //TODO: implement or make ElevatedButton Text widget
                  });
                },
              ),
            ),
          ],
        ),
        onLongPress: () {},
        onTap: () async {
          BlocProvider.of<CategoriesBloc>(context).add(CategoriesLoad(
            bldgId: widget.room.building,
          ));
          final updatedRoom = await Navigator.of(context).pushNamed(
            RoomEdit.routeName,
            arguments: RoomEditArgument(room: widget.room),
          );

          if (updatedRoom.runtimeType == Room) {
            setState(() {
              widget.isOccupied = !(updatedRoom as Room).isEmpty;
            });
          }
          // print("runtime type " + updatedRoom.runtimeType.toString());
        },
      ),
    );
  }
}
