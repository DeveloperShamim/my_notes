import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_notes/components/background.dart';
import 'package:my_notes/components/customAlertDialog.dart';
import 'package:my_notes/components/rounded_button.dart';
import 'package:my_notes/components/rounded_input_field.dart';
import 'package:my_notes/components/rounded_password_field.dart';
import 'package:my_notes/services/auth.dart';
import 'package:my_notes/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                        "Sign In",
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
                        validator: (value) => value.length < 5 ? 'pass' : null,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      RoundedButton(
                        text: "Login",
                        press: () async {
                          if (_fromKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);

                            if (result == null) {
                              loading = false;
                              setState(() {
                                //error = "Email or password are incorrect";
                                loading = false;
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialog();
                                    });
                              });

                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result.uid);
                            }

                            ;
                          } else {
                            print("False");
                          }
                        },
                      ),
                      RoundedButton(
                        text: "Create an account ",
                        press: () {
                          widget.toggleView();
                        },
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.signInAnon();

                          if (result == null) {
                            setState(() {
                              loading = false;
                            });

                            print('error signing in');
                          } else {
                            print('signed in');
                            print(result.uid);
                          }
                        },
                        child: new Text("Sign in anno"),
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
