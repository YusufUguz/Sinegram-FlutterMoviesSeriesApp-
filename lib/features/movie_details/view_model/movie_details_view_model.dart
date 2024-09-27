import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_and_series_app/core/constants/api_config.dart';
import 'package:movies_and_series_app/core/model/movie_credits_model.dart';
import 'package:movies_and_series_app/core/model/movie_details_model.dart';

class MovieDetailsViewModel {
  Future<List<MovieCredits>> fetchMovieCredits(int movieID) async {
    final http.Response response;
    response = await http.get(Uri.parse(
        "${ApiConfig.baseUrl}/movie/$movieID/credits?api_key=${ApiConfig.apiKey}&language=tr-TR"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data['cast'];

      return results.map((json) => MovieCredits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movie credits');
    }
  }

  Future<MovieDetails> fetchMovieDetails(int movieId) async {
    final http.Response response;
    response = await http.get(Uri.parse(
        '${ApiConfig.baseUrl}/movie/$movieId?api_key=${ApiConfig.apiKey}&language=tr-TR'));

    if (response.statusCode == 200) {
      return MovieDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
