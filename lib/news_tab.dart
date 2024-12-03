// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class MovieNewsPage extends StatefulWidget {
  @override
  _MovieNewsPageState createState() => _MovieNewsPageState();
}

class _MovieNewsPageState extends State<MovieNewsPage> {
  List<dynamic> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovieNews();
  }

  Future<void> fetchMovieNews() async {
    final String apiKey = '2bd77b47d7b04fea90fea41059807e66'; 
    final String apiUrl = 'https://newsapi.org/v2/everything?q=movie&language=en&pageSize=35&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          articles = data['articles'];
          isLoading = false;
        });
      } else {
        throw Exception('API isteği başarısız oldu.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 31, 26), 
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                final imageUrl = article['urlToImage'] ??
                    'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTk3MG0wMW5neHl0NnpobWJ2cnc3cml5aWgzOHFneTY3Zm8zdGZ6ZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6uGhT1O4sxpi8/giphy.webp'; // Görsel eksikse varsayılan görsel
                final title = article['title'] ?? 'opps';



                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8), 
                  color: Colors.brown[100], 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7), 
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: GoogleFonts.tiltWarp(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  );
              },
            ),
    );
  }
}
