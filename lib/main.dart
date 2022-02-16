import 'package:blueearth/pages/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
  ));
}
