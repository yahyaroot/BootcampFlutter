import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sanberapp/FinalProject/Card/profile.dart';
import 'package:sanberapp/FinalProject/detail.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Builder(
        builder: (context) => Scaffold(
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
          ),
        ),
      ),
    );
  }
}

class TrendingWidget extends StatefulWidget {
  @override
  _TrendingWidgetState createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  List<dynamic> trendingNews = [];

  @override
  void initState() {
    super.initState();
    fetchTrendingNews();
  }

  Future<void> fetchTrendingNews() async {
    // Fetch trending news from the API without specifying a category
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=19d44e54dca04f49a8d4987d3db5d69c'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data.containsKey('articles')) {
        setState(() {
          trendingNews = data['articles']
              .where((article) =>
                  article['description'] != null &&
                  article['urlToImage'] != null)
              .toList();
        });
      } else {
        throw Exception('Articles not found in the response');
      }
    } else {
      throw Exception('Failed to load trending news');
    }
  }

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
              itemCount: trendingNews.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the DetailPage with the corresponding details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          imageUrl: trendingNews[index]['urlToImage'],
                          title: trendingNews[index]['title'] ??
                              'No title available',
                          description: trendingNews[index]['description'] ??
                              'No description available',
                          publishDate: DateTime.parse(
                              trendingNews[index]['publishedAt']),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        trendingNews[index]['urlToImage'],
                        width: 330, // Adjust the width as needed
                        height: 200,
                        fit: BoxFit.cover,
                      ),
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

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  List<dynamic> categoryNews = [];
  String selectedCategory = 'all'; // Default category
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 4); // Change length to 4
    fetchData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void onCategoryChanged(String category) {
    if (category != selectedCategory) {
      setState(() {
        selectedCategory = category;
      });

      if (category == 'all') {
        // Fetch news from all categories
        fetchAllCategoriesData();
      } else {
        // Fetch news for the selected category
        fetchData();
      }
    }
  }

  Future<void> fetchAllCategoriesData() async {
    final progress = ProgressHUD.of(context);

    try {
      progress?.show();

      // Fetch data for each category (health, science, and sports)
      final healthResponse = await fetchDataForCategory('health');
      final scienceResponse = await fetchDataForCategory('science');
      final sportsResponse = await fetchDataForCategory('sports');

      // Combine the news from all categories
      List<dynamic> allCategoriesNews = [];
      if (healthResponse != null) {
        allCategoriesNews.addAll(healthResponse);
      }
      if (scienceResponse != null) {
        allCategoriesNews.addAll(scienceResponse);
      }
      if (sportsResponse != null) {
        allCategoriesNews.addAll(sportsResponse);
      }

      // Shuffle the combined news
      allCategoriesNews.shuffle();

      // Take only the first 6 items
      List<dynamic> selectedItems = allCategoriesNews.take(6).toList();

      setState(() {
        categoryNews = selectedItems;
      });
    } catch (e) {
      // Handle errors
    } finally {
      progress?.dismiss();
    }
  }

  Future<List<dynamic>?> fetchDataForCategory(String category) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=19d44e54dca04f49a8d4987d3db5d69c'));

    if (response.statusCode == 200) {
      final Map<String, dynamic>? data = json.decode(response.body);

      if (data != null && data.containsKey('articles')) {
        // Filter out articles without a description and image URL
        return data['articles']
            .where((article) =>
                article['description'] != null && article['urlToImage'] != null)
            .toList();
      } else {
        throw Exception('Articles not found in the response');
      }
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load news');
    }
  }

  Future<void> fetchData() async {
    final progress = ProgressHUD.of(context);

    try {
      progress?.show();

      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$selectedCategory&apiKey=19d44e54dca04f49a8d4987d3db5d69c'));

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = json.decode(response.body);

        if (data != null && data.containsKey('articles')) {
          setState(() {
            // Filter out articles without a description and image URL
            categoryNews = data['articles']
                .where((article) =>
                    article['description'] != null &&
                    article['urlToImage'] != null)
                .toList();
          });
        } else {
          throw Exception('Articles not found in the response');
        }
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load news');
      }
    } catch (e) {
      // Handle errors
    } finally {
      progress?.dismiss();
    }
  }

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
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Let's select the news category you like",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 20),
          DefaultTabController(
            length: 4, // Change length to 4
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Health',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Science',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Sport',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  onTap: (index) {
                    onCategoryChanged(getCategoryByIndex(index));
                  },
                ),
                SizedBox(height: 10),
                // Instead of TabBarView, use a ListView
                Container(
                  height: 200,
                  child: ListView(
                    children: [
                      for (int i = 0; i < categoryNews.length; i++)
                        buildCategoryContentCard(i),
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

  String getCategoryByIndex(int index) {
    switch (index) {
      case 0:
        return 'all';
      case 1:
        return 'health';
      case 2:
        return 'science';
      case 3:
        return 'sports';
      default:
        return 'all';
    }
  }

  Widget buildCategoryContentCard(int index) {
    String title = 'Loading...';
    String description = 'Loading...';
    IconData icon = Icons.access_time;
    String time = 'Loading...';
    String imageUrl = 'assets/images/image_blog.png';

    if (categoryNews.length > index) {
      DateTime publishedAt = DateTime.parse(categoryNews[index]['publishedAt']);
      title = categoryNews[index]['title'] ?? 'No title available';
      description =
          categoryNews[index]['description'] ?? 'No description available';
      time = DateFormat('d MMMM y').format(publishedAt);
      imageUrl =
          categoryNews[index]['urlToImage'] ?? 'assets/images/image_blog.png';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imageUrl: imageUrl,
              title: title,
              description: description,
              publishDate: DateTime.parse(categoryNews[index]['publishedAt']),
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
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
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 120,
                    ),
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
