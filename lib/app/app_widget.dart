import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Shop',
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        accentColor: Colors.blueGrey[800],
      ),
    ).modular();
  }
}
