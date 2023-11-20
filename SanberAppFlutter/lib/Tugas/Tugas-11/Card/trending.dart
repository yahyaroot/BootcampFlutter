import 'package:flutter/material.dart';

class TrendingWidget extends StatelessWidget {
  // Replace this list with your list of image asset paths
  final List<String> trendingImages = [
    'assets/images/woman-1.png',
    'assets/images/woman-2.png',
    'assets/images/woman-3.png',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Trending',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1CB6D),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      trendingImages[index],
                      width: 330, // Adjust the width as needed
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
