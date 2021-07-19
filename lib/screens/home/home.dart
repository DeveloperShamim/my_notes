import 'package:flutter/material.dart';
import 'package:my_notes/services/auth.dart';

import '../../constants.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: appBardeco,
        ),
        title: Text("My Notes"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        decoration: boxDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(),
        ),
      )),
    );
  }
}
