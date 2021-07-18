import 'package:flutter/material.dart';
import 'package:my_notes/models/user.dart';
import 'package:my_notes/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //print(user);
    // return either the Home or Authenticate widget
    if (user == null) {
      print("User painai");
      return Authenticate();
    } else {
      print("User paiche mui");
      return Home();
    }
  }
}
