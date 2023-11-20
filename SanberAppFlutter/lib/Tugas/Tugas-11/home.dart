import 'package:flutter/material.dart';
import 'package:sanberapp/Tugas/Tugas-11/Card/profile.dart';
import 'package:sanberapp/Tugas/Tugas-11/Card/trending.dart';
import 'package:sanberapp/Tugas/Tugas-11/Card/category.dart';
import 'package:sanberapp/Tugas/Tugas-11/drawerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: DrawerScreen(),
        body: Container(
          color: Colors.white,
          // margin: EdgeInsets.only(top: 30),
          child: ListView(
            children: [
              SizedBox(height: 20),
              ProfileWidget(),
              SizedBox(height: 20),
              TrendingWidget(),
              SizedBox(height: 20),
              CategoryWidget(),
            ],
          ),
        ));
  }
}
