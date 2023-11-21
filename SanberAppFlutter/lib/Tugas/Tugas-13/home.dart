import 'package:flutter/material.dart';
import 'package:sanberapp/Tugas/Tugas-13/Card/profile.dart';
import 'package:sanberapp/Tugas/Tugas-13/Card/trending.dart';
import 'package:sanberapp/Tugas/Tugas-13/Card/category.dart';

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
        body: Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 30),
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
