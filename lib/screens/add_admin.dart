import 'package:ar_indoor_nav_admin/data/account/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/util/validators/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddAdminPage extends StatelessWidget {
  static const routeName = "/newAdmin";
  final _formKey = GlobalKey<FormState>();

  AddAdminPage({Key? key}) : super(key: key);

  String _name = "";
  String _email = "";
  String _password = "";
  String _buildingId = "";
  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(" final name " +
          _name +
          " final email " +
          _email +
          " final password " +
          _password);
      BlocProvider.of<SignUpBloc>(context).add(SignUpEvent(
          name: _name,
          email: _email,
          password: _password,
          buildingId: _buildingId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignedUpState) {
          Navigator.of(context).pop();
        } else if (state is ErrorSignUpState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error signing up: ${state.message}"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0x1A1820FF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              const Image(
                image: AssetImage("assets/images/LockIcon.png"),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Add New Admin",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(height: 25),
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
                            "Name",
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0x1AC4C4C4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          initialValue: '',
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            // hintStyle: TextStyle(color: Colors.white),
                            // hintText: 'Name',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _name = value;
                            print("new name " + _name);
                          },
                          validator: (value) =>
                              Validators.validateName(value)?.toString(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Building",
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0x1AC4C4C4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          initialValue: '',
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            // hintStyle: TextStyle(color: Colors.white),
                            // hintText: 'Email Address',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _buildingId = value;
                          },
                          // validator: (value) =>
                          //     Validators.validateName(value)?.toString(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Email",
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0x1AC4C4C4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          initialValue: '',
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            // hintStyle: TextStyle(color: Colors.white),
                            // hintText: 'Email Address',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _email = value;
                            print("new emaillll " + _email);
                          },
                          validator: (value) =>
                              Validators.validateEmail(value)?.toString(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Password",
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0x1AC4C4C4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          initialValue: '',
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            // hintText: 'Password',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _password = value;
                            print("new passwordddd " + _password);
                          },
                          // validator: (value) =>
                          //     Validators.validatePassword(value)?.toString(),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFF9C35C),
                    fixedSize: const Size(243, 41),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(BuildingList.routeName);
                    _onSubmit(context);
                  },
                  child: BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state is SigningUpState) {
                        return const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        );
                      }
                      return const Text(
                        "Add Admin",
                        style: TextStyle(
                          color: Color(0xFF1A1820),
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
    );
  }
}
