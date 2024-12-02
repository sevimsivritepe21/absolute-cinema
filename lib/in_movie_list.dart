// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';


String apiKey = '9819bd3a1e544642d499ce90a5733109';


  Future<List<dynamic>> fetchList2(int listId) async {
    int page = 1;
    bool isLastPage = false;
    List<dynamic> allItems = [];

    while (!isLastPage) {
      final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/list/$listId?api_key=$apiKey&page=$page')
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List<dynamic>;

        allItems.addAll(items);

        // Eğer dönen öğe sayısı 20'den azsa son sayfaya gelinmiştir
        if (items.length < 20) {
          isLastPage = true;
        } else {
          page++;
        }
      } else {
        throw Exception('Liste yüklenemedi');
      }
    }
    return allItems;
  }

class MoviesListPage extends StatelessWidget {
  final int listId;
  final String title;

  MoviesListPage({required this.listId, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 67, 47, 37), 
        title: Text(
          title,
          style: GoogleFonts.tiltWarp(
          color: Color.fromARGB(255, 218, 212, 181),
          fontSize: 19
        ),),
        iconTheme: IconThemeData( 
           color: Color.fromARGB(255, 218, 212, 181),),    
      ),
  body: Container(
    color: Color.fromARGB(255, 232, 208, 179),
    //padding: const EdgeInsets.only(top: 5.0), // Üst boşluk
    child: FutureBuilder<List<dynamic>>(
      future: fetchList2(listId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
        } else {
          final movies = snapshot.data;
          if (movies == null || movies.isEmpty) {
            return Center(child: Text('Film bulunamadı.'));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.65,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              final posterPath = movie['poster_path'];
              final imageUrl = posterPath != null
                  ? 'https://image.tmdb.org/t/p/w500$posterPath'
                  : null;

              return imageUrl != null
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.image_not_supported);
            },
          );
        }
      },
    ),
  ),
 );
}
}

