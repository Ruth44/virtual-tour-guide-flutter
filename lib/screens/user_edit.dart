import 'package:virtual_tour_guide_manager/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/bloc/room/room_bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/models/room.dart';
import 'package:virtual_tour_guide_manager/data/users/bloc/user_bloc.dart';
import 'package:virtual_tour_guide_manager/data/users/model/user.dart';
import 'package:virtual_tour_guide_manager/util/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserEdit extends StatefulWidget {
  static const routeName = '/userEdit';
  User user;
  UserEdit({Key? key, required this.user}) : super(key: key);

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  late String _userName;
  late String _email;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _email = widget.user.email;
    _userName = widget.user.name;

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
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                print("checking listener state " + state.toString());
                if (state is UserDetailLoaded) {
                  print("state is UserDetailloaded " + state.toString());

                 
                  Navigator.pop(context, state.user);
                } else if (state is ErrorUserDetail) {
                  print("error state " + state.message.toString());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    "User #$_userName",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
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
                                // "User #1223",
                                "User #${_userName}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // OutlinedButton(
                              //   style: OutlinedButton.styleFrom(
                              //     backgroundColor: _isOccupied
                              //         ? const Color(0x408A77FF)
                              //         : const Color(0x40F9C35C),
                              //   ),
                              //   child: Text(
                              //     _isOccupied ? "occupied" : "unoccupied",
                              //     style: TextStyle(
                              //         color: _isOccupied
                              //             ? const Color(0xFFB4ADFF)
                              //             : const Color(0xFFF9C35C)),
                              //   ),
                              //   onPressed: () {
                              //     setState(() {
                              //       _isOccupied = !_isOccupied;
                              //     });
                              //   },
                              // ),
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
                                        "User Name",
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
                                      key: const Key("userNameField"),
                                      initialValue: '$_userName',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      enabled:  true ,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        _userName = value;
                                        print("new userName " + _userName);
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
                                        "User Email",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
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
                                      key: const Key("emailField"),
                                      initialValue: '$_email',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      enabled:  true ,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        _email = value;
                                        print("new email " + _email);
                                      },
                                      validator: (value) =>
                                          Validators.validateEmail(value)
                                              ?.toString(),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  
                                ]),
                          ),
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              key: const Key("editUserSaveButton"),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFF9C35C),
                                // fixedSize: Size(243, 41),
                                fixedSize: const Size(200, 34),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  // print("save changes clicked and valid ");
                                  BlocProvider.of<UserBloc>(context).add(
                                    UpdateUserDetailEvent(
                                      userId: widget.user.id,
                                      userName: _userName,
                                     email: _email
                                    ),
                                  );
                                }
                              },
                              child: BlocBuilder<UserBloc, UserState>(
                                builder: (context, state) {
                                  if (state is UserDetailLoading) {
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
