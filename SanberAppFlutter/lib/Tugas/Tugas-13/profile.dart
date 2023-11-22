// profile_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanberapp/Tugas/Tugas-13/login.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _Signout() async {
      await FirebaseAuth.instance.signOut();
    }

    return Hero(
      tag: 'profile_screen',
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Screen Content'),
            SizedBox(height: 20), // Add some space between text and button
            ElevatedButton(
              onPressed: () {
                _Signout().then((value) => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginPageStart())));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF1CB6D), // Set the background color to green
              ),
              child: Text(
                'Login',
                style:
                    TextStyle(color: Colors.black), // Set the text color to red
              ),
            ),
          ],
        ),
      ),
    );
  }
}
