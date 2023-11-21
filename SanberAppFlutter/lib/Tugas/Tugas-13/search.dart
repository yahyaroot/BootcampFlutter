// search_screen.dart
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            // Your search bar implementation
            TextField(
              style: TextStyle(
                  color: Colors.black, // Change text color
                  fontSize: 16.0,
                  fontFamily: 'Montserrat'
                  // Change text size
                  ),
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFF1CB6D)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
            SizedBox(height: 20),
            // Additional content for the search screen
            Text(
              'Not Found',
              style: TextStyle(
                fontSize: 18.0, // Change content text size
                fontWeight: FontWeight.bold, // Change content text weight
                color: Colors.black, // Change content text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
