// profile_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanberapp/FinalProject/login.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _Signout() async {
      await FirebaseAuth.instance.signOut();
    }

    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    String userEmail = currentUser?.email ?? 'N/A';

    return Hero(
      tag: 'profile_screen',
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/images/profile_foto.png'), // Set your image path
                ),
                SizedBox(height: 10),

                // Name
                Text(
                  'Amri Yahya',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Email
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 30),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Skills',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius:
                        BorderRadius.circular(15), // Adjust the value as needed
                  ),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/fluter_image.png',
                                    width: 50, height: 50),
                                Image.asset('assets/images/js_image.png',
                                    width: 50, height: 50),
                                Image.asset('assets/images/mysql_image.png',
                                    width: 50, height: 50),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/figma_image.png',
                                    width: 50, height: 50),
                                Image.asset('assets/images/Tailwind_image.png',
                                    width: 50, height: 50),
                                Image.asset('assets/images/vue_image.png',
                                    width: 50, height: 50),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Add some space between text and button
                ElevatedButton(
                  onPressed: () {
                    _Signout().then((value) => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPageStart())));
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color(0xFFF1CB6D), // Set the background color to green
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black), // Set the text color to red
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
