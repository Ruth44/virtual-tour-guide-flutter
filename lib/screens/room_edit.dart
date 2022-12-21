import 'package:ar_indoor_nav_admin/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/room/bloc/room/room_bloc.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
import 'package:ar_indoor_nav_admin/util/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomEdit extends StatefulWidget {
  static const routeName = '/roomEdit';
  Room room;
  RoomEdit({Key? key, required this.room}) : super(key: key);

  @override
  State<RoomEdit> createState() => _RoomEditState();
}

class _RoomEditState extends State<RoomEdit> {
  late bool _isOccupied;
  late String _roomNumber;
  late String _roomName;
  late String _roomCategory;
  late String _bldgId;
  late List<String?> _categoryOptions;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _roomNumber = widget.room.roomNumber;
    _roomName = widget.room.roomName;
    _roomCategory = widget.room.category.name;
    _isOccupied = !widget.room.isEmpty;
    _bldgId = widget.room.bldgId;
    _categoryOptions = [_roomCategory];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1A1820),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: BlocListener<RoomBloc, RoomState>(
              listener: (context, state) {
                print("checking listener state " + state.toString());
                if (state is RoomDetailLoaded) {
                  print("state is RoomDetailloaded " + state.toString());

                  BlocProvider.of<BldgDetailBloc>(context)
                      .add(GetBuildingDetails(id: _bldgId));
                  Navigator.pop(context, state.room);
                } else if (state is ErrorRoomDetail) {
                  print("error state " + state.message.toString());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    "Room #$_roomNumber",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isOccupied = !_isOccupied;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Text(
                          _isOccupied
                              ? 'Make room unoccupied'
                              : "Make room occupied",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      // textColor: Colors.white,
                      style: TextButton.styleFrom(
                        primary: _isOccupied
                            ? const Color(0xFFD84B4B)
                            : const Color(0xFFF9C35C),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _isOccupied
                                    ? const Color(0xFFD84B4B)
                                    : const Color(0xFFF9C35C),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // height: 360,
                      color: const Color(0x1AC4C4C4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Column(children: [
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                // "Room #1223",
                                "Room #${_roomNumber}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _isOccupied
                                      ? const Color(0x408A77FF)
                                      : const Color(0x40F9C35C),
                                ),
                                child: Text(
                                  _isOccupied ? "occupied" : "unoccupied",
                                  style: TextStyle(
                                      color: _isOccupied
                                          ? const Color(0xFFB4ADFF)
                                          : const Color(0xFFF9C35C)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isOccupied = !_isOccupied;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Form(
                            key: _formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Room Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            ?.copyWith(
                                              // fontSize: screenHeight * 0.021,
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: 'Poppins Medium',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: const Color(0x1AC4C4C4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextFormField(
                                      key: const Key("roomNameField"),
                                      initialValue: '$_roomName',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      enabled: _isOccupied ? true : false,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        _roomName = value;
                                        print("new roomName " + _roomName);
                                      },
                                      validator: (value) =>
                                          Validators.validateName(value)
                                              ?.toString(),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Room Category",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  BlocBuilder<CategoriesBloc, CategoriesState>(
                                    builder: (context, state) {
                                      if (state is CategoriesLoadSuccess) {
                                        final _categories = state.categories;
                                        _categoryOptions = _categories
                                            .map((item) => item.name)
                                            .toList();
                                        print(
                                            "state success len ${state.categories.length} categories ${state.categories} ");
                                        print("room $_roomCategory");
                                        return Container(
                                          // width: 300,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                              color: const Color(0x1AC4C4C4),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              canvasColor:
                                                  const Color(0xFF1A1820),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                                child: ButtonTheme(
                                                    alignedDropdown: true,
                                                    child:
                                                        DropdownButton<String>(
                                                      isExpanded: true,
                                                      value: _roomCategory,
                                                      iconSize: 30,
                                                      icon: (null),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                      // hint: Text('Select category'),
                                                      hint: Text(
                                                          '## $_roomCategory'),
                                                      onChanged: (String? val) {
                                                        setState(() {
                                                          _roomCategory = val!;
                                                        });
                                                      },
                                                      items: _categoryOptions
                                                          .map((String? item) {
                                                        return DropdownMenuItem(
                                                          child: Text(
                                                            "$item",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          value:
                                                              item.toString(),
                                                        );
                                                      }).toList(),
                                                    ))),
                                          ),
                                        );
                                      }
                                      // print("category state ${state}");
                                      return Container(
                                        // width: 300,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        decoration: BoxDecoration(
                                            color: const Color(0x1AC4C4C4),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                            canvasColor:
                                                const Color(0xFF1A1820),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: DropdownButton<String>(
                                                    isExpanded: true,
                                                    value: _roomCategory,
                                                    iconSize: 30,
                                                    icon: (null),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                    hint: Text(
                                                        '## $_roomCategory'),
                                                    onChanged: (String? val) {
                                                      setState(() {
                                                        _roomCategory = val!;
                                                      });
                                                    },
                                                    items: _categoryOptions
                                                        .map((String? item) {
                                                      return DropdownMenuItem(
                                                        child: Text(
                                                          "$item",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        value: item.toString(),
                                                      );
                                                    }).toList(),
                                                  ))),
                                        ),
                                      );
                                    },
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              key: const Key("editRoomSaveButton"),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFF9C35C),
                                // fixedSize: Size(243, 41),
                                fixedSize: const Size(200, 34),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  // print("save changes clicked and valid ");
                                  BlocProvider.of<RoomBloc>(context).add(
                                    UpdateRoomDetailEvent(
                                      roomId: widget.room.id,
                                      roomName: _roomName,
                                      roomCategory: _roomCategory,
                                      isOccupied: _isOccupied,
                                    ),
                                  );
                                }
                              },
                              child: BlocBuilder<RoomBloc, RoomState>(
                                builder: (context, state) {
                                  if (state is RoomDetailLoading) {
                                    return const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    );
                                  }
                                  return const Text(
                                    "Save Changes",
                                    style: TextStyle(
                                      color: Color(0xFF1A1820),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
