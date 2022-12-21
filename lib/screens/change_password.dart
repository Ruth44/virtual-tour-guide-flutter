import 'package:ar_indoor_nav_admin/data/account/bloc/change_password/bloc/bloc/change_password_bloc.dart';
import 'package:ar_indoor_nav_admin/util/validators/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  static const routeName = "/changePassword";
  final _formKey = GlobalKey<FormState>();

  ChangePassword({Key? key}) : super(key: key);

  String _oldPassword = "";
  String _newPassword = "";

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("final old password " +
          _oldPassword +
          " final new password " +
          _newPassword);
      BlocProvider.of<ChangePasswordBloc>(context).add(
        ChangePasswordSubmitEvent(
          oldPassword: _oldPassword,
          newPassword: _newPassword,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          Navigator.of(context).pop();
        } else if (state is ChangePasswordErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              // content: Text("Error changing password"),
              content: state.message != ""
                  ? Text("${state.message}")
                  : const Text("error"),
            ),
          );
        }
      },
      child: Scaffold(
        // backgroundColor: const Color(0x1A1820FF),
        backgroundColor: const Color(0xFF1A1820),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Change Password",
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
                            "Old password",
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
                            // hintText: 'Old Password',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _oldPassword = value;
                            print("updated oldPassword " + _oldPassword);
                          },
                          // validator: (value) =>
                          //     Validators.validatePassword(value)?.toString(),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "New password",
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
                            _newPassword = value;
                            print("updated newPassword " + _newPassword);
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
                  child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                    builder: (context, state) {
                      if (state is ChangePasswordLoading) {
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
                        "Change password",
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
