import 'package:virtual_tour_guide_manager/data/account/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/util/validators/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  String _email = "";
  String _password = "";

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("final email " + _email + " final password " + _password);
      BlocProvider.of<LoginBloc>(context)
          .add(LoginEvent(email: _email, password: _password));
    
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoggedInState) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationEvent.authenticate);
        } else if (state is ErrorLoggingInState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.message}"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
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
                  "Welcome",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF41415F),
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
                            "Email",
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      // fontSize: screenHeight * 0.021,
                                      fontSize: 14,
                                      color: const Color(0xFF41415F),
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
                          color: const Color(0xFFffffff),
                          border: Border.all(
                            color: const Color(0xFF41415F),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          key: const Key("emailField"),
                          initialValue: '',
                          style: const TextStyle(
                            color: const Color(0xFF41415F),
                          ),
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
                              color: const Color(0xFF41415F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          border: Border.all(
                            color: const Color(0xFF41415F),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          key: const Key("passwordField"),
                          initialValue: '',
                          style: const TextStyle(
                            color: const Color(0xFF41415F),
                          ),
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
                  key: const Key("loginButton"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFF9C35C),
                    fixedSize: const Size(243, 41),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(BuildingList.routeName);
                    _onSubmit(context);
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoggingInState) {
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
                        "Login",
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
