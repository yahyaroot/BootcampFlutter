import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> news = [];
  String selectedCategory = 'entertainment'; // Default category

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$selectedCategory&apiKey=19d44e54dca04f49a8d4987d3db5d69c'));
    if (response.statusCode == 200) {
      // Check if 'articles' key is present in the response
      final Map<String, dynamic>? data = json.decode(response.body);
      if (data != null && data.containsKey('articles')) {
        setState(() {
          // Filter out articles without a description
          news = data['articles']
              .where((article) => article['description'] != null)
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
  }

  void onCategoryChanged(String? category) {
    if (category != null) {
      setState(() {
        selectedCategory = category;
      });
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App - Indonesia'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              items: [
                'business',
                'entertainment',
                'health',
                'science',
                'sports',
                'technology',
              ].map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: onCategoryChanged,
            ),
          ),
          Expanded(
            child: news.isEmpty
                ? Center(child: Text('No articles available'))
                : ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      DateTime publishedAt =
                          DateTime.parse(news[index]['publishedAt']);
                      String formattedDate =
                          DateFormat('d MMMM y').format(publishedAt);

                      return ListTile(
                        title:
                            Text(news[index]['title'] ?? 'No title available'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(news[index]['description'] ??
                                'No description available'),
                            Text(
                                'Author: ${news[index]['author'] ?? 'Unknown author'}'),
                            Text('Published at: $formattedDate'),
                            if (news[index]['urlToImage'] != null)
                              Image.network(
                                news[index]['urlToImage'],
                                height:
                                    100, // Set the height as per your requirement
                              ),
                          ],
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
