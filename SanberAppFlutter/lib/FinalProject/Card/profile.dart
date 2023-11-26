import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    String userEmail = currentUser?.email ?? 'N/A';

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/myfoto.png'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 7), // Add
              Text(
                'Ready To Read News?',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Montserrat', color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
