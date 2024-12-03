import 'dart:convert';
import 'package:http/http.dart' as http;

class TmdbService {
  final String apiKey = '9819bd3a1e544642d499ce90a5733109'; // Buraya kendi TMDb API anahtarınızı yazın.
  final String baseUrl = 'https://api.themoviedb.org/3';

  //    CATEGORY
  Future<Map<String, dynamic>> fetchMoviesByCategory(String category) async {
    final url = Uri.parse('$baseUrl/movie/$category?api_key=$apiKey');
    
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Filmler yüklenemedi: ${response.statusCode}');
    }
  }
  


  //      TOP GENRE
  Future<Map<String, dynamic>> fetchPopularMoviesByGenre(int genreId) async {
    final url = Uri.parse('$baseUrl/discover/movie?api_key=$apiKey&sort_by=popularity.desc&with_genres=$genreId');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Filmler yüklenemedi: ${response.statusCode}');
    }
  }


//      RATING ANd GENRE
Future<Map<String, dynamic>> fetchMoviesByGenreAndRating(int genreId, double minRating) async {
  final url = Uri.parse('$baseUrl/discover/movie?api_key=$apiKey&sort_by=popularity.desc&with_genres=$genreId&vote_average.gte=$minRating');
  
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Filmler yüklenemedi: ${response.statusCode}');
  }
}



//      BY DATE AND GENRE
Future<Map<String, dynamic>> fetchMoviesByGenreAndReleaseDate(int genreId, String startDate, String endDate) async {
  final url = Uri.parse('$baseUrl/discover/movie?api_key=$apiKey&with_genres=$genreId&primary_release_date.gte=$startDate&primary_release_date.lte=$endDate');
  
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Filmler yüklenemedi: ${response.statusCode}');
  }
}

  
//      BY LIST ID
Future<Map<String, dynamic>> fetchList(int listId) async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/list/$listId?api_key=$apiKey'));
    
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load list');
  }
}


  // MOVIE INFORMATION
  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    final url = Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey');
    
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Film detayları alınamadı: ${response.statusCode}');
    }
  }




}
