import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(height: 10),
          Text(
            "Let's select the news category you like",
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontFamily: 'Montserrat'),
          ),
          SizedBox(height: 20),
          DefaultTabController(
            length: 4, // Number of tabs
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Color(0xFFF1CB6D),
                  tabs: [
                    Container(
                      child: Text(
                        'All',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Health',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Sport',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Other',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 200, // Adjust the height as needed
                  child: TabBarView(
                    children: [
                      // Content for 'All' category
                      buildCategoryContentCard(
                        title: 'Tips Sehat',
                        description: 'News description goes here.',
                        icon: Icons.access_time,
                        time: '2 hours ago',
                        imageUrl: 'assets/images/image_blog.png',
                      ),
                      // Content for 'Health' category
                      buildCategoryContentCard(
                        title: 'Health News',
                        description: 'Health news description goes here.',
                        icon: Icons.access_time,
                        time: '1 hour ago',
                        imageUrl: 'assets/images/image_blog.png',
                      ),
                      // Content for 'Sport' category
                      buildCategoryContentCard(
                        title: 'Sport News',
                        description: 'Sport news description goes here.',
                        icon: Icons.access_time,
                        time: '3 hours ago',
                        imageUrl: 'assets/images/image_blog.png',
                      ),
                      // Content for 'Other' category
                      buildCategoryContentCard(
                        title: 'Other News',
                        description: 'Other news description goes here.',
                        icon: Icons.access_time,
                        time: '4 hours ago',
                        imageUrl: 'assets/images/image_blog.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryContentCard({
    required String title,
    required String description,
    required IconData icon,
    required String time,
    required String imageUrl,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Set border radius
          border: Border.all(
            color: Colors.grey.withOpacity(0.2), // Set border color
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Colors.grey
                          // You can add more styling properties here
                          ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.grey
                              // You can add more styling properties here
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
