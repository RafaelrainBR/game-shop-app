import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/home/home_screen.dart';

//void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game Shop',
        theme: ThemeData(
          primaryColor: Colors.indigo[800],
          accentColor: Colors.blueGrey[800],
        ),
        home: HomeScreen(),
      ),
    );
