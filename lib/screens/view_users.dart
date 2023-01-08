import 'package:virtual_tour_guide_manager/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:virtual_tour_guide_manager/data/bldg_detail/model/bldg_detail.dart';
import 'package:virtual_tour_guide_manager/data/building/bloc/bldg_bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';
import 'package:virtual_tour_guide_manager/data/users/bloc/user_bloc.dart';
import 'package:virtual_tour_guide_manager/data/users/model/user.dart';
import 'package:virtual_tour_guide_manager/screens/category_list.dart';
import 'package:virtual_tour_guide_manager/screens/room_edit.dart';
import 'package:virtual_tour_guide_manager/screens/user_edit.dart';
import 'package:virtual_tour_guide_manager/util/category_argument.dart';
import 'package:virtual_tour_guide_manager/util/room_edit_argument.dart';
import 'package:virtual_tour_guide_manager/util/user_edit_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewUsers extends StatelessWidget {
  static const routeName = "/viewUsers";
  String bldgId;
  ViewUsers({Key? key, required this.bldgId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<UserBloc>(context).add(const GetUsers());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A1820),
        ),
        backgroundColor: const Color(0xFF1A1820),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              // BlocProvider.of<BldgDetailBloc>(context).add(
              //   GetUserDetails(id: bldgId),
              // );
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

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          'Users',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is AllUserLoadedState) {
                            final List<User> allBldgDetails =
                                state.fetchedusers;
                            final List<User> users = allBldgDetails;
                            // return Text("found # ${users.length} amount of users");
                            return Flexible(
                              child: ListView.builder(
                                  key: const Key("userListView"),
                                  itemCount: users.length,
                                  itemBuilder: (context, index) {
                                    final currUser = users[index];
                                    return RoomRow(
                                      key: Key('Room$index'),
                                      room: currUser,
                                      mainManager: !currUser.mainManager,
                                    );
                                  }),
                            );
                          } else if (state is ErrorUserState) {
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
                                  // width: 30,
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
  final User room;
  bool mainManager;
  RoomRow({
    Key? key,
    required this.room,
    required this.mainManager,
  }) : super(key: key);

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  // bool mainManager = true;
  // bool mainManager = mainManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(vertical: 14),
      color: const Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: Text(
          "Name ${widget.room.name}",
          style: const TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          "Emaill: ${widget.room.email}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        trailing: IconButton(
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<UserBloc>().add(UserDelete(widget.room));
            }),
        // trailing: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     primary: widget.mainManager
        //         ? const Color(0x408A77FF)
        //         : const Color(0x40F9C35C),
        //   ),
        //   child: Text(
        //     widget.mainManager ? "Manager" : "Admin",
        //     style: TextStyle(
        //         color: widget.mainManager
        //             ? const Color(0xFFB4ADFF)
        //             : const Color(0xFFF9C35C)),
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       //TODO: implement or make ElevatedButton Text widget
        //     });
        //   },
        // ),
        onLongPress: () {},
        onTap: () async {
          // BlocProvider.of<CategoriesBloc>(context).add(CategoriesLoad(
          //   bldgId: widget.room.bldgId,
          // ));
          await Navigator.of(context).pushNamed(
            UserEdit.routeName,
            arguments: UserEditArgument(user: widget.room),
          );

          // if (updatedRoom.runtimeType == User) {
          //   setState(() {
          //     widget.mainManager = !(updatedRoom as Room).isEmpty;
          //   });
          // }
          // print("runtime type " + updatedRoom.runtimeType.toString());
        },
      ),
    );
  }
}
