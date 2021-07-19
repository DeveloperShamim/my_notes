import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_notes/components/background.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      child: Container(
        child: Center(
          child: SpinKitCircle(
            color: Colors.blue,
            size: 100,
          ),
        ),
      ),
    ));
  }
}
