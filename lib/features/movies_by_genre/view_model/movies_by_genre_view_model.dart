import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/movie_model.dart';

class MoviesByGenreViewModel {
  Future<List<Movie>> fetchMoviesForPage(
      int page, List<int> selectedGenreIds) async {
    final response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/discover/movie?api_key=${ApiConfig.apiKey}&include_adult=false&language=tr-TR&sort_by=vote_count.desc&without_genres=10770%2C10402%2C10751&page=$page',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      List<Movie> movies = results.map((json) => Movie.fromJson(json)).toList();
      List<Movie> filteredMovies = [];

      for (var movie in movies) {
        if (movie.genreIds.any((id) => selectedGenreIds.contains(id))) {
          filteredMovies.add(movie);
        }
      }

      return filteredMovies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
