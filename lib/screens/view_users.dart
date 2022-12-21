import 'package:ar_indoor_nav_admin/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:ar_indoor_nav_admin/data/building/bloc/bldg_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
import 'package:ar_indoor_nav_admin/data/users/bloc/user_bloc.dart';
import 'package:ar_indoor_nav_admin/data/users/model/user.dart';
import 'package:ar_indoor_nav_admin/screens/category_list.dart';
import 'package:ar_indoor_nav_admin/screens/room_edit.dart';
import 'package:ar_indoor_nav_admin/screens/user_edit.dart';
import 'package:ar_indoor_nav_admin/util/category_argument.dart';
import 'package:ar_indoor_nav_admin/util/room_edit_argument.dart';
import 'package:ar_indoor_nav_admin/util/user_edit_argument.dart';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            key: Key('manageCategoriesButton'),
                            onPressed: () {
                              // BlocProvider.of<CategoriesBloc>(context)
                              //     .add(CategoriesLoad(
                              //   bldgId: bldgId,
                              // ));
                              // Navigator.of(context).pushNamed(
                              //   CategoriesList.routeName,
                              //   arguments: CategoryArgument(bldgId: bldgId),
                              // );
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
          "Email: ${widget.room.email}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: widget.mainManager
                ? const Color(0x408A77FF)
                : const Color(0x40F9C35C),
          ),
          child: Text(
            widget.mainManager ? "Manager" : "Admin",
            style: TextStyle(
                color: widget.mainManager
                    ? const Color(0xFFB4ADFF)
                    : const Color(0xFFF9C35C)),
          ),
          onPressed: () {
            setState(() {
              //TODO: implement or make ElevatedButton Text widget
            });
          },
        ),
        onLongPress: () {},
        onTap: () async {
          // BlocProvider.of<CategoriesBloc>(context).add(CategoriesLoad(
          //   bldgId: widget.room.bldgId,
          // ));
          final updatedRoom = await Navigator.of(context).pushNamed(
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
