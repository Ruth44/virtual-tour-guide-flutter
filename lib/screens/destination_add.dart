import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/models/categories.dart';
import 'package:virtual_tour_guide_manager/data/room/bloc/room/room_bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';

class AddDestination extends StatefulWidget {
  static const routeName = '/destinationAdd';
  final String bldgId;

  const AddDestination({Key? key, required this.bldgId}) : super(key: key);
  @override
  _AddDestinationState createState() => _AddDestinationState();
}

class _AddDestinationState extends State<AddDestination> {
  final _formKey = GlobalKey<FormState>();
  late String _roomCategory = 'xx';
  late List<String?> _categoryOptions;
  final Map<String, dynamic> _destinationPayload = {};
  @override
  void initState() {
    super.initState();

    // _roomCategory = widget.room.category;

    _categoryOptions = [_roomCategory];
  }

  @override
  Widget build(BuildContext context) {
    print(widget.bldgId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1820),
      ),
      backgroundColor: const Color(0xFF1A1820),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF1A1820),
      //   title: const Text(''),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Add Destination",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 36),
                Container(
                  // height: 260,
                  color: const Color(0x1AC4C4C4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(children: [
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Enter destination Info",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
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
                                    "Destination Name",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('destinationNameField'),
                                    initialValue: '',
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Destination name is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["roomName"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),

                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "X Position",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('destinationXField'),
                                    initialValue: '',
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'X Position is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["x"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Y Position",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('destinationYField'),
                                    initialValue: '',
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Y Position is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["y"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Z Position",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('destinationZField'),
                                    keyboardType: TextInputType.number,
                                    initialValue: '',
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Z Position is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["z"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),

                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Destination Number",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('destinationNumberField'),
                                    initialValue: '',
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Destination number is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["roomNumber"] =
                                            value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Floor Number",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('floorNumberField'),
                                    initialValue: '',
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Floor number is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["floorNumber"] =
                                            value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Is Empty",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('isEmptyField'),
                                    initialValue: '',
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Empty is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Destination name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _destinationPayload["isEmpty"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),

//hjb

                              BlocBuilder<CategoriesBloc, CategoriesState>(
                                builder: (context, state) {
                                  print('before');
                                  if (state is CategoriesLoadSuccess) {
                                    final _categories = state.categories;

                                    _categoryOptions = _categories
                                        .map((item) => item.name)
                                        .toList();
                                    print('object vvv');
                                    print(_categoryOptions);
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
                                          canvasColor: const Color(0xFF1A1820),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                                alignedDropdown: true,
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  // value: _roomCategory,
                                                  iconSize: 30,
                                                  icon: (null),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                  // hint: Text('Select category'),
                                                  hint:
                                                      Text('Choose a category'),
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
                                                        style: const TextStyle(
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
                                  }
                                  // print("category state ${state}");
                                  return Container(
                                    // width: 300,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: BoxDecoration(
                                        color: const Color(0x1AC4C4C4),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: const Color(0xFF1A1820),
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
                                                hint: Text('## $_roomCategory'),
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
                                                      style: const TextStyle(
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
                              // ]),

//jkn
                            ]),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          key: const Key('addDestinationSubmitButton'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFF9C35C),
                            // fixedSize: Size(243, 41),
                            fixedSize: const Size(200, 34),
                          ),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              log(_destinationPayload["x"]);
                              log(_destinationPayload["y"]);
                              log(_destinationPayload["z"]);
                              bool x;
                              if (_destinationPayload["isEmpty"] == 'true') {
                                x = true;
                              } else {
                                x = false;
                              }
                              log((widget.bldgId));
                              final RoomEvent event = RoomCreate(
                                  // 'New Room',
                                  // '200',
                                  // '2',

                                  _destinationPayload["roomName"],
                                 double.parse(_destinationPayload["x"]),
                                    double.parse(_destinationPayload["y"]),
                                  double.parse( _destinationPayload["z"]),
                                  _destinationPayload["roomNumber"],
                                  _destinationPayload["floorNumber"],
                                  x,
                                  // _destinationPayload["isEmpty"],
                                  _roomCategory,
                                  // 'bldg1'
                                  widget.bldgId);
                              BlocProvider.of<RoomBloc>(context).add(event);
                              // roomName
                              // roomName: _destinationPayload["roomName"],
                              // 'roomNumber': _destinationPayload["roomNumber"],
                              // 'isEmpty': _destinationPayload["isEmpty"],
                              // 'floorNumber':
                              //     _destinationPayload["floorNumber"],
                              // 'category': '66',
                              // 'building': widget.bldgId
                              // );
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     CategoriesList.routeName, (route) => false);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Add Destination",
                            style: TextStyle(
                              color: Color(0xFF1A1820),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ]),
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
