import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:sanberapp/FinalProject/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return ProgressHUD(
      child: Builder(
        builder: (context) => Scaffold(
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
                    child: buildContent(screenWidth, context),
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
                    child: buildContent(screenWidth, context),
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildContent(double screenWidth, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100.0),
          Text(
            'Register Here',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1CB6D),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Text(
            'Create an account so you can explore all the existing News',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.0),
          Container(
            constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
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
          SizedBox(height: 60.0),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await _register(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF1CB6D),
              ),
              child: Text(
                'Register',
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
                  MaterialPageRoute(builder: (context) => LoginPageStart()),
                );
                // TODO: Implement Register functionality
              },
              child: Text(
                'Have an account? Login',
                style: TextStyle(color: Color(0xFFF1CB6D)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress?.show();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPageStart()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      progress?.dismiss();
    }
  }
}
