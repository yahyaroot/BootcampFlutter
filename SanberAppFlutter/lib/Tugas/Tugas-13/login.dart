import 'package:flutter/material.dart';
import 'package:sanberapp/Tugas/Tugas-13/Controller/navbar.dart';
import 'package:sanberapp/Tugas/Tugas-13/register.dart';

class LoginPageStart extends StatefulWidget {
  @override
  _LoginPageStartState createState() => _LoginPageStartState();
}

class _LoginPageStartState extends State<LoginPageStart> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: isPortrait
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_app.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: buildContent(screenWidth),
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_app.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: buildContent(screenWidth),
              ),
            ),
    );
  }

  Widget buildContent(double screenWidth) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100.0),
          Text(
            'Login Here',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1CB6D),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Text(
            'Welcome back you’ve been missed!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.0),
          Container(
            constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
            // Adjusted constraints for the email field
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xFFF1CB6D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF1CB6D), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
            // Adjusted constraints for the password field
            child: TextField(
              controller: _passwordController,
              obscureText: _isObscured,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color(0xFFF1CB6D),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF1CB6D), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFF1CB6D),
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 30.0),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // TODO: Implement Forgot Password functionality
              },
              child: Text('Forgot Password?',
                  style: TextStyle(color: Color(0xFFF1CB6D))),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage()), // Replace with your RegisterPage class
                );
                // TODO: Implement Login functionality
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF1CB6D),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RegisterPage()), // Replace with your RegisterPage class
                );
                // TODO: Implement Register functionality
              },
              child: Text(
                'Don\'t have an account? Register',
                style: TextStyle(color: Color(0xFFF1CB6D)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
