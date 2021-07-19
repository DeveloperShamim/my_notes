import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_notes/components/background.dart';
import 'package:my_notes/components/customAlertDialog.dart';
import 'package:my_notes/components/rounded_button.dart';
import 'package:my_notes/components/rounded_input_field.dart';
import 'package:my_notes/components/rounded_password_field.dart';
import 'package:my_notes/services/auth.dart';
import 'package:my_notes/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _fromKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            body: Background(
              child: SingleChildScrollView(
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SvgPicture.asset(
                        "assets/icons/login.svg",
                        height: size.height * 0.35,
                      ),
                      SizedBox(height: size.height * 0.03),
                      RoundedInputField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter correct email' : null,
                        hintText: "Your Email",
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      RoundedPasswordField(
                        validator: (value) => value.length < 5
                            ? 'Password should be minimum 6 charecter'
                            : null,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      RoundedButton(
                        text: "Sign up",
                        press: () async {
                          if (_fromKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic results = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (results == null) {
                              setState(() {
                                loading = false;
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialog();
                                    });

                                error = "Please ented valid";
                              });
                            } else {}
                          } else {
                            print("False");
                          }
                        },
                      ),
                      RoundedButton(
                        text: "Already have an account",
                        press: () {
                          widget.toggleView();
                        },
                      ),
                      Text(error),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
