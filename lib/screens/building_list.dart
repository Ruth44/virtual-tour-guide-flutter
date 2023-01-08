import 'dart:developer';

import 'package:virtual_tour_guide_manager/data/account/account.dart';
import 'package:virtual_tour_guide_manager/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:virtual_tour_guide_manager/data/building/bloc/bldg_bloc.dart';
import 'package:virtual_tour_guide_manager/data/building/model/building.dart';
import 'package:virtual_tour_guide_manager/screens/add_admin.dart';
import 'package:virtual_tour_guide_manager/screens/building_detail.dart';
import 'package:virtual_tour_guide_manager/screens/category_list.dart';
import 'package:virtual_tour_guide_manager/screens/change_password.dart';
import 'package:virtual_tour_guide_manager/util/building_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingList extends StatefulWidget {
  static const routeName = "/buildingList";
  const BuildingList({Key? key}) : super(key: key);

  @override
  State<BuildingList> createState() => _BuildingListState();
}

class _BuildingListState extends State<BuildingList> {
  
  void _handleClick(String value) {
    switch (value) {
      case 'Change password':
        Navigator.of(context).pushNamed(
          ChangePassword.routeName,
        );
        break;
      // case 'Add Admin':
      //   Navigator.of(context).pushNamed(
      //     AddAdminPage.routeName,
      //   );

      //   break;
      case 'Logout':
        BlocProvider.of<AuthenticationBloc>(context)
            .add(AuthenticationEvent.unAuthenticate);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<BldgDetailBloc>(context)
    //     .add(GetBuildingDetails(id: '63a20a507254aaf43d718035'));

    // Navigator.of(context).pushNamed(
    //   BuildingDetail.routeName,
    //   arguments: BuildingArgument(bldgId: '63a20a507254aaf43d718035'),
    // );
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFFAADDEE),
        backgroundColor: const Color(0xFF1A1820),
        actions: <Widget>[
          PopupMenuButton<String>(
            // shape: RoundedRectangleBorder(
            //     side: const BorderSide(
            //         // color: Color(0xFFF9C35C),
            //         width: 1,
            //         style: BorderStyle.solid),
            //     borderRadius: BorderRadius.circular(5)),
            onSelected: _handleClick,
            itemBuilder: (BuildContext context) {
              return {'Change password', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF1A1820),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<BldgBloc>(context).add(
              const GetBuildings(),
            );
          },
          child: Stack(
            children: [
              ListView(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 72,
                    ),
                    const Text(
                      "Buildings",
                      key: Key("buildingListHeader"),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<BldgBloc, BldgState>(
                      builder: (context, state) {
                        if (state is BldgLoadingState) {
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
                        } else if (state is AllBldgLoadedState) {
                          final allFetchedBldgs = state.fetchedbldgs;
                          return Flexible(
                            child: ListView.builder(
                                key: const Key("bldgListView"),
                                itemCount: allFetchedBldgs.length,
                                itemBuilder: (context, index) {
                                  final currBldg = allFetchedBldgs[index];
                                  return BuildingRow(
                                    key: Key('Bldg$index'),
                                    building: currBldg,
                                  );
                                }),
                          );
                        } else if (state is ErrorBldgState) {
                          return Text(
                            "Errorrr happened ${state.message}",
                            style: const TextStyle(color: Colors.white),
                          );
                        } else if (state is InitialBldgState) {
                          BlocProvider.of<BldgBloc>(context)
                              .add(const GetBuildings());
                        }
                        // InitialBldgState
                        // BldgDetailsLoadedState
                        // BlocProvider.of<BldgBloc>(context).add(const GetBuildings());
                        return const Text("");
                      },
                    ),
                    BlocBuilder<BldgBloc, BldgState>(
                      builder: (context, state) {
                        if (state is ErrorBldgState) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFF9C35C),
                                fixedSize: const Size(243, 41),
                              ),
                              onPressed: () {
                                BlocProvider.of<BldgBloc>(context)
                                    .add(const GetBuildings());
                              },
                              child: const Text(
                                "Try again",
                                style: TextStyle(
                                  color: Color(0xFF1A1820),
                                ),
                              ),
                            ),
                          );
                        }
                        return const Text("");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildingRow extends StatefulWidget {
  final Building building;
  const BuildingRow({Key? key, required this.building}) : super(key: key);

  @override
  State<BuildingRow> createState() => _BuildingRowState();
}

class _BuildingRowState extends State<BuildingRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      // color: Colors.amber,
      color: const Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: Text(
          // "Building #1",
          "${widget.building.name}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          // "Location",
          "${widget.building.location}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_sharp,
          color: Colors.white,
        ),
        onLongPress: () {},
        onTap: () {
          BlocProvider.of<BldgDetailBloc>(context)
              .add(GetBuildingDetails(id: widget.building.id));

          Navigator.of(context).pushNamed(
            BuildingDetail.routeName,
            arguments: BuildingArgument(bldgId: widget.building.id),
          );
        },
      ),
      // child: Text("JIH"),
    );
  }
}
