// profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'profile_screen',
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Text('Profile Screen Content'),
          ],
        ),
      ),
    );
  }
}
