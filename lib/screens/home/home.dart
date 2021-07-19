import 'package:flutter/material.dart';
import 'package:my_notes/components/background.dart';
import 'package:my_notes/models/user.dart';
import 'package:my_notes/services/auth.dart';
import 'package:my_notes/shared/constants.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
      body: Background(
        child: Container(
          child: SafeArea(
              child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                child: Text(user.uid),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
