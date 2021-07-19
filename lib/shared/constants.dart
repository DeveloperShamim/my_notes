import 'package:flutter/material.dart';

const kMainColor = Colors.blue;
const kPrimaryColor = Colors.pinkAccent;

const kPrimaryLightColor = Color(0xFF1E7783);

var boxDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xFF1D7D87),
        Color(0xFF305678),
        Color(0xFF4E4879),
        Color(0xFF5F467D),
        Color(0xFF674B7C),
      ]),
);
var appBardeco = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Colors.purple,
        Colors.red,
      ]),
);
