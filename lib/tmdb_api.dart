import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<List<dynamic>> getPopularMovies({int page = 1}) async {
//   var apiKey = '6167804b216e79bd25e8a4d18b55108c';
//   final response = await http.get(
//     Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&page=$page'),
//   );
//
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     return jsonResponse['results'];
//   } else {
//     throw Exception('Failed to load popular movies');
//   }
// }

class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final String overview;
  final String releaseDate;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.overview,
    required this.releaseDate,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      releaseDate: json['release_date'],
      rating: json['vote_average'].toDouble(),
    );
  }

  String get releaseYear => releaseDate.substring(0, 4);

  String get ratingText => '$rating/10';
}




class Movies {
  static const apiKey = '6167804b216e79bd25e8a4d18b55108c';
  static const apiUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$apiUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final moviesData = jsonData['results'] as List;
      return moviesData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

// class Cast {
//   final int id;
//   final String name;
//   final String character;
//   final String profileUrl;

//   Cast({required this.id, required this.name, required this.character, required this.profileUrl});
//
//   factory Cast.fromJson(Map<String, dynamic> json) {
//     return Cast(
//       id: json['id'],
//       name: json['name'],
//       character: json['character'],
//       profileUrl: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
//     );
//   }
//
//   static Future<List<Cast>> getMovieCast(int movieId) async {
//     final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=6167804b216e79bd25e8a4d18b55108c&language=en-US'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final castData = jsonData['cast'] as List;
//       return castData.map((cast) => Cast.fromJson(cast)).toList();
//     } else {
//       throw Exception('Failed to load cast');
//     }
//   }
// }


// class Actor {
//   final int id;
//   final String name;
//   final String profileUrl;
//
//   Actor({required this.id, required this.name, required this.profileUrl});
//
//   factory Actor.fromJson(Map<String, dynamic> json) {
//     return Actor(
//       id: json['id'],
//       name: json['name'],
//       profileUrl: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
//     );
//   }
// }
//
// Future<List<Actor>> getCast(int movieId) async {
//   var apiKey = 'your_api_key';
//   final response = await http.get(
//     Uri.parse('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey'),
//   );
//
//   if (response.statusCode == 200) {
//     final jsonData = json.decode(response.body);
//     final castData = jsonData['cast'] as List;
//     return castData.map((actor) => Actor.fromJson(actor)).toList();
//   } else {
//     throw Exception('Failed to load cast');
//   }
// }


